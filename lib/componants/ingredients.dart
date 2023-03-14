class Ingredients {
  Ingredients({
    required this.ingredient,
    required this.addedStep,
  });
  final String ingredient;
  bool addedStep;
}

List<Ingredients> oatmealIngredients = [
  Ingredients(
    ingredient: '2 dl Water',
    addedStep: false,
  ),
  Ingredients(
    ingredient: '1 dl Oatmeal',
    addedStep: false,
  ),
  Ingredients(
    ingredient: 'A pinch of salt',
    addedStep: false,
  )
];

List<Ingredients> veggieSoupIngredients = [
  Ingredients(ingredient: 'Vegetable oil', addedStep: false),
  Ingredients(ingredient: '2 Carrots', addedStep: false),
  Ingredients(ingredient: '5 Potatoes', addedStep: false),
  Ingredients(ingredient: '1 Leek', addedStep: false),
  Ingredients(ingredient: '0,5 Cauliflower', addedStep: false),
  Ingredients(ingredient: '1 Broccoli', addedStep: false),
  Ingredients(ingredient: '1 Parsnip', addedStep: false),
  Ingredients(ingredient: '0,5 Celeriac', addedStep: false),
  Ingredients(ingredient: '2 dl Water', addedStep: false),
  Ingredients(ingredient: '2 Vegetable broth cubes', addedStep: false),
  Ingredients(ingredient: 'Salt and pepper', addedStep: false),
];

// add ingredients for greekSalatIngredients:
