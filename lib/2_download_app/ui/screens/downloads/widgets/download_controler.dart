import 'package:flutter/material.dart';

class Ressource {
  final String name;
  final int size;   // in MB

  Ressource({required this.name, required this.size}); 
}

enum DownloadStatus { notDownloaded, downloading, downloaded }

class DownloadController extends ChangeNotifier {
  
  DownloadController(this.ressource);

  // DATA
  Ressource ressource;
  DownloadStatus _status = DownloadStatus.notDownloaded;
  double _progress = 0.0;         // 0.0 → 1.0

  // GETTERS
  DownloadStatus get status => _status;
  double get progress => _progress;

  // ACTIONS
  void startDownload() async {
    if (_status == DownloadStatus.downloading) return;

    _status = DownloadStatus.downloading;  // set status to downlaoding
    notifyListeners();

   
    for(int i = 0 ; i <10; i++){   // loop 10 times 
       _progress += 0.1;
       notifyListeners();
       await Future.delayed(const Duration(milliseconds: 1000));
     
    }
     
    _status = DownloadStatus.downloaded;  // set status to downloaded after loop
    notifyListeners();

    

    

    // TODO
    // 1 – set status to downloading
    // 2 – Loop 10 times and increment the download progress (0 -> 0.1 -> 0.2 )
    //      - Wait 1 second :  await Future.delayed(const Duration(milliseconds: 1000));

    // 3 – set status to downloaded
  }
}


