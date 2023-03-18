class ListModel {
  ListModel(this.list);
  List<String> list;

  factory ListModel.fromJSON(List<dynamic> json) {
    List<String> jsonList = [];
    for (var e in json) {
      jsonList.add(e["id"]);
    }
    return ListModel(jsonList);
  }
}
