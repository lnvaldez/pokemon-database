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

-- Updates details for a specific Pokémon
SET @update_pokemon = 'Rayquaza';

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