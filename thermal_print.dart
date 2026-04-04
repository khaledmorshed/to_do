import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'dart:ui' as ui;
import 'package:image/image.dart' as img;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey _globalKey = GlobalKey();
  List<BluetoothInfo> items = [];
  String paperSize = "58 mm";
  List<String> paperOptions = ["58 mm", "80 mm"];
  final List<String> _options = ["permission bluetooth granted", "bluetooth enabled", "connection status", "update info"];

  bool _progress = false;
  String _msjprogress = "";

  String? selectedMac;

  String _info = "";
  String _msj = '';
  bool connected = false;

  bool _isLoading = true;
  final _txtText = TextEditingController(text: "Hello developer");


  Future<void> requestPermissions() async {
    await [
      Permission.bluetooth,
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.location,
    ].request();
  }

  Future<void> initPlatformState() async {
    try{
      String platformVersion;
      int porcentbatery = 0;
      // Platform messages may fail, so we use a try/catch PlatformException.
      try {
        print("platformVersion..........1");
        platformVersion = await PrintBluetoothThermal.platformVersion;
        print("platformVersion..........2");
        //debugPrint("patformversion: $platformVersion");
        porcentbatery = await PrintBluetoothThermal.batteryLevel;
      } on PlatformException {
        print("PlatformException....................");
        platformVersion = 'Failed to get platform version.';
      }
      print("ttttttttttttt..................");

      // If the widget was removed from the tree while the asynchronous platform
      // message was in flight, we want to discard the reply rather than calling
      // setState to update our non-existent appearance.
      if (!mounted) return;

      final bool result = await PrintBluetoothThermal.bluetoothEnabled;
      debugPrint("bluetooth enabled: $result");
      if (result) {
        _msj = "Bluetooth enabled, please search and connect";
      } else {
        _msj = "Bluetooth not enabled";
      }

      setState(() {
        _info = "$platformVersion ($porcentbatery% battery)";
      });
    }catch(err){
      print("errr................$err");
    }
  }


  Future<void> getBluetoots() async {
    setState(() {
      _progress = true;
      _msjprogress = "Wait";
      items = [];
    });
    try{
      print("test................1");
      final List<BluetoothInfo> listResult = await PrintBluetoothThermal.pairedBluetooths;
      print("test................2");

      /*await Future.forEach(listResult, (BluetoothInfo bluetooth) {
      String name = bluetooth.name;
      String mac = bluetooth.macAdress;
    });*/

      setState(() {
        _progress = false;
      });

      if (listResult.isEmpty) {
        _msj = "There are no bluetoohs linked, go to settings and link the printer";
      } else {
        _msj = "Touch an item in the list to connect";
      }

      setState(() {
        items = listResult;
        _isLoading = false;
        print("item....$items");
      });
    }catch(e){
      print("e............$e");
    }
  }

  Future<void> connect(String mac) async {
    print("test................3");
    setState(() {
      _progress = true;
      _msjprogress = "Connecting...";
      connected = false;
    });
     bool result = await PrintBluetoothThermal.connect(macPrinterAddress: mac);
    selectedMac = mac;

    debugPrint("state conected................ $result");
    if (result) connected = true;
    setState(() {
      _progress = false;
    });
      result = await PrintBluetoothThermal.connectionStatus;
    connected = result;
  }

  init()async{
    await requestPermissions();
    await initPlatformState();
    await getBluetoots();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      init();
    });
  }


  Widget invoicePrintWidget() {
    return Container(
      width: paperSize == "58 mm" ? 384 : 576,
      color: Colors.white,
      padding: const EdgeInsets.all(12),
      child: Material(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Column(
                children: [
                  Text(
                    "Morshed Store",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "মোরশেদ স্টোর",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'NotoSansBengali',
                    ),
                  ),
                  SizedBox(height: 4),
                  Text("Kaliganj, Dhaka"),
                ],
              ),
            ),

            const SizedBox(height: 8),
            const Divider(),

            const Text("Invoice: #12345"),
            const Text("Date: 04-04-2026"),

            const SizedBox(height: 8),

            const Text("Items", style: TextStyle(fontWeight: FontWeight.bold)),

            const SizedBox(height: 5),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Rice"),
                Text("50 Tk"),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                  child: Text(
                    "চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল ",
                    maxLines: 2,
                    style: TextStyle(fontFamily: 'NotoSansBengali'),
                  ),
                ),
                Text("৫০ টাকা", style: TextStyle(fontFamily: 'NotoSansBengali'),),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("বর্গ"),
                Text("120 Tk"),
              ],
            ),

            const Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                  child: Text(
                    "চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল ",
                    maxLines: 2,
                    style: TextStyle(fontFamily: 'NotoSansBengali'),
                  ),
                ),
                Text("৫০ টাকা", style: TextStyle(fontFamily: 'NotoSansBengali'),),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("বর্গ"),
                Text("120 Tk"),
              ],
            ),

            const Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                  child: Text(
                    "চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল ",
                    maxLines: 2,
                    style: TextStyle(fontFamily: 'NotoSansBengali'),
                  ),
                ),
                Text("৫০ টাকা", style: TextStyle(fontFamily: 'NotoSansBengali'),),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("বর্গ"),
                Text("120 Tk"),
              ],
            ),

            const Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                  child: Text(
                    "চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল ",
                    maxLines: 2,
                    style: TextStyle(fontFamily: 'NotoSansBengali'),
                  ),
                ),
                Text("৫০ টাকা", style: TextStyle(fontFamily: 'NotoSansBengali'),),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("বর্গ"),
                Text("120 Tk"),
              ],
            ),

            const Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                  child: Text(
                    "চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল ",
                    maxLines: 2,
                    style: TextStyle(fontFamily: 'NotoSansBengali'),
                  ),
                ),
                Text("৫০ টাকা", style: TextStyle(fontFamily: 'NotoSansBengali'),),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("বর্গ"),
                Text("120 Tk"),
              ],
            ),

            const Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                  child: Text(
                    "চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল চাল ",
                    maxLines: 2,
                    style: TextStyle(fontFamily: 'NotoSansBengali'),
                  ),
                ),
                Text("৫০ টাকা", style: TextStyle(fontFamily: 'NotoSansBengali'),),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("বর্গ"),
                Text("120 Tk"),
              ],
            ),

            const Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Total", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("170 Tk", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),

            const SizedBox(height: 10),

            const Center(child: Text("Thank You")),
            const Center(
              child: Text(
                "ধন্যবাদ",
                style: TextStyle(fontFamily: 'NotoSansBengali'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: [
          PopupMenuButton(
            elevation: 3.2,
            //initialValue: _options[1],
            onCanceled: () {
              debugPrint('You have not chossed anything');
            },
            tooltip: 'Menu',
            onSelected: (Object select) async {
              String sel = select as String;
              if (sel == "permission bluetooth granted") {
                bool status = await PrintBluetoothThermal.isPermissionBluetoothGranted;
                print("status....$status");
                setState(() {
                  _info = "permission bluetooth granted: $status";
                });
                //open setting permision if not granted permision
              } else if (sel == "bluetooth enabled") {
                bool state = await PrintBluetoothThermal.bluetoothEnabled;
                setState(() {
                  _info = "Bluetooth enabled: $state";
                });
              } else if (sel == "update info") {
                initPlatformState();
              } else if (sel == "connection status") {
                final bool result = await PrintBluetoothThermal.connectionStatus;
                connected = result;
                setState(() {
                  _info = "connection status: $result";
                });
              }
            },
            itemBuilder: (BuildContext context) {
              return _options.map((String option) {
                return PopupMenuItem(
                  value: option,
                  child: Text(option),
                );
              }).toList();
            },
          )
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Paper Size Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const Text("Paper Size: "),
                    const SizedBox(width: 10),
                    DropdownButton<String>(
                      value: paperSize,
                      items: paperOptions.map((String option) {
                        return DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() => paperSize = value!);
                      },
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: SizedBox(
                    width: paperSize == "58 mm" ? 384 : 576,
                    child: RepaintBoundary(
                      key: _globalKey,
                      child: invoicePrintWidget(),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Printer Dropdown
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: DropdownButton<String>(
                  hint: const Text("Select Printer"),
                  value: selectedMac,
                  isExpanded: true,
                  items: items.map((d) {
                    return DropdownMenuItem(
                      value: d.macAdress,
                      child: Text(d.name ?? d.macAdress),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) connect(value);
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Print Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: connected ? printAsImage : null,
                child: const Text("Print Test"),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              connected ? "✅ Connected" : "❌ Not Connected",
              style: TextStyle(
                color: connected ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }




  // --- NEW IMAGE BASED PRINTING FOR BANGLA ---

  Future<void> printAsImage() async {
    bool connectionStatus = await PrintBluetoothThermal.connectionStatus;
    if (!connectionStatus) {
      setState(() => _msj = "no connected device");
      return;
    }

    try {
      setState(() {
        _progress = true;
        _msjprogress = "Capturing...";
      });

      // 1. Capture UI
      Uint8List original = await captureImage();

      // 2. Load Profile
      final profile = await CapabilityProfile.load();

      // 3. Process in background
      int targetWidth = paperSize == "58 mm" ? 384 : 576;
      List<int> bytesList = await compute(
        processImageForPrinting,
        {
          'bytes': original,
          'width': targetWidth,
          'profile': profile,
        },
      );

      // 4. Print
      await PrintBluetoothThermal.writeBytes(bytesList);
      setState(() => _msj = "Printed as image");
    } catch (e) {
      debugPrint("Print Error: $e");
      setState(() => _msj = "Error: $e");
    } finally {
      setState(() => _progress = false);
      await Future.delayed(const Duration(seconds: 2));
      // Optionally disconnect if needed
    }
  }

  Future<Uint8List> captureImage() async {
    // Wait for text to render
    await Future.delayed(const Duration(milliseconds: 100));
    RenderRepaintBoundary boundary = _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  static List<int> processImageForPrinting(Map data) {
    Uint8List bytes = data['bytes'];
    int width = data['width'];
    CapabilityProfile profile = data['profile'];

    final image = img.decodeImage(bytes)!;
    final resized = img.copyResize(image, width: width);

    final generator = Generator(width == 384 ? PaperSize.mm58 : PaperSize.mm80, profile);
    List<int> ticket = [];
    ticket += generator.imageRaster(resized);
    ticket += generator.feed(2);
    return ticket;
  }

}
