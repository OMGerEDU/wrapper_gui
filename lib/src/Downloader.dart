import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:logging/logging.dart';
import 'package:wrapper_gui/src/widgets/FormFields.dart';

import 'generated/downloaderConfig.pb.dart';




Directory? selectedDirectory;
final String currentDir = Directory.current.path;
File configProtoFile = File("$currentDir\\DownloaderConfig.bin");
DownloaderConfig downloaderConfig = DownloaderConfig();
final logger = Logger("Downloader.dart");

List<String> platforms() {
  return ['youtube','tiktok'];
}
List<String> taskTypes() {
  return ['download-audio','download-video'];
}


// DownloaderConfig returnConfigFile() {
//   if(configProtoFile.existsSync()){
//     DownloaderConfig config = DownloaderConfig.fromBuffer(configProtoFile.readAsBytesSync());
//     config.videos.clear();
//     config.links.clear();
//     return config;
//   }
//   else {
//     DownloaderConfig config = DownloaderConfig();
//     configProtoFile.writeAsBytesSync(config.writeToBuffer());
//     return config;
//   }
// }

class _AppLifecycleObserver extends WidgetsBindingObserver {
  final Process _process;

  _AppLifecycleObserver(this._process);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      _process.kill();
    }
  }
}




void _onChanged(dynamic val) => debugPrint(val.toString());

class Downloader extends StatelessWidget {
  const Downloader({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter FormBuilder',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: FormBuilderLocalizationsImpl.supportedLocales,
      home: DownloaderForm(),
    );
  }
}


class DownloaderForm extends StatefulWidget {
  DownloaderForm({Key? key}) : super(key: key);

  @override
  State<DownloaderForm> createState() {
    return _DownloaderFormState();
  }
}

class _DownloaderFormState extends State<DownloaderForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  // VideoList _videosList = VideoList();




  @override
  Widget build(BuildContext context) {
    // downloaderConfig = returnConfigFile();
    // FilePickerWidget filePickerWidget =  FilePickerWidget('bin', _videosList );
    return Scaffold(
      drawer: const Drawer(
        // child: DrawerListView(),
      ),
      appBar: AppBar(title: const Text('Downloader.')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FormBuilder(
                key: _formKey,
                // enabled: false,
                onChanged: () {
                  _formKey.currentState!.save();
                  debugPrint(_formKey.currentState!.value.toString());
                },
                autovalidateMode: AutovalidateMode.disabled,
                skipDisabled: true,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 15),
                    FutureBuilder(
                      builder: (context,snapshot) {
                          return Column(
                            children: [
                              FormFields().textField('url', "profileLink", "username profile full url"),
                              FormFields().divider(),
                              FormFields().textField("outputLocation", "outputLocation", "folder on your PC where output files be located"),
                              FormFields().divider(),
                              // filePickerWidget,
                            ],
                          );
                        // }
                        return Container();
                      },
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        // if (_formKey.currentState?.saveAndValidate() ?? false) {
                        //   downloaderConfig.linkToProfile = _formKey.currentState?.value['profileLink'];
                        //   downloaderConfig.links.add(_formKey.currentState?.value['profileLink']);
                        //   downloaderConfig.outputAsString = _formKey.currentState?.value['outputLocation'];
                        //   downloaderConfig.platform = _formKey.currentState?.value['platform'];
                        //   downloaderConfig.task = _formKey.currentState?.value['task'];
                        //   logger.info("${filePickerWidget.videosList.videosList} VIDEOlSISTALACH ONLY \n \n \n");
                        //   downloaderConfig.videos.clear(); // delete previous videos from query, they aren't required in the new call..
                        //   downloaderConfig.links.clear();
                        //   downloaderConfig.videos.addAll(filePickerWidget.videosList.videosList);
                        //   //send request
                        //   addToTaskAndRun();
                        //
                        //   configProtoFile.writeAsBytes(downloaderConfig.writeToBuffer());
                        // } else {
                        //   debugPrint(_formKey.currentState?.value.toString());
                        //   debugPrint('validation failed');
                        // }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  FormFields().divider(),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        _formKey.currentState?.reset();
                      },
                      child: Text(
                        'Reset',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );




  }

  // Future<String> addToTaskAndRun() async {
  //   final String result = await LoadingDialogNoCallBack()
  //       .showLoadingDialog<DownloaderResponse>(
  //       context,
  //           () => ServiceCalls().downloaderCall(downloaderConfig),
  //       loadingText: 'Downloading',
  //       successText: "Finished Downloading");
  //
  //   return result;
  // }


}
