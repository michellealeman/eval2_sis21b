import 'package:eval2_sis21b/views/edit_categorias.dart';
import 'package:eval2_sis21b/views/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'views/add_categorias.dart';
import 'views/about_us.dart';
void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp().then((_) {
runApp(const MyApp());
});
}
class MyApp extends StatelessWidget {
const MyApp({super.key});
@override
  Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'Material App',
initialRoute: "/",
routes: {
"/": (context) => const Home(),
"/add":(context) => const AddCategoria(),
"/edit":(context) => const EditCategoria(),
"/about":(context) => AboutUs(),
},
);
}
}