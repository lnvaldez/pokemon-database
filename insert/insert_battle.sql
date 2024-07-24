-- Inserts a new battle record 
INSERT INTO battles (date, trainer_one, trainer_two, pokemon_one, pokemon_two, winner)
SELECT 
    '2024-07-26', -- Battle date
    (SELECT id FROM trainers WHERE name = 'Ash Ketchum'), -- Trainer One ID
    (SELECT id FROM trainers WHERE name = 'Misty'), -- Trainer Two ID
    (SELECT id FROM pokemon WHERE name = 'Pikachu'), -- Pokémon One ID
    (SELECT id FROM pokemon WHERE name = 'Starmie'), -- Pokémon Two ID
    (SELECT id FROM trainers WHERE name = 'Ash Ketchum'); -- Winner ID
