![example workflow](https://github.com/amirali-ashraf/plasir/actions/workflows/test.yml/badge.svg)

# README

## Run the application

This application can be executed by using docker. To run the application you only need to run the following command if you have already installed `docker-compose` plugin.

```bash
  docker-compose up
```

Please note that the port 3000 should not be used by another application.

## Architecture
I have decided to use one table to include the characters. Also, since I assumed that the `Type` of the characters is limited, I used `enums` to declare the types. The reason to use enums would be the scaleablity. I can replace it in future if I have more types. It means instead of use of enums I can introduce another model called `CharacterType` which can be related to each character by using a `:belongs_to` relationship.

## Call methods
Characters can be added, listed, showed, or updated by using the following methods.

### GET
To list all characters the following API call can be used. You can define the page number and the number of records per page. The default value for page is 1 and per_page is 10.
```bash
$ curl --location --request GET 'localhost:3000/characters?page=1&per_page=2'
```
The resulting object will be:

```JSON
{
    "pagination": {
        "current": 1,
        "prev_page": null,
        "next_page": 2,
        "total_pages": 400,
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
            "created_at": "2022-09-24T04:45:13.820Z",
            "updated_at": "2022-09-24T04:45:13.820Z",
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
            "created_at": "2022-09-24T04:45:13.834Z",
            "updated_at": "2022-09-24T04:45:13.834Z",
            "total_score": 405
        }
    ]
}
```

### POST
The post method is as follows. The validation is done through `character.rb` and all fields should be present and be in a defined range.

```bash
$ curl --location --request POST 'localhost:3000/characters' \
--data-raw '{
    "name": "test",
    "hp_score": "10" ,
    "first_type": "grass",
    "second_type": "bug",
    "attack_score": "20",
    "defense_score": "30",
    "sp_attack_score": "40",
    "sp_defense_score": "50",
    "speed": "60",
    "is_legendary": true,
    "generation": 6
}'
```

And the result will be:

```JSON
{
    "id": 801,
    "name": "test",
    "first_type": "grass",
    "second_type": "bug",
    "hp_score": 10,
    "attack_score": 20,
    "defense_score": 30,
    "sp_attack_score": 40,
    "sp_defense_score": 50,
    "speed": 60,
    "generation": 6,
    "is_legendary": true,
    "created_at": "2022-09-24T14:36:37.988Z",
    "updated_at": "2022-09-24T14:36:37.988Z",
    "total_score": 210
}
```

### UPDATE

The records can be updated by using the following API call. 

```bash
$ curl --location --request PUT 'localhost:3000/characters/801' \
--data-raw '{
    "name": "test",
    "hp_score": "10" ,
    "first_type": "grass",
    "second_type": "bug",
    "attack_score": "20",
    "defense_score": "30",
    "sp_attack_score": "40",
    "sp_defense_score": "50",
    "speed": "60",
    "is_legendary": true,
    "generation": 3
}'
```

And the result will be:

```json
{
    "name": "test",
    "first_type": "grass",
    "second_type": "bug",
    "hp_score": 10,
    "attack_score": 20,
    "defense_score": 30,
    "sp_attack_score": 40,
    "sp_defense_score": 50,
    "speed": 60,
    "generation": 3,
    "is_legendary": true,
    "id": 801,
    "created_at": "2022-09-24T14:36:37.988Z",
    "updated_at": "2022-09-24T14:39:18.539Z",
    "total_score": 210
}
```

### GET/SHOW

Each record can be retrieved by using the following API call:

```bash
$ curl --location --request GET 'localhost:3000/characters/801'
```

And the result will be:

```json
{
    "id": 801,
    "name": "test",
    "first_type": "grass",
    "second_type": "bug",
    "hp_score": 10,
    "attack_score": 20,
    "defense_score": 30,
    "sp_attack_score": 40,
    "sp_defense_score": 50,
    "speed": 60,
    "generation": 3,
    "is_legendary": true,
    "created_at": "2022-09-24T14:36:37.988Z",
    "updated_at": "2022-09-24T14:39:18.539Z",
    "total_score": 210
}
```

### DELETE

To delete a record the following API call can be used:

```bash
$ curl --location --request DELETE 'localhost:3000/characters/801' 
```

And if it is successfull, it will return true otherwise it will return an error.




