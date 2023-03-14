class Instructions {
  Instructions({
    required this.instruction,
    required this.addedStep,
  });
  final String instruction;
  bool addedStep;
}

List<Instructions> oatmealSteps = [
  Instructions(instruction: 'Mix water, oatmeal and salt.', addedStep: false),
  Instructions(
      instruction: 'Bring to the boil and simmer for a couple of minutes.',
      addedStep: false),
  Instructions(
      instruction: 'Serve with milk and condiment of your choice.',
      addedStep: false)
];

List<Instructions> veggieSoupSteps = [
  Instructions(
      instruction: 'Peel and wash all the vegetables.', addedStep: false),
  Instructions(
      instruction: 'Cut all the vegetables into even-sized pieces.',
      addedStep: false),
  Instructions(
      instruction: 'Fry everything lightly in a pot with the oil.',
      addedStep: false),
  Instructions(
      instruction:
          'Pour the water and add the broth cubes, let it boil til the veggies are soft.',
      addedStep: false),
  Instructions(instruction: 'Taste with salt and pepper', addedStep: false),
];

List<Instructions> greekSaladSteps = [
  Instructions(instruction: 'Peel and slice the onion.', addedStep: false),
  Instructions(instruction: 'Dice cucumber and tomatoes.', addedStep: false),
  Instructions(
      instruction: 'Break the cheese into smaller pieces.', addedStep: false),
  Instructions(
      instruction: 'Mix all the vegetables carefully in a bowl.',
      addedStep: false),
  Instructions(
      instruction: 'Mix the oil and vinegar into a dressing.',
      addedStep: false),
  Instructions(
      instruction: 'Pick the leaves of the oregano.', addedStep: false),
  Instructions(
      instruction:
          'Drizzle over the dressing and top with oregano and black pepper.',
      addedStep: false),
];

List<Instructions> broccoliSoupSteps = [
  Instructions(
      instruction: 'Peel and cut the onion and potatoes.', addedStep: false),
  Instructions(instruction: 'Dice up the broccoli.', addedStep: false),
  Instructions(
      instruction: 'Bring the stock to a boil, add all vegetables.',
      addedStep: false),
  Instructions(
      instruction: 'Boil for 10 minutes, or til the veggies are soft.',
      addedStep: false),
  Instructions(
      instruction: 'Mix the soup with a immersion blender or food processor.',
      addedStep: false),
  Instructions(
      instruction:
          'Add cooking cream to the soup, season with salt and pepper.',
      addedStep: false),
];
