import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:process_run/process_run.dart';

class ServerManager extends WidgetsBindingObserver {
  Process? _process;
  final logger = Logger("ServerManager");


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      this.stopServer();
    }
  }

  Future<void> startServer() async {
    try {
      WidgetsBinding.instance.addObserver(this);
      logger.info("Starting server");
      var shell = Shell();
      await shell.run('java -jar C:\\Users\\omerd\\Desktop\\SKUL\\Java\\Java_Projects\\openSource\\Youtube-Downloader\\youtubeDownload\\target\\youtubeDownload-1.0-SNAPSHOT-jar-with-dependencies.jar');
    } catch (e) {
      logger.severe('Error starting server: $e');
    }
  }

  Future<void> stopServer() async {
    logger.info("Stopping server");
    WidgetsBinding.instance.removeObserver(this);
    _process?.kill();
    _process = null;
  }
}