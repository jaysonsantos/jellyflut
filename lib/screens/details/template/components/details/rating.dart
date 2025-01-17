part of '../details_widgets.dart';

class RatingDetailsWidget extends StatelessWidget {
  final String? rating;
  const RatingDetailsWidget({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (rating == null) return SizedBox();
    return Container(
      padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              style: BorderStyle.solid,
              color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Text(
        rating!,
        textAlign: TextAlign.justify,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontFamily: 'Quicksand')
            .copyWith(fontSize: 16),
      ),
    );
  }
}
