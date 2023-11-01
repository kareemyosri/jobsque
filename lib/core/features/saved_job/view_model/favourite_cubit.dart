import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());

  static FavouriteCubit get(context) => BlocProvider.of(context);

// final _tempDir = Directory.systemTemp;
//
// Future<void> shareImageFromApi({required String imageUrl, required String text, required String subject }) async {
//   // Download the image from the API link.
//   final response = await http.get(Uri.parse(imageUrl));
//
//   // Save the downloaded image to a temporary file on the device.
//   final tempFile = await File('${_tempDir.path}/image.png').create();
//   await tempFile.writeAsBytes(response.bodyBytes);
//
//   // Share the temporary image file using the share_plus package.
//   await Share.shareFiles([tempFile.path],
//
//       subject: subject,
//     text: text,
//
//   );
//
//   // Delete the temporary image file.
//   await tempFile.delete();
// }

  Future<void> shareImageFromApi({
    required String imageUrl,
    required String text,
    required String subject,
  }) async {
    // Download the image from the API link.
    final response = await http.get(Uri.parse(imageUrl));

    // Get the temporary directory on the device.
    final tempDir = await getTemporaryDirectory();

    // Create a file with a unique name in the temporary directory.
    const tempFileName = 'image.png';
    final tempFile = File('${tempDir.path}/$tempFileName');

    // Write the downloaded image data to the temporary file.
    await tempFile.writeAsBytes(response.bodyBytes);

    // Share the temporary image file using Share.shareXFiles.
    await Share.shareXFiles([XFile(tempFile.path)],
        subject: subject,
        text: text
    );

    // Delete the temporary image file.
    await tempFile.delete();
  }








}



