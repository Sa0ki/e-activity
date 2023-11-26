class Activity {
  final String image;
  final String titre;
  final String categorie;
  final String lieu;
  final int nombreDePersonnesMin;
  final double prix;
  Activity(
      {required this.image,
      required this.titre,
      required this.categorie,
      required this.lieu,
      required this.nombreDePersonnesMin,
      required this.prix});
}
