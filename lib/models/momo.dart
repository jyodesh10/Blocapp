import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Momo extends Equatable {
  final int id;
  final String name;
  final Image image;

  Momo({required this.id, required this.name, required this.image});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, image];

  static List<Momo> momos = [
    Momo(id: 0, name: "Momo 1", image: Image.asset("assets/image/momo.png")),
    Momo(id: 1, name: "Momo 2", image: Image.asset("assets/image/momo.png")),
    Momo(id: 2, name: "Momo 3", image: Image.asset("assets/image/momo.png")),
  ];
}
