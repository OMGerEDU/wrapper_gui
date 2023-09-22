import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:wrapper_gui/src/gRPC/DownloaderService.dart';
import 'package:wrapper_gui/src/widgets/DrawerListView.dart';
import 'package:wrapper_gui/src/widgets/FormFields.dart';
import 'dart:io';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  Map<int, Color> color =
  {
    50:const Color.fromRGBO(0,75,167, .1),
    100:const Color.fromRGBO(0,125,167, .2),
    200:const Color.fromRGBO(0,204,167, .3),
    300:const Color.fromRGBO(0,204,167, .4),
    400:const Color.fromRGBO(0,38,167, .5),
    500:const Color.fromRGBO(0,0,167, .6),
    600:const Color.fromRGBO(0,0,167, .7),
    700:const Color.fromRGBO(0,6,167, .8),
    800:const Color.fromRGBO(0,19,167, .9),
    900:const Color.fromRGBO(0,155,167, 1),
  };

  @override
  Widget build(BuildContext context) {
    DownloaderService().init();
    MaterialColor colorCustom = MaterialColor(0, color);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        buttonTheme: const ButtonThemeData(
          buttonColor: Color.fromRGBO(0,125,167, 1),
          textTheme: ButtonTextTheme.primary,
        ),
        primarySwatch: colorCustom,
        hintColor: const Color.fromRGBO(0,155,167, 1),
        primaryColorLight: const Color.fromRGBO(0,38,167, .5),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _formKey = GlobalKey<FormBuilderState>();
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(
          child: DrawerListView(),
        ),
        appBar: AppBar(
          title: const Text(
            'Youtube Downloader. \n Welcome to our new upgraded Ui !',
            textAlign: TextAlign.center,),
          backgroundColor: const Color.fromRGBO(0, 125, 167, 1),
        ),
        body: const Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //Put welcome text here:

                SizedBox(height: 25),
                FlutterLogo(size: 50,), // Placeholder for logo
                Text("This is a platform to help you download,"
                    "organise and enjoy your Youtube videos. Please download from the menu options on the left.",
                  style: TextStyle(fontSize: 18),),

                 // Refresh for changes
                // Form fields commented for requied changes
                //  FormBuilder(
                // // Will leave it to you to redesign accordingly
                // )
              ],
            ),
          ),
        ),
    );
  }
}
