DECLARE @trainer_name VARCHAR(100);

-- Trainer to be deleted
SET @trainer_name = 'Lucas Valdez';

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