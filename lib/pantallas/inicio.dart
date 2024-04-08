// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hotelclementina/pantallas/habitaciones.dart';
import 'package:hotelclementina/pantallas/reservaciones.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 114, 128, 235),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logoHD.png',
              height: 40,
              width: 40,
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bienvenido a Hotel Clementina',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Tu Lugar de Destino',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 10.0),
                if (_selectedIndex == 0) // Mostrar el carrusel solo si está seleccionada la pantalla de inicio
                  content(),
                SizedBox(height: 10.0),
              ],
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: Color(0xFFFE8C68),
                    unselectedLabelColor: Color(0xFF555555),
                    labelColor: Color(0xFFFE8C68),
                    labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
                    tabs: [
                      Tab(
                        text: "Inicio",
                      ),
                      Tab(
                        text: "Habitaciones",
                      ),
                      Tab(
                        text: "Reservaciones",
                      ),
                    ],
                    onTap: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
                  Expanded(
                    child: IndexedStack(
                      index: _selectedIndex,
                      children: [
                        InicioHotel(), // Contenido relacionado con el hotel
                        Habitaciones(), // Pantalla de habitaciones
                        Reservaciones(), // Pantalla de reservaciones
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget content() {
    return CarouselSlider(
      items: [
        'images/hotel1.jpg',
        'images/hotel2.jpg',
        'images/hotel3.jpeg',
        'images/hotel4.jpeg',
        'images/hoteln.jpg',
      ].map((String imagePath) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 300,
        viewportFraction: 1,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
      ),
    );
  }
}

class InicioHotel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Servicios del Hotel',
            style: TextStyle(
              color: Colors.black,
              fontSize: 26.0,
              fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Ofrecemos desayuno incluido para todos nuestros huéspedes.',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'Todas nuestras habitaciones están equipadas con aire acondicionado.',
            textAlign: TextAlign.center,
          ),
          // Aquí puedes agregar más información sobre los servicios ofrecidos por el hotel
        ],
      ),
    );
  }
}
