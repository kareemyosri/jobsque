import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';


void showSuccessSnackBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context)
    .showSnackBar(
        SnackBar(
          content: AwesomeSnackbarContent(

            title: 'Success!',
            message: message,
            contentType: ContentType.success,
          ),
          backgroundColor: Colors.transparent,
        ),
        );
  }

void showErrorSnackBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: AwesomeSnackbarContent(
          title: 'Failure!',
          message: message,
          contentType: ContentType.failure,
        ),
        backgroundColor: Colors.transparent,



      ),
    );
}


