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
  });

  String title;
  String subtitle;
  String imageURL;
  String linkAppStore;
  String linkGooglePlay;
  Image image;
  IconData icon1;
  IconData icon2;

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
      image: Image.network(
          'https://lh3.googleusercontent.com/pKT453nwT0PMPJWkhteh0j8LIoHA4eT7UJ6hZZW3tjxUGO8gfUrc2Mk4Pr5uVepbmWdI=s180-rw'),
      icon1: Icons.android,
      icon2: Icons.backup,
      linkGooglePlay:
          'https://play.google.com/store/apps/details?id=com.apodaca.app&hl=en'),
  PortfolioItem(
    title: 'Endless Beats',
    subtitle: 'Videojuego',
    image: Image.network(
        'https://lh3.googleusercontent.com/aynFiHgvTqoWPgQ5LB81d8WqrRkVgzbhiFheiEC--IcO6evRpcFt--e7HAK2g9i6OU6j=s180-rw'),
    linkGooglePlay:
    'https://play.google.com/store/apps/details?id=com.apodaca.game&hl=en',
    linkAppStore:
    'https://apps.apple.com/us/app/endless-beats/id1524127084#?platform=iphone',
  ),
  PortfolioItem(
      title: 'Tri-Go Math',
      subtitle: 'Aplicacion',
      image: Image.network(
          'https://lh3.googleusercontent.com/ilouuYQ_h6BCwtW6yDiXk_pFfKNn0CEQjxmngtFxT48_TN-Fe7ZVuos0iVEiFHpAGQ=s180-rw'),
      linkGooglePlay:
      'https://play.google.com/store/apps/details?id=com.apodaca.math_helper&hl=en',
      linkAppStore: 'https://apps.apple.com/us/app/tri-go-math/id1525513476'),
];

//GridView.builder(
//gridDelegate:
//SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
//itemBuilder: (context, index) {},
//)
