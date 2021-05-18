import 'package:flutter/cupertino.dart';
import 'package:hero_app/heroModel.dart';

class HeroesController extends ChangeNotifier {

  List<HeroModel> heroes = [
    HeroModel(name: "Hulk"),
    HeroModel(name: "Americ Captain"),
    HeroModel(name: "Thor"),
    HeroModel(name: "Iron man"),
    HeroModel(name: "Spider man"),
  ];

  checkFavorite(HeroModel model){
    model.isFavorite = !model.isFavorite;
    notifyListeners();
  }

}