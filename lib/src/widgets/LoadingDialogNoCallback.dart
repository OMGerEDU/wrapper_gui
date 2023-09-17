

import 'package:flutter/material.dart';

class LoadingDialogNoCallBack {
  Future<dynamic> showLoadingDialog<T>(
      BuildContext context,
      Future<T> Function() futureCall,
      {String loadingText = 'Loading',
        String successText = 'Done',
        String errorTitle = 'Error',
        String okButtonText = 'Ok',
      }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return FutureBuilder<T>(
          future: futureCall(),
          builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Dialog(
                child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CircularProgressIndicator(),
                        const SizedBox(width: 10),
                        Text(
                          loadingText,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    )),
              );
            } else if (snapshot.hasError) {
              return AlertDialog(
                title: Text(errorTitle, style: const TextStyle(fontSize: 24)),
                content: Text(
                  snapshot.error.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
                actions: <Widget>[
                  TextButton(
                      child:
                      Text(okButtonText, style: const TextStyle(fontSize: 20)),
                      onPressed: () => Navigator.of(context).pop()),
                ],
              );
            } else {
              return AlertDialog(
                title:
                Text(successText, style: const TextStyle(fontSize: 24)),
                // Adding getResulText function to get a status message depending on server response
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(snapshot.hasError ? snapshot.error.toString() : "Mission succeed", style: const TextStyle(fontSize: 20)),
                    const SizedBox(height: 20),
                    const Text(
                      'You can implement additional dialogs or components here...',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text(okButtonText, style: const TextStyle(fontSize: 20)),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              );
            }
          },
        );
      },
    );
  }
}