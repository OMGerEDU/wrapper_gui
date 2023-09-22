import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:logging/logging.dart';
import 'package:wrapper_gui/src/widgets/DrawerListView.dart';
import 'package:wrapper_gui/src/widgets/FormFields.dart';
import 'package:wrapper_gui/src/widgets/LoadingDialogNoCallback.dart';

import 'gRPC/ServiceCalls.dart';
import 'generated/downloaderConfig.pb.dart';




Directory? selectedDirectory;
//final String currentDir = Directory.current.path;
//File configProtoFile = File("$currentDir\\DownloaderConfig.bin");
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
  List<String> selectedOutput = ["Video","Audio"];
  final _formKey = GlobalKey<FormBuilderState>();
  // VideoList _videosList = VideoList();




  @override
  Widget build(BuildContext context) {
    // downloaderConfig = returnConfigFile();
    // FilePickerWidget filePickerWidget =  FilePickerWidget('bin', _videosList );
    return Scaffold(
      drawer: const Drawer(
        child: DrawerListView(),
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
                              FormFields().textField('https://www.youtube.com/watch?v=L7mfjvdnPno&list=RDMM&index=26&ab_channel=TrevorDaniel', "url", "username profile full url"),
                              FormFields().divider(),
                              FormFields().textField("E:\\Resources\\test666", "path", "folder on your PC where output files be located"),
                              FormFields().divider(),
                              //FormFields().dropDown(selectedOutput[0], "outputType", "Select download option:","download option", selectedOutput),
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
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          logger.info(downloaderConfig);
                          downloaderConfig.link = _formKey.currentState?.value['url'];
                          downloaderConfig.path = _formKey.currentState?.value['path'];
                        //   //send request
                          addToTaskAndRun();
                        //
                        //   configProtoFile.writeAsBytes(downloaderConfig.writeToBuffer());
                        } else {
                          debugPrint(_formKey.currentState?.value.toString());
                          debugPrint('validation failed');
                        }
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

  Future<String> addToTaskAndRun() async {
    logger.info("downloaderConfig: $downloaderConfig");
    DownloaderRequest request = DownloaderRequest();
    request.config = downloaderConfig;
    final String result = await LoadingDialogNoCallBack()
        .showLoadingDialog<DownloaderResponse>(
        context,
            () => ServiceCalls().downloaderCall(request),
        loadingText: 'Downloading',
        successText: "Finished Downloading");

    return result;
  }

}
