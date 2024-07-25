DECLARE @pokemon_name VARCHAR(100);

-- Pokemon to be deleted
SET @pokemon_name = 'Patito';

-- All operations complete or none do 
BEGIN TRANSACTION;

DELETE FROM trainer_pokemon
WHERE pokemon_id IN (SELECT id FROM pokemon WHERE name = @pokemon_name);

DELETE FROM battles
WHERE pokemon_one IN (SELECT id FROM pokemon WHERE name = @pokemon_name)
   OR pokemon_two IN (SELECT id FROM pokemon WHERE name = @pokemon_name);

DELETE FROM pokemon
WHERE name = @pokemon_name;

COMMIT;

