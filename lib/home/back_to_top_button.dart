import 'package:flutter/material.dart';

class BackToTop extends StatelessWidget {
  const BackToTop({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
//    final scrollController = context.watch<ScrollController>();
    //  if (scrollController.isOffsetZero()) return SizedBox();
    return FloatingActionButton(
      backgroundColor: Colors.redAccent,
      child: Icon(Icons.arrow_upward),
      onPressed: () {
        //    scrollController.animateTo(0,
        //      duration: Duration(milliseconds: 700), curve: Curves.easeInOut);
      },
    );
  }
}

extension on ScrollController {
  bool isOffsetZero() {
    return this.offset == 0;
  }
}
