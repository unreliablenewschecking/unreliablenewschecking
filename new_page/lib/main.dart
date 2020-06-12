import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:js' as js;

final int darkBackgroundColor = 0xff171F2A;
final int lightBackgroundColor = 0xff25313F;
final int textColor = 0xffEBF0FF;
final double headline1Size = 30;
final double headline2Size = 20;
final double headline3Size = 15;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Newspector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.redHatDisplayTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(lightBackgroundColor),
      appBar: AppBar(
        backgroundColor: Color(darkBackgroundColor),
        leading: Container(
          padding: EdgeInsets.all(10),
          child: Image.asset('images/newspector_logo.png'),
        ),
      ),
      body: CustomPaint(
        painter: Sky(),
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(
            children: [
              SizedBox(height: 20),
              mainTitle(),
              SizedBox(height: 10),
              subTitle(),
              SizedBox(height: 10),
              name(),
              SizedBox(height: 15),
              screenShots(),
              SizedBox(height: 10),
              reports(),
              SizedBox(height: 30),
              members(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget mainTitle() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: AutoSizeText.rich(
        TextSpan(
          children: <TextSpan>[
            TextSpan(text: 'Following the '),
            TextSpan(
              text: 'breaking',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: headline1Size * 1.2,
              ),
            ),
            TextSpan(
              text: ' news should not be this\nhard. We are here to ',
            ),
            TextSpan(
              text: 'change',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: headline1Size * 1.2,
              ),
            ),
            TextSpan(text: ' that.'),
          ],
        ),
        textAlign: TextAlign.center,
        maxLines: 2,
        style: TextStyle(
          color: Color(textColor),
          fontSize: headline1Size,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget subTitle() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 45),
      child: AutoSizeText.rich(
        TextSpan(
          children: <TextSpan>[
            TextSpan(text: 'An application to follow the '),
            TextSpan(
              text: 'breaking',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: headline3Size * 1.2,
              ),
            ),
            TextSpan(text: ' news without the '),
            TextSpan(
              text: 'hassle.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: headline3Size * 1.2,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(textColor),
          fontSize: headline3Size,
          fontWeight: FontWeight.normal,
        ),
        maxLines: 1,
      ),
    );
  }

  Widget name() {
    return Text(
      "Newspector",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(textColor),
        fontWeight: FontWeight.bold,
        fontSize: headline1Size,
      ),
    );
  }

  Widget screenShots() {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 500),
      child: Container(
        height: MediaQuery.of(context).size.width * 0.5,
        child: Image.asset(
          'images/screen_shots.png',
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }

  Widget reports() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Reports",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(textColor),
              fontSize: headline2Size,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 20),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 5,
          runSpacing: 10,
          children: [
            reportButton('specification', 'Project\nSpecifications'),
            reportButton('analysis', 'Analysis\nReport'),
            reportButton('high', 'High-Level Design'),
            reportButton('low', 'Low-Level\nDesign'),
            reportButton('final', 'Final\nReport'),
            reportButton('manual', 'User\nManual'),
          ],
        ),
      ],
    );
  }

  Widget reportButton(String imageName, String reportName) {
    var scalingFactor = 0.5;
    var width = 165.6 * scalingFactor;
    var height = 234.2 * scalingFactor;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () =>
          js.context.callMethod("open", ['assets/reports/$imageName.pdf']),
      child: Container(
        width: width + 30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width,
              height: height,
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(6),
                child: Image.asset('images/$imageName.jpg'),
              ),
            ),
            SizedBox(height: 5),
            Text(
              reportName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget members() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Team",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(textColor),
              fontSize: headline2Size,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 20),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 5,
          runSpacing: 20,
          children: [
            teamMember('ahmet', 'Ahmet Ayrancıoğlu'),
            teamMember('deniz', 'Deniz Dalkılıç'),
            teamMember('kaan', 'Kaan Gönç'),
          ],
        ),
      ],
    );
  }

  Widget teamMember(String imageName, String memberName) {
    var width = 300.0;
    var height = width;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: Container(
        width: width + 30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width,
              height: height,
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(6),
                child: Image.asset('images/$imageName.jpg'),
              ),
            ),
            SizedBox(height: 10),
            Text(
              memberName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(textColor),
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class Sky extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(darkBackgroundColor)
      ..style = PaintingStyle.fill;
    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(0, y * 2 / 3)
      ..lineTo(x, y * 1 / 3)
      ..lineTo(x, y)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(Sky oldDelegate) => false;
}
