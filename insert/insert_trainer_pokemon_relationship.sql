-- Inserts a relationship between a trainer and a Pokémon into the trainer_pokemon table
INSERT INTO trainer_pokemon (trainer_id, pokemon_id) 
SELECT
    (SELECT id from trainers WHERE name = 'Lucas Valdez'),
    (SELECT id from pokemon WHERE name = 'Pikachu');
