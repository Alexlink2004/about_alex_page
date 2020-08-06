import 'package:flutter/material.dart';

class PortfolioItem {
  PortfolioItem({
    this.title,
    this.image,
    this.subtitle,
    this.url,
    this.icon1 = Icons.android,
    this.icon2 = Icons.phone_android,
  });

  String title;
  String subtitle;
  String url;
  Image image;
  IconData icon1;
  IconData icon2;
}

List<PortfolioItem> portfolioItems = [
  PortfolioItem(
    title: 'Alex vs virus',
    subtitle: 'Videojuego',
    image: Image.network(
        'https://lh3.googleusercontent.com/pKT453nwT0PMPJWkhteh0j8LIoHA4eT7UJ6hZZW3tjxUGO8gfUrc2Mk4Pr5uVepbmWdI=s180-rw'),
    icon1: Icons.android,
    icon2: Icons.backup,
  ),
  PortfolioItem(
    title: 'Endless Beats',
    subtitle: 'Videojuego',
    image: Image.network(
        'https://lh3.googleusercontent.com/aynFiHgvTqoWPgQ5LB81d8WqrRkVgzbhiFheiEC--IcO6evRpcFt--e7HAK2g9i6OU6j=s180-rw'),
  ),
  PortfolioItem(
    title: 'Tri-Go Math',
    subtitle: 'Aplicacion',
    image: Image.network(
        'https://lh3.googleusercontent.com/ilouuYQ_h6BCwtW6yDiXk_pFfKNn0CEQjxmngtFxT48_TN-Fe7ZVuos0iVEiFHpAGQ=s180-rw'),
  ),
];

//GridView.builder(
//gridDelegate:
//SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
//itemBuilder: (context, index) {},
//)