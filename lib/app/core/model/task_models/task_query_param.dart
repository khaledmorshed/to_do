import '/app/core/values/app_values.dart';

class TaskQueryParam {
  String searchKeyWord;
  int perPage;
  int pageNumber;

  TaskQueryParam({
    required this.searchKeyWord,
    this.perPage = AppValues.defaultPerPageSize,
    this.pageNumber = AppValues.defaultPageNumber,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = searchKeyWord;
    data['perPage'] = perPage;
    data['pageNumber'] = pageNumber;

    return data;
  }
}
