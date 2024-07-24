DECLARE @update_trainer VARCHAR(100);
DECLARE @new_name VARCHAR(100);
DECLARE @new_gender VARCHAR(100);
DECLARE @new_region VARCHAR(100);
DECLARE @new_age INT;
DECLARE @new_trainer_class VARCHAR(100);

-- Updates information for a specific trainer
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