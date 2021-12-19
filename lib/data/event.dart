class PageChangeEvent {
  final bool isToNext;
  final int pageCount;

  PageChangeEvent(this.pageCount, this.isToNext);
}

class ChangeMainModel {
  final int index;

  ChangeMainModel(this.index);
}
