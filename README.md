# README

## Run the application

This application can be executed by using docker. To run the application you only need to run the following command if you have already installed `docker-compose` plugin.

```sh
  docker-compose up
```

Please note that the port 3000 should not be used by another application.

## Architecture
I have decided to use one table to include the characters. Also, since I assumed that the `Type` of the characters is limited, I used `enums` to declare the types. The reason to use enums would be the scaleablity. I can replace it in future if I have more types. It means instead of use of enums I can introduce another model called `CharacterType` which can be related to each character by using a `:belongs_to` relationship.

## Call methods
Characters can be added, listed, showed, or updated by using the following methods.

### GET
To list all characters the following API call can be used. You can define the page number and the number of records per page.
```
$ curl --location --request GET 'localhost:3000/characters?page=1&per_page=10'
```
The resulting object will be:

```JSON
{
    "pagination": {
        "current": 1,
        "prev_page": null,
        "next_page": 2,
        "total_pages": 80,
        "count": 800
    },
    "collection": [
        {
            "id": 1,
            "name": "Bulbasaur",
            "first_type": "grass",
            "second_type": "poison",
            "hp_score": 45,
            "attack_score": 49,
            "defense_score": 49,
            "sp_attack_score": 65,
            "sp_defense_score": 65,
            "speed": 45,
            "generation": 1,
            "is_legendary": false,
            "created_at": "2022-09-24T04:29:00.062Z",
            "updated_at": "2022-09-24T04:29:00.062Z",
            "total_score": 318
        },
        {
            "id": 2,
            "name": "Ivysaur",
            "first_type": "grass",
            "second_type": "poison",
            "hp_score": 60,
            "attack_score": 62,
            "defense_score": 63,
            "sp_attack_score": 80,
            "sp_defense_score": 80,
            "speed": 60,
            "generation": 1,
            "is_legendary": false,
            "created_at": "2022-09-24T04:29:00.077Z",
            "updated_at": "2022-09-24T04:29:00.077Z",
            "total_score": 405
        },
        {
            "id": 3,
            "name": "Venusaur",
            "first_type": "grass",
            "second_type": "poison",
            "hp_score": 80,
            "attack_score": 82,
            "defense_score": 83,
            "sp_attack_score": 100,
            "sp_defense_score": 100,
            "speed": 80,
            "generation": 1,
            "is_legendary": false,
            "created_at": "2022-09-24T04:29:00.092Z",
            "updated_at": "2022-09-24T04:29:00.092Z",
            "total_score": 525
        },
        {
            "id": 4,
            "name": "VenusaurMega Venusaur",
            "first_type": "grass",
            "second_type": "poison",
            "hp_score": 80,
            "attack_score": 100,
            "defense_score": 123,
            "sp_attack_score": 122,
            "sp_defense_score": 120,
            "speed": 80,
            "generation": 1,
            "is_legendary": false,
            "created_at": "2022-09-24T04:29:00.108Z",
            "updated_at": "2022-09-24T04:29:00.108Z",
            "total_score": 625
        },
        {
            "id": 5,
            "name": "Charmander",
            "first_type": "fire",
            "second_type": null,
            "hp_score": 39,
            "attack_score": 52,
            "defense_score": 43,
            "sp_attack_score": 60,
            "sp_defense_score": 50,
            "speed": 65,
            "generation": 1,
            "is_legendary": false,
            "created_at": "2022-09-24T04:29:00.122Z",
            "updated_at": "2022-09-24T04:29:00.122Z",
            "total_score": 309
        },
        {
            "id": 6,
            "name": "Charmeleon",
            "first_type": "fire",
            "second_type": null,
            "hp_score": 58,
            "attack_score": 64,
            "defense_score": 58,
            "sp_attack_score": 80,
            "sp_defense_score": 65,
            "speed": 80,
            "generation": 1,
            "is_legendary": false,
            "created_at": "2022-09-24T04:29:00.137Z",
            "updated_at": "2022-09-24T04:29:00.137Z",
            "total_score": 405
        },
        {
            "id": 7,
            "name": "Charizard",
            "first_type": "fire",
            "second_type": "flying",
            "hp_score": 78,
            "attack_score": 84,
            "defense_score": 78,
            "sp_attack_score": 109,
            "sp_defense_score": 85,
            "speed": 100,
            "generation": 1,
            "is_legendary": false,
            "created_at": "2022-09-24T04:29:00.150Z",
            "updated_at": "2022-09-24T04:29:00.150Z",
            "total_score": 534
        },
        {
            "id": 8,
            "name": "CharizardMega Charizard X",
            "first_type": "fire",
            "second_type": "dragon",
            "hp_score": 78,
            "attack_score": 130,
            "defense_score": 111,
            "sp_attack_score": 130,
            "sp_defense_score": 85,
            "speed": 100,
            "generation": 1,
            "is_legendary": false,
            "created_at": "2022-09-24T04:29:00.162Z",
            "updated_at": "2022-09-24T04:29:00.162Z",
            "total_score": 634
        },
        {
            "id": 9,
            "name": "CharizardMega Charizard Y",
            "first_type": "fire",
            "second_type": "flying",
            "hp_score": 78,
            "attack_score": 104,
            "defense_score": 78,
            "sp_attack_score": 159,
            "sp_defense_score": 115,
            "speed": 100,
            "generation": 1,
            "is_legendary": false,
            "created_at": "2022-09-24T04:29:00.172Z",
            "updated_at": "2022-09-24T04:29:00.172Z",
            "total_score": 634
        },
        {
            "id": 10,
            "name": "Squirtle",
            "first_type": "water",
            "second_type": null,
            "hp_score": 44,
            "attack_score": 48,
            "defense_score": 65,
            "sp_attack_score": 50,
            "sp_defense_score": 64,
            "speed": 43,
            "generation": 1,
            "is_legendary": false,
            "created_at": "2022-09-24T04:29:00.185Z",
            "updated_at": "2022-09-24T04:29:00.185Z",
            "total_score": 314
        }
    ]
}
```


