import 'dart:io';

import 'package:file_picker/file_picker.dart';

 pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.video);

    if(result !=null){
    return File(result.files.single.path!);
   }else{
     return null;
   }
  }
// videoUploadGallery([isSvg=true])async{
  
//   FilePickerResult? result= await FilePicker.platform.pickFiles(
//     type: FileType.custom,
//     allowedExtensions:isSvg? [
//       "svg",
//       "SVG",
//     ]:[
//       "mp4",
//       "gif"
//     ]
//   );

//   if(result !=null){
//     return File(result.files.single.path!);
//   }else{
//     return null;
//   }


// }