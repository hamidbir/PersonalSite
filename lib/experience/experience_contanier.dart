import 'package:flutter/material.dart';
import 'package:site_demo/utils/color_assets.dart';

class ExperinceContanier extends StatelessWidget {
  const ExperinceContanier({
    Key key,
    @required this.experince,
    @required this.index,
  }) : super(key: key);

  final ExperienceInfo experince;
  final int index;

  @override
  Widget build(BuildContext context) {
    final colors = ColorAssets.all;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
            width: 3, color: colors.elementAt(index % colors.length)),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experince.company,
            style: textStyle(isBold: true),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            experince.timeLine,
            style: textStyle(isGrey: true),
          ),
          SizedBox(
            height: 10.0,
          ),
          for (var item in experince.description)
            Text(
              item,
              style: textStyle(),
            ),
        ],
      ),
    );
  }
}

TextStyle textStyle({bool isBold, bool isGrey}) {
  return TextStyle(
    height: 1.3,
    fontSize: 20,
    fontWeight: isBold ?? false ? FontWeight.bold : FontWeight.normal,
    color: isGrey ?? false ? Colors.grey : Colors.black,
  );
}

class ExperienceInfo {
  final String company;
  final String timeLine;
  final List<String> description;
  ExperienceInfo({
    @required this.company,
    @required this.timeLine,
    @required this.description,
  });
}

final experinceList = [
  ExperienceInfo(
      company: 'DigiKala',
      timeLine: 'June 2019- April 2021',
      description: [
        '- Very Nice',
        '- It was good as a work experience in a large environment. But you have to be a strong programmer to grow in this environment',
        '- very Money'
      ]),
  ExperienceInfo(
      company: 'Viranika',
      timeLine: 'March 2018 - April 2018 ',
      description: [
        '- not to bad',
        '- Not security',
        '- First work experience in an office and team work environment.'
      ]),
  ExperienceInfo(
      company: 'Bazar',
      timeLine: ' April 2018 - April 2019 ',
      description: [
        '- Having a fresh environment for work. motivating',
        '- very quiet',
        '- Teamwork, having different people in the workplace and having enough mastery to stay in the company'
      ]),
  ExperienceInfo(
      company: 'Google',
      timeLine: 'April 2019 - June 2019 ',
      description: [
        '- Great working environment, long working hours',
        '- Hard and tedious projects, so having enough knowledge to do the project is necessary and useful',
        '- USA'
      ]),
];
