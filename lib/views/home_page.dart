import 'package:flutter/material.dart';
import '../models/crud.dart';
import '../views/about_us.dart';
class Home extends StatefulWidget {
const Home({
super.key,
});
@override
State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
void _dataFirestore() {
db.collection("tb-categoria").get().then(
(querySnapshot) {
print("Consulta completada exitosamente");
for (var docSnapshot in querySnapshot.docs) {
print('${docSnapshot.id} => ${docSnapshot.data()}');
}
},
onError: (e) => print("Error al completar la consulta: $e"),
);
}
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('EVALUACCIÓN PRACTICA II'),
actions: <Widget>[
IconButton(
icon: Icon(Icons.info), // Cambia el icono según tus preferencias
onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (context) =>
AboutUs()));
},
),
],
),
body: FutureBuilder(
future: getCategorias(), // Asegúrate de tener una función getCategorias en tu archivo CRUD personalizado
builder: ((context, snapshot) {
  if (snapshot.hasData) {
return ListView.builder(
itemCount: snapshot.data?.length,
itemBuilder: ((context, index) {
return Dismissible(
onDismissed: (direction) async {
await deleteCategoria(snapshot.data?[index]["id"]);
snapshot.data?.removeAt(index);
setState(() {});
},
confirmDismiss: (direction) async {
bool result = false;
result = await showDialog(
context: context,
builder: (context) {
return AlertDialog(
title: Text(
"¿Realmente desea eliminar la categoría${snapshot.data?[index]['nombre']}?"),
actions: [
TextButton(
onPressed: () {
Navigator.pop(context, false);
},
child: const Text(
"Cancelar",
style: TextStyle(
fontSize: 14,
fontWeight: FontWeight.bold,
color: Colors.amber,
),
),
),
TextButton(
onPressed: () {
Navigator.pop(context, true);
},
child: const Text("Aceptar"),
)
],
);
},
);
return result;
},
background: Container(
color: Colors.red,
child: const Icon(Icons.delete),
),
key: Key(snapshot.data?[index]['id']),
direction: DismissDirection.endToStart,
child: Card(
elevation: 10,
clipBehavior: Clip.hardEdge,
shape: const RoundedRectangleBorder(
side: BorderSide(
color: Colors.black,
),
borderRadius: BorderRadius.all(Radius.circular(12)),
),
child: InkWell(
splashColor: Colors.grey,
onTap: () async {
await Navigator.pushNamed(context, "/edit",
arguments: {
'id': snapshot.data?[index]['id'],
'nombre': snapshot.data?[index]['nombre'],
'estado': snapshot.data?[index]['estado'],
});
setState(() {});
},
child: SizedBox(
width: 300,
height: 100,
child: Center(
child: Text(
snapshot.data?[index]['nombre'],
style: const TextStyle(
fontSize: 20,
fontWeight: FontWeight.bold,
color: Colors.blue
),
),
),
),
),
),
);
}),
);
} else {
return const Center(
child: CircularProgressIndicator(),
);
}
}),
),
floatingActionButton: FloatingActionButton(
onPressed: () async {
await Navigator.pushNamed(context, "/add");
setState(() {});
},
child: const Icon(Icons.add),
),
);
}
}
