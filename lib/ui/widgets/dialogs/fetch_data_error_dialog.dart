import 'package:flutter/material.dart';
import 'package:users_app/ui/widgets/widgets.dart';

fetchDataErrorDialog(BuildContext context, String error){
  showDialog(
    barrierDismissible: false,
    context: context, 
    builder: (context) => FetchDataErrorDialogBody(
      error: error,
    )
  );
}

class FetchDataErrorDialogBody extends StatelessWidget {
  const FetchDataErrorDialogBody({
    super.key, 
    required this.error,
  });

  final String error;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomText(
            text: 'An error occurred while trying to obtain the information.', 
            fontSize: 20, 
            fontWeight: FontWeight.w700, 
            color: Colors.black,
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
          CustomText(
            text: error, 
            fontSize: 20, 
            fontWeight: FontWeight.w700, 
            color: Colors.black
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800]
                ),
                onPressed: (){
                  Navigator.pop(context);
                }, 
                child: const CustomText(
                  text: 'Accept', 
                  fontSize: 16, 
                  fontWeight: FontWeight.w700, 
                  color: Colors.white
                )
              )
            ],
          )
        ],
      ),
    );
  }
}