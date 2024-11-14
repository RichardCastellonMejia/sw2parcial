import 'package:flutter/material.dart';
import 'package:parcial/screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Menú Principal'),
      ),
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Opacity(
              opacity: 0.5, // Nivel de opacidad
              child: Image.asset(
                'assets/images/cargador.png', // Ruta de la imagen
                fit: BoxFit.cover, // Para que la imagen cubra toda la pantalla
              ),
            ),
          ),
                  
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(                  
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const InfoScreen()),
                    // );
                  },
                  child: const Text('Informaciones'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const ContactScreen()),
                    // );
                  },
                  child: const Text('Contacto'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
