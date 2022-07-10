import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shiksha_admin_app/pages/ManageStudentPage.dart';
import 'pages/Login_Page.dart';
import 'pages/ViewStudentDetailsPage.dart';
import 'pages/Home_Page.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shiksha Anudan',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      //initialRoute: '/',
      routes: {
        '/login': (context) =>  const Login_Page(),
        '/home': (context) =>  const AdminHome(),
        // '/donation-history':(context) =>  const StudentHome(),
        // '/donation-details':(context) =>  const StudentHome(),
        // '/student-manage': (context) =>   DonerViewStudent_Page(),
        //'/student-profile': (context) =>   ViewStudent_Page(slist: {},),
      },
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Login_Page(),
    );
  }
}
