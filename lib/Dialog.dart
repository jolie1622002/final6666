import 'package:flutter/material.dart';
class DialogUtils{
  static void showLoading(BuildContext context,String Message)
  {
    showDialog(
        context: context, builder: (context){
      return AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(color: Colors.blue, ),
            SizedBox(width: 20,),
            Text(Message,style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.blue),)
          ],
        ),
      );
    }
    );
  }
  static void closeLoading(BuildContext context)
  {
    Navigator.pop(context);
  }
  static void showMessage(BuildContext context,
      { String ?message,
        String? posActionName,
        VoidCallback ?posAction,
        String title='Title'})
  {
    List<Widget> actions=[];
    showDialog(context: context,
        builder:(context){
          if(posActionName!.isNotEmpty)
          {
            actions.add(TextButton(onPressed: (){
              Navigator.pop(context);
              posAction?.call();
            }, child:Text(posActionName,style: TextStyle(color: Colors.white))
            ));
          }
          return AlertDialog(backgroundColor: Colors.black,
            title: Text(title,style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.blue),),
            content:Text(message!,style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.blue),),
            actions: actions,
          );
        }
    );
  }
}