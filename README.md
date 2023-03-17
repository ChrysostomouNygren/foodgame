# Simple drag-and-drop game
>Built-in flutter to learn the framework, you can add your recipes and drag-and-drop items!

## How to add drag-and-drop items:
- Localize the folder *assets*
1. Add the picture or illustration of the item to the folder */game_images*

2. Add the relevant information of the item in the *game_items.json* file.  
It should look like this:
```bash
...},
{
    "id": number,
    "name": "Name",
    "healthy": true or false,
    "img": "assets/game_images/(image_name).format"
}
```
>It's always easy to look at how the previous items look and just copy the format.

## How to add recipes:
 - Localize the folder *assets*

1. Add the picture or illustration of the item to the folder */recipe_images*

2. Add the relevant information of the item in the *recipes.json* file.
It should look like this:
```bash
...},
{
    "id": number,
    "name": "Name",
    "description": "Short description",
    "img": "assets/recipe_images/(image_name).format",
    "ingredients": [
        {"ingredient": "One ingredient", "added": false},
        {"ingredient": "One ingredient", "added": false}
    ],
    "instructions": [
        {"instruction": "One instruction"},
        {"instruction": "One instruction"},
        {"instruction": "One instruction"}
    ]
}
```

>It's always easy to look at how the previous items look and just copy the format.# Simple drag-and-drop game
>Built-in flutter to learn the framework, you can add your recipes and drag-and-drop items!

## How to add drag-and-drop items:
- Localize the folder *assets*
1. Add the picture or illustration of the item to the folder */game_images*

2. Add the relevant information of the item in the *game_items.json* file.  
It should look like this:
```bash
...},
{
    "id": number,
    "name": "Name",
    "healthy": true or false,
    "img": "assets/game_images/(image_name).format"
}
```
>It's always easy to look at how the previous items look and just copy the format.

## How to add recipes:
 - Localize the folder *assets*

1. Add the picture or illustration of the item to the folder */recipe_images*

2. Add the relevant information of the item in the *recipes.json* file.
It should look like this:
```bash
...},
{
    "id": number,
    "name": "Name",
    "description": "Short description",
    "img": "assets/recipe_images/(image_name).format",
    "ingredients": [
        {"ingredient": "One ingredient", "added": false},
        {"ingredient": "One ingredient", "added": false}
    ],
    "instructions": [
        {"instruction": "One instruction"},
        {"instruction": "One instruction"},
        {"instruction": "One instruction"}
    ]
}
```

>It's always easy to look at how the previous items look and just copy the format.