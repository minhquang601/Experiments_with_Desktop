import 'package:first_desktop_application/liquid_cards/data/demo_data.dart';
import 'package:first_desktop_application/liquid_cards/styles/styles.dart';

import 'package:flutter/material.dart';

class DrinkListCard extends StatefulWidget {
  final Function(DrinkData) onTap;

  final bool isOpen;
  final DrinkData drinkData;
  final int earnedPoints;

  const DrinkListCard({
    Key key,
    this.onTap,
    this.isOpen,
    this.drinkData,
    this.earnedPoints,
  }) : super(key: key);

  @override
  _DrinkListCardState createState() => _DrinkListCardState();
}

class _DrinkListCardState extends State<DrinkListCard>
    with SingleTickerProviderStateMixin {
  AnimationController _liquidSimController;

  @override
  void initState() {
    super.initState();
    _liquidSimController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );
  }

  @override
  void dispose() {
    _liquidSimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Determine the points required text value, using the _pointsTween
    var pointsRequired = widget.drinkData.requiredPoints;

    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        color: Color(0xff303238),
        child: Stack(
          children: <Widget>[
            //Card Content
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 24),
                    _buildTopContent(),
                    //Spacer
                    const SizedBox(height: 12.0),
                    _buildBottomContent(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildTopContent() => Row(
        children: <Widget>[
          //Icon
          Image.asset(
            "assets/images/" + widget.drinkData.iconImage,
            fit: BoxFit.fitWidth,
            width: 50.0,
          ),
          SizedBox(width: 24),
          //Label
          Expanded(
            child: Text(
              widget.drinkData.title.toUpperCase(),
              style: Styles.text(18, Colors.white, true),
            ),
          ),
          //Star Icon
          Icon(Icons.star, size: 20, color: AppColors.orangeAccent),
          SizedBox(width: 4),
          //Points Text
          Text(
            "${widget.drinkData.requiredPoints}",
            style: Styles.text(20, Colors.white, true),
          )
        ],
      );

  // TODO Add param
  Column _buildBottomContent() {
    return Column(
      children: <Widget>[
        SizedBox(height: 16),
        Text(
          "Redeem your points for a cup of happiness! Our signature espresso is blanced with steamed milk and topped with a light layer of foam. ",
          textAlign: TextAlign.center,
          style: Styles.text(14, Colors.white, false, height: 1.5),
        ),
        const SizedBox(height: 16.0),
        //Main Button
        //Main Button
        ButtonTheme(
          minWidth: 200,
          height: 40,
          child: FlatButton(
            onPressed: () {},
            color: AppColors.orangeAccent,
            disabledColor: AppColors.orangeAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text("REDEEM", style: Styles.text(16, Colors.white, true)),
          ),
        )
      ],
    );
  }

  void _handleTap() {
    //TODO:
  }
}