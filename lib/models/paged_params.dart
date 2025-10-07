class PagedParams {
  final int id;
  final int page;
  PagedParams(this.id, this.page);

  @override
  bool operator ==(Object other) =>
      other is PagedParams && other.id == id && other.page == page;

  @override
  int get hashCode => Object.hash(id, page);
}
