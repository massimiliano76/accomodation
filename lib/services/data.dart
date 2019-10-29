import 'package:easyhome/screens/BudgetQuestion/budget_question.dart';
import 'package:easyhome/screens/CityQuestion/city_question.dart';
import 'package:easyhome/screens/PreferencesQuestion/preferences_question.dart';
import 'package:easyhome/screens/UniversityQuestion/university_question.dart';

class Data {
  static final List city = [
    'Palermo',
    'Napoli',
    'Firenze',
    'Sciacca',
    'Milano',
    'Roma',
  ];

  static final List university = [
    'Università 1',
    'Università 2',
    'Università 3',
    'Università 4',
    'Università 5',
  ];

  static final List budget = [
    '200€',
    '300€',
    '400€',
    '500€',
    '600€',
    '700€ +',
  ];

  static List<String> expandableLabel = [
    "Descrizione dell'appartamento",
    "Descrizione della zona",
    "Regole dell'appartamento",
    "Mezzi di trasporto",
    "Prezzo e disponibilità",
  ];

  static List<String> featureItemLabel = [
    "Ricerca personalizzata",
    "Prenota",
    "Smart contract",
    "Check in"
  ];

  static final List preference = ['Convivere', 'Stare da solo'];

  static final Map<int, dynamic> pages = {
    1: CityQuestion(),
    2: UniversityQuestion(),
    3: BudgetQuestion(),
    4: PreferencesQuestion(),
  };
}
