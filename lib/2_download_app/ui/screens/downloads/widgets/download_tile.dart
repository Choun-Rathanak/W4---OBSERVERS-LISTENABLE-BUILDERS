import 'package:flutter/material.dart';

 
import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller, });

  final DownloadController controller;
  


  
 
 // TODO

  @override
  Widget build(BuildContext context) {
  
    
    return ListenableBuilder(listenable: controller, builder: (context,child){
      IconData icon;
      VoidCallback? onPressed;
      String subtitle;

      switch(controller.status){     // use switch to stutus and icon change 
        case DownloadStatus.notDownloaded:
        icon = Icons.download;
        onPressed = controller.startDownload;
        subtitle = "${controller.ressource.size} Mb";
        break;

        case DownloadStatus.downloading:
        icon = Icons.hourglass_bottom;
        onPressed = null;
        final downloadSize = controller.progress * controller.ressource.size;
        subtitle = "${(controller.progress * 100).toStringAsFixed(1)} completed - ${downloadSize.toStringAsFixed(1)} of ${controller.ressource.size} MB";
        break;
        
        case DownloadStatus.downloaded:
        icon = Icons.check;
        onPressed = null;
        subtitle = "100% completed - ${controller.ressource.size}";
        break;

      

      }
      
      return Center(
      child: ListTile(
        title: Text(controller.ressource.name),
        subtitle: Text(subtitle),
        trailing: IconButton(onPressed: onPressed , icon: Icon(icon)),
        ),
      );
    
    }  
    );
    

    }


    }
   
      
   
  
     
    // TODO
  

