import 'package:flutter/material.dart';
import 'package:starter_project/ui_helpers/size_config/size_config.dart';

class ErrorRetryWidget extends StatelessWidget {

  final Function onTap;
  final String errorMessage;
  final String buttonText;

  ErrorRetryWidget({
    Key key,
    this.onTap,
    this.errorMessage,
    this.buttonText
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            errorMessage?? 'An error occured!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: onTap,
            child: Text(
              buttonText ?? 'Retry',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
          )
        ],
      ),
    );
  }
}