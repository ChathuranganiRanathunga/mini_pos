import 'package:demo_app_2021_04_20/Widgets/login/login_detail.dart';
import 'package:demo_app_2021_04_20/pages/dash_board.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogIn extends StatefulWidget{

  static String routeName = '/log-in';

  const LogIn({Key key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: LoginClipper(),
            child: Container(
              height: 340.0,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.deepPurple[900],
                    Colors.purple[300],
                  ],
                ),
              ),
              child: Center(
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:70.0),
            child: Container(
              child: LoginDetailFields(),
            ),
          ),
        ],
      ),
      bottomSheet:SizedBox(
        height: 100.0,
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              )
            ),
            child: Padding(
              padding: const EdgeInsets.only(left:15.0,right: 15.0,top: 15.0,bottom:15.0),
              child: Text('LogIn',
                style:GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            onPressed: () => Navigator.of(context).pushNamed(DashBoard.routeName),
          ),
        ),
      ),
    );
  }
}

class LoginClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height-50);
    var controllPoint = Offset(50,size.height);
    var endPoint = Offset(size.width/2, size.height);
    path.quadraticBezierTo(controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
