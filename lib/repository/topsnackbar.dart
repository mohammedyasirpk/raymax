import 'package:byon_care/constents.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

enum SnackbarCondition { success, warning, failure }

void showsnackbar(
  String message,
   BuildContext context,  SnackbarCondition type
) {
  if (SnackbarCondition.failure == type) {
  showTopSnackBar(
  
    Overlay.of(context),
    CustomSnackBar.error(
      
      message: message,
      backgroundColor: kbyoncolor3,
    ),
  );
}else if (SnackbarCondition.success == type){
   showTopSnackBar(
  
    Overlay.of(context),
    CustomSnackBar.success(
      
      message: message,
      backgroundColor: kbyoncolor3,
    ),
  );

}else{
   showTopSnackBar(
  
    Overlay.of(context),
    CustomSnackBar.info(
      
      message: message,
      backgroundColor: kbyoncolor3,
    ),
  );
}
}
