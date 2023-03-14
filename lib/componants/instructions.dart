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
