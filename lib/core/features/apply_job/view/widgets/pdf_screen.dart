
import 'package:flutter/material.dart';
import 'package:jobsque/core/features/apply_job/view_model/job_cubit.dart';
import 'package:jobsque/util/widgets/app_bar.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFScreen extends StatefulWidget {

  PDFScreen({Key? key}) : super(key: key);

  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
late JobCubit cubit;
late PdfViewerController _pdfViewerController;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit=JobCubit.get(context);
    _pdfViewerController = PdfViewerController();

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(cubit.selectedCVFile!
          .path
          .split('/')
          .last, context),
      body: SfPdfViewer.file(cubit.selectedCVFile!,
        controller: _pdfViewerController,
      ),
    );
  }
}