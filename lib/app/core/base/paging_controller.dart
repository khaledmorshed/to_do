import '/app/core/values/app_values.dart';

class PagingController<T>{
  List<T> itemList = [];
  int pageNumber = AppValues.defaultPageNumber;
  bool isLoadingPage = false;
  bool endOfList = false;

  initRefresh(){
    itemList = [];
    pageNumber = AppValues.defaultPageNumber;
    isLoadingPage = false;
    endOfList = false;
  }

  bool canLoadNextPage(){
    return !isLoadingPage && !endOfList;
  }

  appendPage(List<T> items){
    itemList.addAll(items);
    pageNumber++;
  }

  appendLastPage(List<T> items){
    itemList.addAll(items);
    endOfList = true;
  }
}
