import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HeaderBody extends StatelessWidget {
  final bool isMobile;
  const HeaderBody({
    Key key,
    this.isMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'I\'m a Flutter',
          style: Theme.of(context).textTheme.headline2,
          maxLines: 1,
        ),
        AutoSizeText(
          'Developer',
          style: Theme.of(context).textTheme.headline2,
          maxLines: 1,
        ),
        SizedBox(
          height: isMobile ?? false ? 15 : 30,
        ),
        AutoSizeText(
            'I have 2 years of experianse in flutter developmant in buildubg Butifull apps.',
            maxLines: 3,
            style: TextStyle(
              fontSize: 17,
            )),
        SizedBox(
          height: isMobile ?? false ? 15 : 30,
        ),
        FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(7)),
            ),
            color: Colors.redAccent,
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: isMobile ?? false ? 8 : 15,
                  vertical: isMobile ?? false ? 10 : 17),
              child: Text('contact us ',
                  style: TextStyle(
                      fontSize: isMobile ?? false ? 10 : 17,
                      color: Colors.white)),
            )),
      ],
    );
  }
}