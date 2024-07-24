DECLARE @update_trainer VARCHAR(100);
DECLARE @new_name VARCHAR(100);
DECLARE @new_gender VARCHAR(20);
DECLARE @new_region VARCHAR(50);
DECLARE @new_age INT;
DECLARE @new_trainer_class VARCHAR(50);
DECLARE @update_pokemon VARCHAR(100);
DECLARE @new_generation VARCHAR(10);
DECLARE @new_category VARCHAR(50);
DECLARE @new_type_primary VARCHAR(20);
DECLARE @new_type_secondary VARCHAR(20);
DECLARE @new_level INT;
DECLARE @new_hp INT;
DECLARE @new_attack INT;
DECLARE @new_defense INT;
DECLARE @new_speed INT;
DECLARE @trainer_name VARCHAR(100);
DECLARE @pokemon_name VARCHAR(100);

-- CRUD 

-- C (Create)/Insert

-- Inserts a new trainer into the trainers table
INSERT INTO trainers (name, gender, region, age, trainer_class) 
VALUES ('Lucas Valdez', 'Male', 'Luque', 24, 'Champion');

-- Inserts a new Pokemon into the pokemon table
INSERT INTO pokemon (name, generation, category, type_primary, type_secondary, level, hp, attack, defense, speed) 
VALUES ('Patito', 'Gen 0', 'Rat', 'Wind', 'Toxic', 14, 100, 100, 100, 100);

-- Inserts a new battle record 
INSERT INTO battles (date, trainer_one, trainer_two, pokemon_one, pokemon_two, winner)
SELECT 
    '2024-07-26', -- Battle date
    (SELECT id FROM trainers WHERE name = 'Lucas'), -- Trainer One ID
    (SELECT id FROM trainers WHERE name = 'Ash Ketchum'), -- Trainer Two ID
    (SELECT id FROM pokemon WHERE name = 'Patito'), -- Pokémon One ID
    (SELECT id FROM pokemon WHERE name = 'Pikachu'), -- Pokémon Two ID
    (SELECT id FROM trainers WHERE name = 'Lucas'); -- Winner ID

-- Inserts a relationship between a trainer and a Pokémon into the trainer_pokemon table
INSERT INTO trainer_pokemon (trainer_id, pokemon_id) 
SELECT
    (SELECT id from trainers WHERE name = 'Lucas Valdez'),
    (SELECT id from pokemon WHERE name = 'Patito');

-- R (Read)/Select

-- Retrieves all trainers who have a specific Pokémon
SELECT t.name AS trainer_name, p.name AS pokemon_name
FROM trainers t
JOIN trainer_pokemon tp ON t.id = tp.trainer_id
JOIN pokemon p ON tp.pokemon_id = p.id
WHERE p.name = 'Patito';

-- Retrieves all pokemon and their associated trainer
SELECT t.name AS trainer_name, p.name AS pokemon_name
FROM trainers t
JOIN trainer_pokemon tp ON t.id = tp.trainer_id
JOIN pokemon p ON tp.pokemon_id = p.id;

-- Retrieves all Pokémon associated with a specific trainer
SELECT t.name AS trainer_name, p.name AS pokemon_name
FROM trainers t
JOIN trainer_pokemon tp ON t.id = tp.trainer_id
JOIN pokemon p ON tp.pokemon_id = p.id
WHERE t.name = 'Lucas Valdez';

-- Retrieves details of a specific battle including trainer and Pokémon names
SELECT b.date, 
       t1.name AS trainer_one_name, 
       p1.name AS pokemon_one_name, 
       t2.name AS trainer_two_name, 
       p2.name AS pokemon_two_name, 
       t_winner.name AS winner_name
FROM battles b
JOIN trainers t1 ON b.trainer_one = t1.id
JOIN trainers t2 ON b.trainer_two = t2.id
JOIN pokemon p1 ON b.pokemon_one = p1.id
JOIN pokemon p2 ON b.pokemon_two = p2.id
JOIN trainers t_winner ON b.winner = t_winner.id
WHERE b.id = 24; -- Replace

-- U (Update)

-- * Updates information for a specific trainer
DECLARE @update_trainer VARCHAR(100);
DECLARE @new_name VARCHAR(100);
DECLARE @new_gender VARCHAR(100);
DECLARE @new_region VARCHAR(100);
DECLARE @new_age INT;
DECLARE @new_trainer_class VARCHAR(100);

SET @update_trainer = 'Lucas';

-- Updates to be made 
SET @new_name = 'Lucas Valdez';
SET @new_gender = 'Male';
SET @new_region = 'Palma Loma';
SET @new_age = 25;
SET @new_trainer_class = 'Champion';

-- Updates information for a specific trainer
UPDATE trainers 
SET 
    name = @new_name, 
    gender = @new_gender, 
    region = @new_region, 
    age = @new_age, 
    trainer_class = @new_trainer_class
WHERE name = @update_trainer;

-- * Updates details for a specific Pokémon
DECLARE @update_pokemon VARCHAR(100);
DECLARE @new_name VARCHAR(100);
DECLARE @new_generation VARCHAR(100);
DECLARE @new_category VARCHAR(100);
DECLARE @new_type_primary VARCHAR(100);
DECLARE @new_type_secondary VARCHAR(100);
DECLARE @new_level INT;
DECLARE @new_hp INT;
DECLARE @new_attack INT;
DECLARE @new_defense INT;
DECLARE @new_speed INT;

SET @update_pokemon = 'Pikachu';

SET @new_name = 'NewName';
SET @new_generation = 'Gen 2';
SET @new_category = 'NewCategory';
SET @new_type_primary = 'NewPrimaryType';
SET @new_type_secondary = 'NewSecondaryType';
SET @new_level = 50;
SET @new_hp = 100;
SET @new_attack = 80;
SET @new_defense = 70;
SET @new_speed = 90;

UPDATE pokemon
SET 
    name = @new_name,
    generation = @new_generation,
    category = @new_category,
    type_primary = @new_type_primary,
    type_secondary = @new_type_secondary,
    level = @new_level,
    hp = @new_hp,
    attack = @new_attack,
    defense = @new_defense,
    speed = @new_speed
WHERE name = @update_pokemon;

-- * Updates the result of a specific battle
UPDATE battles
SET winner = 2 
WHERE id = 1; -- Replace with battle ID

-- D (Delete)

-- * Delete trainer 
DECLARE @trainer_name VARCHAR(100);
-- Trainer to be deleted
SET @trainer_name = 'Ash Ketchum';

-- All operations complete or none do 
BEGIN TRANSACTION;

DELETE FROM trainer_pokemon 
WHERE trainer_id IN (SELECT id from trainers WHERE name = @trainer_name);

DELETE FROM battles
WHERE trainer_one IN (SELECT id from trainers WHERE name = @trainer_name)
   OR trainer_two IN (SELECT id from trainers WHERE name = @trainer_name);

DELETE FROM trainers 
WHERE name = @trainer_name;

COMMIT;

-- * Delete pokemon
DECLARE @pokemon_name VARCHAR(100);
-- Pokemon to be deleted
SET @pokemon_name = 'Pikachu';

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

-- * Delete trainer_pokemon relationship
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

