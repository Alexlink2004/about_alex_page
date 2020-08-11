import 'package:flutter/material.dart';

class PortfolioItem {
  PortfolioItem({
    this.title,
    this.image,
    this.subtitle,
    this.imageURL,
    this.icon1 = Icons.android,
    this.icon2 = Icons.phone_android,
    this.linkAppStore,
    this.linkGooglePlay,
    this.description,
  });

  String title;
  String subtitle;
  String imageURL;
  String linkAppStore;
  String linkGooglePlay;
  Image image;
  IconData icon1;
  IconData icon2;
  String description;

  bool isAppStore() {
    if (linkAppStore == null) {
      return false;
    } else {
      return true;
    }
  }
}

List<PortfolioItem> portfolioItems = [
  PortfolioItem(
    title: 'Alex vs virus',
    subtitle: 'Videojuego',
    image: Image.asset('assets/images/alexvsvirus.webp'),
    icon1: Icons.android,
    icon2: Icons.backup,
    linkGooglePlay:
        'https://play.google.com/store/apps/details?id=com.apodaca.app&hl=en',
    description:
        'Alex vs Virus es un videojuego arcade en el cual el objetivo es esquivar los obstaculos que se presenten y llegar lo mas lejos posible',
  ),
  PortfolioItem(
    title: 'Endless Beats',
    subtitle: 'Videojuego',
    image: Image.asset('assets/images/Endless.webp'),
    linkGooglePlay:
        'https://play.google.com/store/apps/details?id=com.apodaca.game&hl=en',
    linkAppStore:
        'https://apps.apple.com/us/app/endless-beats/id1524127084#?platform=iphone',
    description:
        'Endless Beats es un videojuego ritmico en el cual el proposito es no tocar los hexagonos y durar el mayor tiempo posible para desbloquear personajes.',
  ),
  PortfolioItem(
    title: 'Tri-Go Math',
    subtitle: 'Aplicacion',
    image: Image.asset('assets/images/trigomath.webp'),
    linkGooglePlay:
    'https://play.google.com/store/apps/details?id=com.apodaca.math_helper&hl=en',
    linkAppStore: 'https://apps.apple.com/us/app/tri-go-math/id1525513476',
    description:
    'Tri-Go Math es una app en desarrollo en el cual el proposito principal es ayudar a estudiantes a realizar su tarea de manera mas eficaz, incluyendo temas de trigonometria, geometria y conversiones.',
  ),
];

//GridView.builder(
//gridDelegate:
//SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
//itemBuilder: (context, index) {},
//)

// This Webpage was created by Alejandro Apodaca Cordova in Mexicali, BC, Mexico,
// please give me a star in github: https://github.com/Alexlink2004/about_alex_page.
// Follow me on twitter: @AlexApo26
