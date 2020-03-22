import 'package:flutter/material.dart';

class FailedView extends StatelessWidget {
  FailedView({Key key, this.message="Error", this.isShowTryAgain, this.onClickTryAgain}) : super(key: key);

  final String message;
  final bool isShowTryAgain;
  final Function onClickTryAgain;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.error),
          SizedBox(
            height: 16,
          ),
          Text(message)
        ],
      ),
    );
  }
}
