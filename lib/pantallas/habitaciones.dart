import 'package:flutter/material.dart';
import 'package:hotelclementina/reservar/reservar.dart'; // Importa la pantalla "Reservar"

class Habitaciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 400,
                height: 200,
                child: Image.asset('assets/habitacion1.jpg'), // Ruta de la primera imagen
              ), // Imagen 1
              SizedBox(height: 20), // Espacio entre las imágenes
              SizedBox(
                width: 400,
                height: 200,
                child: Image.asset('assets/habitacion2.jpg'), // Ruta de la segunda imagen
              ), // Imagen 2
              SizedBox(height: 20), // Espacio entre las imágenes
              SizedBox(
                width: 400,
                height: 200,
                child: Image.asset('assets/habitacion3.jpg'), // Ruta de la tercera imagen
              ), // Imagen 3
              SizedBox(height: 20), // Espacio entre las imágenes
              Text(
                'Selecciona una habitación para reservar', 
                style: TextStyle(fontSize: 18),
              ), // Texto
              SizedBox(height: 20), // Espacio entre el texto y el botón
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Reservar()), // Redirige a la pantalla "Reservar"
                  );
                },
                child: Text('Reservar'),
              ), // Botón
            ],
          ),
        ),
      ),
    );
  }
}
