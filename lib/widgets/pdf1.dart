import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:ourcourt/Route/route.dart';
import 'package:ourcourt/controller/function_con.dart';

class PDF1 extends StatefulWidget {
  var darftandbooks;
  PDF1(this.darftandbooks);

  @override
  _PDF1State createState() => _PDF1State(this.darftandbooks);
}

class _PDF1State extends StateMVC<PDF1> {
  var darftandbooks;

  late FunctionController function;
  _PDF1State(this.darftandbooks) : super(FunctionController()) {
    function = controller as FunctionController;
  }
  bool _isLoading = true;
  PDFDocument document = PDFDocument();

  @override
  void initState() {
    super.initState();
    loadDocument();
    changePDF();
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset('assets/sample.pdf');

    setState(() => _isLoading = false);
  }

  changePDF() async {
    setState(() => _isLoading = true);

    document = await PDFDocument.fromURL(
      "https://ourcourtbd.com/${darftandbooks.pdf}",
    );

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            function.darftandbooks(context);
          },
        ),
        elevation: 0,
        backgroundColor: Color(0xFFF4FAF7),
      ),
      body: Center(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : PDFViewer(
                document: document,
              ),
      ),
    );
  }
}
