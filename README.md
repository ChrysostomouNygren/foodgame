# Simple drag-and-drop game
Built-in flutter to learn the framework, you can add your own kind of recipes and drag-and-drop items!

## How to add drag-and-drop items:
1. Add the picture or illustration of the item to the folder *assets*

2. Localize *pages/game_page.dart*  
There you will find two very similar lists, and the code you will add to them is practically the same.  
The information you have to add is the name of the item, if it's healthy (this is a boolean, meaning it's either true or false), an id that should be the next number in line, and the image you imported in step 1.  
Add the item to both lists like the following example:
```bash
Item(
    name: 'Item name',
    healthy: boolean,
    uid: number,
    imageProvider: AssetImage('assets/item_name.format'),
),
```

## How to add recipes:
>It is important that you name everything accordingly to what the recipe is. Just exchange the *meal* in the examples to what your recipe is about. Like PokeBowl, MashedPotatoes etc.  
This is to make it easier to find everything in the code. :)

1. Add the picture or illustration to the folder *assets*

2. Localize *components/ingredients.dart*  
Add your ingredients as the following example:
```bash
List<Ingredients> mealIngredients = [  
Ingredients(ingredient: '1 ingredient', addedStep: false),  
Ingredients(ingredient: '2 dl ingredient', addedStep: false),
];
```
3. Localize *component/instructions.dart*  
Add your instructions as the following example:

```bash
List<Instructions> mealInstructions = [  
Instructiopn(instruction: 'Do this', addedStep: false),
Instructiopn(instruction: 'Now do this', addedStep: false),
];
```
3. Localize *component/build_ingredients.dart*  
Build a widget like the following example:
```bash
Widget buildMealIngredients() {  
    return _buildingredientList(mealInstructions);  
}
```
4. Localize *component/build_instructions.dart*  
Build a widget like the following example:
```bash
Widget buildMealInstructions() {  
    return _buildinstructions(mealInstructions);
}
```
5. Localize *component/build_recipes.dart*  
Create a stateless widget, the quick command is ***stl***.  
It should look like this:
```bash
class Meal extends StatelessWidget {  
    const Meal({super.key});  

    @override
    Widget build(BuildContext context) {
        return _buildRecipe(
            'assets/picture.format',
        buildMealIngredients(),
        buildMealInstructions()
        );
    }
}
```
6. Localize *pages/recipes_page.dart*  
Add your recipe to the list of already existing recipes. The id should be the next number in line.  
It should look something like this:
```bash
Recipe(
    name: 'Meal',
    description: 'A small description about the meal',
    uid: number,
    imageProvider: AssetImage('assets/picture.format')
),
```
7. Localize *pages/recipe_page.dart*  
Add the recipe to the if-statement, above the else-statement that throws an error, like this:
```bash
else if {
return const Meal();
}
```