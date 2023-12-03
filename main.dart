import 'package:flutter/material.dart';
import 'bienvenida.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // Variables para identificar los campos de texto
  static var txtLogin = TextEditingController();
  static var txtPass = TextEditingController();

  // Método para construir el conjunto de Widgets de la app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multiformularios',
      theme: ThemeData.dark(useMaterial3: true),
      home: LoginForm(),
    );
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiformularios'),
      ),
      body: Column(
        children: [
          // Imagen
          Padding(
            padding: EdgeInsets.all(40),
            child: Center(
              child: Image.asset(
                "img/usuario.png",
                width: 100,
              ),
            ),
          ),

          // Campo de texto para el login
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                hintText: "Login",
              ),
              controller: MyApp.txtLogin,
            ),
          ),

          // Campo de texto para el password
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                hintText: "Password",
              ),
              controller: MyApp.txtPass,
            ),
          ),

          // El botón
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton.icon(
              icon: Icon(Icons.login),
              label: Text("Validar Usuario"),
              onPressed: () => _validarUsuario(context),
            ),
          )
        ],
      ),
    );
  }

  // Método para validar el usuario y contraseña
  void _validarUsuario(BuildContext context) {
    if (MyApp.txtLogin.text == "sipis" && MyApp.txtPass.text == "1234") {
      // Si es válido, navegar a la pantalla de bienvenida
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Bienvenida()),
      );
    } else {
      // Si no es válido, mostrar mensaje de error
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Usuario o contraseña incorrectos"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Aceptar"),
              ),
            ],
          );
        },
      );
    }
  }
}