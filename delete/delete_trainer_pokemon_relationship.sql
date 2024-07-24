DECLARE @trainer_name VARCHAR(100);
DECLARE @pokemon_name VARCHAR(100);

-- Delete all relationships for a specific trainer
SET @trainer_name = 'Ash Ketchum';

DELETE FROM trainer_pokemon
WHERE trainer_id = (SELECT id FROM trainers WHERE name = @trainer_name);


-- Delete all relationships for a specific pokemon
SET @pokemon_name = 'Pikachu';

DELETE FROM trainer_pokemon
WHERE pokemon_id = (SELECT id FROM pokemon WHERE name = @pokemon_name);

