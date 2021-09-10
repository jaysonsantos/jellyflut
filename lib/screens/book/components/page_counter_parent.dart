import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:jellyflut/screens/book/components/page_counter.dart';

class PageCounterParent extends StatelessWidget {
  final Stream<Map<int, int>> streamPage;
  final CarouselController controller;
  const PageCounterParent(
      {Key? key, required this.streamPage, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Map<int, int>>(
      stream: streamPage,
      initialData: {0: 0},
      builder: (context, snapshot) => PopupMenuButton(
          initialValue: snapshot.data?.values.first ?? 0,
          onSelected: (int pageSelected) => controller.animateToPage(
              pageSelected,
              duration: Duration(milliseconds: 400),
              curve: Curves.elasticIn),
          itemBuilder: (context) => _pagesListTile(
              snapshot.data?.keys.first ?? 0, snapshot.data?.values.first ?? 0),
          child: PageCounter(
              currentPage: snapshot.data?.keys.first ?? 0,
              nbPages: snapshot.data?.values.first ?? 0)),
    );
  }

  List<PopupMenuEntry<int>> _pagesListTile(int currentPage, int nbPages) {
    final list = <PopupMenuEntry<int>>[];
    list.add(
      PopupMenuItem(
        child: Text('Select a page'),
      ),
    );
    list.add(
      PopupMenuDivider(
        height: 10,
      ),
    );
    if (nbPages == 0) {
      list.add(PopupMenuItem(enabled: false, child: Text('No pages')));
      return list;
    }
    for (var page = 0; page < nbPages; page++) {
      list.add(
        CheckedPopupMenuItem(
          value: page,
          checked: page == currentPage,
          child: Text('Page n°$page'),
        ),
      );
    }
    return list;
  }
}
