
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDialog{
  static get contents => null;

static Future<void> showLoadingDialog({
       required BuildContext context,
       required String loadingMessage,
       bool dismissible = true,
})async{
   showDialog(
    context: context,
     barrierDismissible: dismissible,
     builder: (context) {
      var contents =  Row(
    children: [
      Platform.isIOS?CupertinoActivityIndicator()
          :CircularProgressIndicator(),
    const SizedBox(width: 8,),
    Text(loadingMessage),
    ]
    );

      if(Platform.isIOS){
        CupertinoAlertDialog(
          content: contents,
        );
      }
      return AlertDialog(content:contents);
    },
  );

}
static Future<void> showActionDialog({
  required BuildContext context,
   String? title,
   String? content,
  String? positiveActionTitle,
  String? negativeActionTitle,
  Function()? positiveAction,
  Function()? negativeAction,
  bool dismissible = true,
})async{
  showDialog(
    context: context,
    barrierDismissible: dismissible,
    builder: (context) {
      List<Widget>? action =
             positiveAction == null &&
             negativeAction == null ?
             null :[];
      if(positiveAction != null){
        action?.add(TextButton(
          onPressed: (){
            Navigator.pop(context);
            if(positiveAction != null){
              positiveAction();
            }
          },child: Text(positiveActionTitle!,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          decoration: TextDecoration.none

        ),
        ),)
        );
      }
      if(negativeActionTitle != null){
        action?.add(TextButton(
          onPressed: (){
            Navigator.pop(context);
            if(negativeAction != null){
              negativeAction();
            }
          },child: Text(negativeActionTitle,
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              decoration: TextDecoration.none

          ),
        ),)
        );
      }



      if(Platform.isIOS){
        CupertinoAlertDialog(
          title: title != null? Text(title):null,
          content: contents != null? Text(content!):null,
            actions: action??[]
        );
      }
      return AlertDialog(
          title: title != null? Text(title):null,
          content: contents != null? Text(content!):null,
          actions: action??[]
      );
    },
  );

}
















}