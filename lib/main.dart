import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:typed_data';

// ignore: unused_import
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';

const String csTT = 'assets/csTT.pdf';
const String fee = 'assets/fee.pdf';
const String feeAICTE = 'assets/feeAICTE.pdf';
const String feeNRI = 'assets/feeNRI.pdf';

const String bellGIF = 'assets/bell.gif';

final backColor = const Color(0xFFe94b35);
final topColor = const Color(0xFFfed049);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class FullPdfViewerScreen extends StatelessWidget {
  final String pdfPath;

  FullPdfViewerScreen(this.pdfPath);

  //FRONTEND FOR PDF VIEWER PAGE
  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text("PDF File"),
          backgroundColor: backColor,
        ),
        path: pdfPath);
  }
}

//FUNCTION FOR PDF CALLING
class _MyHomePageState extends State<MyHomePage> {
  // This moves the PDF file from the assets to a place accessible by our PDF viewer.
  //-------------link0-------------
  Future<String> prepareTestPdf() async {
    final ByteData bytes = await DefaultAssetBundle.of(context).load(feeNRI);
    final Uint8List list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}/$feeNRI';

    final file = await File(tempDocumentPath).create(recursive: true);
    file.writeAsBytesSync(list);
    return tempDocumentPath;
  }

  //-----------------link 1--------------
  Future<String> prepareTestPdf1() async {
    final ByteData bytes = await DefaultAssetBundle.of(context).load(feeAICTE);
    final Uint8List list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}/$feeAICTE';

    final file = await File(tempDocumentPath).create(recursive: true);
    file.writeAsBytesSync(list);
    return tempDocumentPath;
  }

  //-------------link2-------------
  Future<String> prepareTestPdf2() async {
    final ByteData bytes = await DefaultAssetBundle.of(context).load(fee);
    final Uint8List list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}/$fee';

    final file = await File(tempDocumentPath).create(recursive: true);
    file.writeAsBytesSync(list);
    return tempDocumentPath;
  }

  //-------------link3-------------
  Future<String> prepareTestPdf3() async {
    final ByteData bytes = await DefaultAssetBundle.of(context).load(csTT);
    final Uint8List list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}/$csTT';

    final file = await File(tempDocumentPath).create(recursive: true);
    file.writeAsBytesSync(list);
    return tempDocumentPath;
  }

//body properties
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: backColor,
//APPBAR PROPERTIES
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 55),
          child: new Container(
            height: 400.0,
            decoration: new BoxDecoration(
              color: topColor,
              boxShadow: [new BoxShadow(blurRadius: 10.0)],
              borderRadius: new BorderRadius.vertical(
                  bottom: new Radius.elliptical(
                      MediaQuery.of(context).size.width, 10.0)),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                child: Text(
                  "Notices",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'TileTitle',
                  ),
                ),
                padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
              )
            ]),
          ),
        ),

//TILESLIST
        body: ListView(children: <Widget>[
          Padding(
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/pdf.png'),
                  backgroundColor: Colors.black,
                ),
                title: Text(
                  "NRI FEE SCHEDULE 2020-21 WITH BANK DETAIL",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'TileTitle',
                  ),
                ),
                contentPadding: EdgeInsets.all(1),
                enabled: true,
                onTap: () => {
                  // We need to prepare the test PDF, and then we can display the PDF.
                  prepareTestPdf().then((path) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FullPdfViewerScreen(path)),
                    );
                  })
                },
              ),
              color: Colors.black,
            ),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          ),

          const Divider(
            color: Colors.black,
            thickness: 0.5,
            height: 0.1,
            indent: 20,
            endIndent: 20,
          ),

          //----------------CARD 1-------------------------

          Padding(
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/pdf.png'),
                  backgroundColor: Colors.black,
                ),
                title: Text(
                  "AICTE FEE SCHEDULE",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'TileTitle',
                  ),
                ),
                contentPadding: EdgeInsets.all(1),
                enabled: true,
                onTap: () => {
                  // We need to prepare the test PDF, and then we can display the PDF.
                  prepareTestPdf1().then((path) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FullPdfViewerScreen(path)),
                    );
                  })
                },
              ),
              color: Colors.black,
            ),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          ),

          const Divider(
            color: Colors.black,
            thickness: 0.5,
            height: 0.1,
            indent: 20,
            endIndent: 20,
          ),

          //---------------CARD2------------------------
          Padding(
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/pdf.png'),
                  backgroundColor: Colors.black,
                ),
                title: Text(
                  "FEE SCHEDULE 2020-21",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'TileTitle',
                  ),
                ),
                contentPadding: EdgeInsets.all(1),
                enabled: true,
                onTap: () => {
                  // We need to prepare the test PDF, and then we can display the PDF.
                  prepareTestPdf2().then((path) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FullPdfViewerScreen(path)),
                    );
                  })
                },
              ),
              color: Colors.black,
            ),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          ),
          //--------------------card 3---------------
          const Divider(
            color: Colors.black,
            thickness: 0.5,
            height: 0.1,
            indent: 20,
            endIndent: 20,
          ),

          Padding(
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/pdf.png'),
                  backgroundColor: Colors.black,
                ),
                title: Text(
                  "Time Table - Computer Science",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'TileTitle',
                  ),
                ),
                contentPadding: EdgeInsets.all(1),
                enabled: true,
                onTap: () => {
                  // We need to prepare the test PDF, and then we can display the PDF.
                  prepareTestPdf3().then((path) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FullPdfViewerScreen(path)),
                    );
                  })
                },
              ),
              color: Colors.black,
            ),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          ),

          const Divider(
            color: Colors.black,
            thickness: 0.5,
            height: 0.1,
            indent: 20,
            endIndent: 20,
          ),

          // GIF
          Padding(
            child: new Image.asset(bellGIF),
            padding: EdgeInsets.fromLTRB(10, 40, 10, 10),
          )
        ]));
  }
}
