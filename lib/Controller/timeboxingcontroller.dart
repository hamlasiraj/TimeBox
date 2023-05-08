import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

abstract class TimeBoxingController extends GetxController {
  validCheck();
  addTableRow();
  createPdf();
  pdfPage();
}

class TimeBoxingControllerImp extends TimeBoxingController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  //
  List<TextEditingController> time = [];
  List<TextEditingController> oClock = [];
  List<TextEditingController> halfHour = [];

  ///

  String? thoughts;
  String? firstP;
  String? secondP;
  String? thirdP;

  @override
  validCheck() {
    if (formstate.currentState!.validate()) {
      createPdf();
    } else {
      print("Not valid");
    }
  }

  @override
  addTableRow() {
    time.add(TextEditingController());
    oClock.add(TextEditingController());
    halfHour.add(TextEditingController());

    update();
  }

// ===================PDF GENERATOR=====================================
  @override
  createPdf() async {
    print("$thoughts");
    String path = (await getApplicationDocumentsDirectory()).path;
    File file = File(path + "TimeBoxing.pdf");

    pw.Document pdf = pw.Document();
    pdf.addPage(pdfPage());

    Uint8List bytes = await pdf.save();
    await file.writeAsBytes(bytes);
    await OpenFile.open(file.path);
  }

  @override
  pw.MultiPage pdfPage() {
    var currentTime = DateFormat('MM/dd/yyyy').format(DateTime.now());
    return pw.MultiPage(
      pageFormat: PdfPageFormat.a6,
      build: ((context) => [
            pw.Header(
                child: pw.Text("Date: $currentTime",
                    style: pw.TextStyle(fontSize: 10)),
                padding:
                    const pw.EdgeInsets.only(bottom: 5, right: 5, left: 5)),
            pw.Column(
              children: [
                pw.Bullet(text: "$firstP"),
                pw.SizedBox(height: 10),
                pw.Bullet(text: "$secondP"),
                pw.SizedBox(height: 10),
                pw.Bullet(text: "$thirdP"),
                pw.SizedBox(height: 20),
                pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Expanded(
                        child: pw.Container(
                            padding: const pw.EdgeInsets.all(10),
                            decoration: const pw.BoxDecoration(
                              color: PdfColors.grey500,
                              boxShadow: [
                                pw.BoxShadow(
                                    color: PdfColors.grey200,
                                    blurRadius: 1,
                                    spreadRadius: 1)
                              ],
                            ),
                            child: pw.Text("$thoughts")),
                      ),
                      pw.SizedBox(width: 5),
                      pw.Expanded(
                          child: pw.ListView.builder(
                        itemCount: time.length,
                        itemBuilder: (context, index) => pw.Row(children: [
                          pw.Expanded(
                            flex: 1,
                            child: pw.Container(
                                height: 30,
                                child: pw.Center(
                                    child: pw.Text(time[index].text,
                                        textAlign: pw.TextAlign.center,
                                        style: pw.TextStyle(fontSize: 10))),
                                decoration:
                                    pw.BoxDecoration(border: pw.Border.all())),
                          ),
                          pw.Expanded(
                            flex: 2,
                            child: pw.Container(
                                height: 30,
                                child: pw.Center(
                                    child: pw.Text(oClock[index].text,
                                        textAlign: pw.TextAlign.center,
                                        style: pw.TextStyle(fontSize: 10))),
                                decoration:
                                    pw.BoxDecoration(border: pw.Border.all())),
                          ),
                          pw.Expanded(
                            flex: 2,
                            child: pw.Container(
                                height: 30,
                                child: pw.Center(
                                    child: pw.Text(halfHour[index].text,
                                        textAlign: pw.TextAlign.center,
                                        style: pw.TextStyle(fontSize: 10))),
                                decoration:
                                    pw.BoxDecoration(border: pw.Border.all())),
                          ),
                        ]),
                      ))
                    ]),
              ],
            )
          ]),
    );
  }

  @override
  void onInit() {
    thoughts = Get.arguments["thoughts"];
    firstP = Get.arguments["firstP"];
    secondP = Get.arguments["secondP"];
    thirdP = Get.arguments["thirdP"];

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
