-- Inserts a new battle record 
INSERT INTO battles (date, trainer_one, trainer_two, pokemon_one, pokemon_two, winner)
SELECT 
    '2024-07-26', -- Battle date
    (SELECT TOP 1 id FROM trainers WHERE name = 'Lucas'), -- Trainer One ID
    (SELECT TOP 1 id FROM trainers WHERE name = 'Johnny'), -- Trainer Two ID
    (SELECT TOP 1 id FROM pokemon WHERE name = 'Pikachu'), -- Pokémon One ID
    (SELECT TOP 1 id FROM pokemon WHERE name = 'Rayquaza'), -- Pokémon Two ID
    (SELECT TOP 1 id FROM trainers WHERE name = 'Johnny'); -- Winner ID
