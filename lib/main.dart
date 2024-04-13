import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotelclementina/pantallas/habitaciones.dart';
import 'package:hotelclementina/pantallas/reservaciones.dart';
import 'package:hotelclementina/pantallas/inicio.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TravelApp(),
  ));
}

class TravelApp extends StatefulWidget {
  const TravelApp({Key? key}) : super(key: key);

  @override
  State<TravelApp> createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Inicio(),
    Categoria(),
    Reservaciones(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 114, 128, 235),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // IconButton( onPressed: () {}, icon: Icon( Icons.menu,color: Colors.black,),)
             Image.asset(
                'images/logoHD.png',
                height: 40, // Altura deseada de la imagen
                width: 40, // Ancho deseado de la imagen
              ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            SizedBox(height: 30.0),
            content(),
            SizedBox(height: 30.0),
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
                        children: _screens,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget content() {
    return Container(
      child: CarouselSlider(
        items: [
          'images/hotel1.jpg', // Ruta de la primera imagen
          'images/hotel2.jpg', // Ruta de la segunda imagen
          'images/hotel3.jpeg', // Ruta de la tercera imagen
          'images/hotel4.jpeg', // Ruta de la cuarta imagen
          'images/hoteln.jpg', // Ruta de la quinta imagen
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
          viewportFraction: 1, // 1 significa que ocupa todo el ancho del contenedor
          enableInfiniteScroll: true, // Permitir desplazamiento infinito
          autoPlay: true, // Reproducción automática
          autoPlayInterval: Duration(seconds: 3), // Intervalo de cambio de imagen
        ),
      ),
    );
  }
}
