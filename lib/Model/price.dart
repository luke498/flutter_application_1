class Price {
  String name;
  int quantity;
  String unit;
  List<Price> prices = [];

  Price({
    required this.name, 
    required this.quantity, 
    required this.unit});
}