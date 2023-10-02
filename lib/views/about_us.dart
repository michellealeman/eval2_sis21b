import 'package:flutter/material.dart';
class AboutUs extends StatelessWidget {
// Datos de ambos
final String names = 'Tania Juarez\nMichelle Aleman'; // Nombres de ambos
final String emails =
'georgina.aleman22.itca.edu.sv\tania. juarez22@itca.edu.sv'; // Correos 
//de ambos
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Acerca de nosotros'),
backgroundColor: Colors.pink,
),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
// Imagen con ambas fotos
Image.asset(
'images/sis21b.jpg', // Ruta de la imagen combinada
width: 300.0,
height: 300.0,
),
SizedBox(height: 20.0),
Text(
names,
textAlign: TextAlign.center,
style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
),
SizedBox(height: 10.0),
Text(
emails,
textAlign: TextAlign.center,
style: TextStyle(fontSize: 18.0),
),
],
),
),
);
}
}