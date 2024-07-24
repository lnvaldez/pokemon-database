--- Database and tables creation

--- Create database
CREATE DATABASE PokemonData

--- Create trainers table 
CREATE TABLE trainers
(
    id INTEGER NOT NULL IDENTITY (1, 1) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
	gender VARCHAR(20),
    region VARCHAR(50),
	age INTEGER,
	trainer_class VARCHAR(100),
);

--- Create pokemon table 
CREATE TABLE pokemon
(
	id INTEGER NOT NULL IDENTITY (1, 1) PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	generation VARCHAR(50),
	category VARCHAR(50),
	type_primary VARCHAR(50) NOT NULL,
	type_secondary VARCHAR(50),
	level INTEGER,
	hp INTEGER,
	attack INTEGER,
	defense INTEGER,
	speed INTEGER
);

--- Create battles table 
CREATE TABLE battles
(
	id INTEGER NOT NULL IDENTITY (1, 1) PRIMARY KEY, 
	date DATE NOT NULL,
	trainer_one INTEGER NOT NULL,
	trainer_two INTEGER NOT NULL, 
	pokemon_one INTEGER NOT NULL,
	pokemon_two INTEGER NOT NULL, 
	winner INTEGER NOT NULL
);

ALTER TABLE battles
ADD CONSTRAINT fk_trainer_one FOREIGN KEY (trainer_one) REFERENCES trainers(id);

ALTER TABLE battles
ADD CONSTRAINT fk_trainer_two FOREIGN KEY (trainer_two) REFERENCES trainers(id);

ALTER TABLE battles
ADD CONSTRAINT fk_pokemon_one FOREIGN KEY (pokemon_one) REFERENCES pokemon(id);

ALTER TABLE battles
ADD CONSTRAINT fk_pokemon_two FOREIGN KEY (pokemon_two) REFERENCES pokemon(id);

ALTER TABLE battles
ADD CONSTRAINT fk_winner FOREIGN KEY (winner) REFERENCES trainers(id);

--- Create trainer_pokemon table 
CREATE TABLE trainer_pokemon
(
	trainer_id INTEGER,
	pokemon_id INTEGER
);

ALTER TABLE trainer_pokemon
ADD CONSTRAINT fk_trainer_id FOREIGN KEY (trainer_id) REFERENCES trainers(id);

ALTER TABLE trainer_pokemon
ADD CONSTRAINT fk_pokemon_id FOREIGN KEY (pokemon_id) REFERENCES pokemon(id);

--- ///

INSERT INTO trainers (name, gender, region, age, trainer_class) VALUES
	('Ash Ketchum', 'Male', 'Kanto', 10, 'Pokemon Trainer'),
	('Misty', 'Female', 'Kanto', 12, 'Gym Leader'),
	('Brock', 'Male', 'Kanto', 15, 'Gym Leader'),
	('Gary Oak', 'Male', 'Kanto', 10, 'Rival'),
	('Lance', 'Male', 'Kanto', 25, 'Elite Four'),
	('Erika', 'Female', 'Kanto', 18, 'Gym Leader'),
	('Sabrina', 'Female', 'Kanto', 21, 'Gym Leader'),
	('Koga', 'Male', 'Kanto', 30, 'Elite Four'),
	('Blaine', 'Male', 'Kanto', 45, 'Gym Leader'),
	('Giovanni', 'Male', 'Kanto', 50, 'Team Rocket Boss'),
	('Falkner', 'Male', 'Johto', 20, 'Gym Leader'),
	('Bugsy', 'Male', 'Johto', 10, 'Gym Leader'),
	('Whitney', 'Female', 'Johto', 16, 'Gym Leader'),
	('Morty', 'Male', 'Johto', 22, 'Gym Leader'),
	('Chuck', 'Male', 'Johto', 35, 'Gym Leader'),
	('Jasmine', 'Female', 'Johto', 17, 'Gym Leader'),
	('Pryce', 'Male', 'Johto', 70, 'Gym Leader'),
	('Clair', 'Female', 'Johto', 19, 'Gym Leader'),
	('Roxanne', 'Female', 'Hoenn', 18, 'Gym Leader'),
	('Brawly', 'Male', 'Hoenn', 20, 'Gym Leader'),
	('Wattson', 'Male', 'Hoenn', 55, 'Gym Leader'),
	('Flannery', 'Female', 'Hoenn', 20, 'Gym Leader'),
	('Norman', 'Male', 'Hoenn', 35, 'Gym Leader'),
	('Winona', 'Female', 'Hoenn', 22, 'Gym Leader'),
	('Tate', 'Male', 'Hoenn', 10, 'Gym Leader'),
	('Liza', 'Female', 'Hoenn', 10, 'Gym Leader'),
	('Wallace', 'Male', 'Hoenn', 30, 'Champion'),
	('Juan', 'Male', 'Hoenn', 45, 'Gym Leader'),
	('Roark', 'Male', 'Sinnoh', 18, 'Gym Leader'),
	('Gardenia', 'Female', 'Sinnoh', 20, 'Gym Leader'),
	('Maylene', 'Female', 'Sinnoh', 16, 'Gym Leader'),
	('Crasher Wake', 'Male', 'Sinnoh', 40, 'Gym Leader'),
	('Fantina', 'Female', 'Sinnoh', 30, 'Gym Leader'),
	('Byron', 'Male', 'Sinnoh', 40, 'Gym Leader'),
	('Candice', 'Female', 'Sinnoh', 20, 'Gym Leader'),
	('Volkner', 'Male', 'Sinnoh', 25, 'Gym Leader'),
	('Cheren', 'Male', 'Unova', 16, 'Gym Leader'),
	('Roxie', 'Female', 'Unova', 17, 'Gym Leader'),
	('Burgh', 'Male', 'Unova', 25, 'Gym Leader'),
	('Elesa', 'Female', 'Unova', 24, 'Gym Leader'),
	('Clay', 'Male', 'Unova', 50, 'Gym Leader'),
	('Skyla', 'Female', 'Unova', 23, 'Gym Leader'),
	('Drayden', 'Male', 'Unova', 60, 'Gym Leader'),
	('Marlon', 'Male', 'Unova', 28, 'Gym Leader'),
	('Viola', 'Female', 'Kalos', 18, 'Gym Leader'),
	('Grant', 'Male', 'Kalos', 25, 'Gym Leader'),
	('Korrina', 'Female', 'Kalos', 16, 'Gym Leader'),
	('Ramos', 'Male', 'Kalos', 65, 'Gym Leader'),
	('Clemont', 'Male', 'Kalos', 19, 'Gym Leader'),
	('Valerie', 'Female', 'Kalos', 27, 'Gym Leader'),
	('Diantha', 'Female', 'Kalos', 35, 'Champion'),
	('Steven Stone', 'Male', 'Hoenn', 28, 'Champion'),
	('Cynthia', 'Female', 'Sinnoh', 33, 'Champion'),
	('Alder', 'Male', 'Unova', 45, 'Champion');

INSERT INTO pokemon (name, generation, category, type_primary, type_secondary, level, hp, attack, defense, speed) VALUES
-- Gen 1
('Pikachu', 'Gen 1', 'Mouse', 'Electric', NULL, 25, 35, 55, 40, 90),
('Charizard', 'Gen 1', 'Flame', 'Fire', 'Flying', 36, 78, 84, 78, 100),
('Bulbasaur', 'Gen 1', 'Seed', 'Grass', 'Poison', 16, 45, 49, 49, 45),
('Squirtle', 'Gen 1', 'Tiny Turtle', 'Water', NULL, 16, 44, 48, 65, 43),
('Starmie', 'Gen 1', 'Mysterious', 'Water', 'Psychic', 30, 60, 75, 85, 115),
('Onix', 'Gen 1', 'Rock Snake', 'Rock', 'Ground', 25, 35, 45, 160, 70),
('Gengar', 'Gen 1', 'Shadow', 'Ghost', 'Poison', 38, 60, 65, 60, 110),
('Alakazam', 'Gen 1', 'Psi', 'Psychic', NULL, 40, 55, 50, 45, 120),
('Machamp', 'Gen 1', 'Superpower', 'Fighting', NULL, 40, 90, 130, 80, 55),
('Gyarados', 'Gen 1', 'Atrocious', 'Water', 'Flying', 30, 95, 125, 79, 81),
('Dragonite', 'Gen 1', 'Dragon', 'Dragon', 'Flying', 55, 91, 134, 95, 80),
('Arcanine', 'Gen 1', 'Legendary', 'Fire', NULL, 40, 90, 110, 80, 95),
('Lapras', 'Gen 1', 'Transport', 'Water', 'Ice', 40, 130, 85, 80, 60),
('Eevee', 'Gen 1', 'Evolution', 'Normal', NULL, 20, 55, 55, 50, 55),
('Snorlax', 'Gen 1', 'Sleeping', 'Normal', NULL, 35, 160, 110, 65, 30),
('Jigglypuff', 'Gen 1', 'Balloon', 'Normal', 'Fairy', 20, 115, 45, 20, 20),
('Pidgeot', 'Gen 1', 'Bird', 'Normal', 'Flying', 36, 83, 80, 75, 101),
('Rhydon', 'Gen 1', 'Drill', 'Ground', 'Rock', 42, 105, 130, 120, 40),
('Scyther', 'Gen 1', 'Mantis', 'Bug', 'Flying', 30, 70, 110, 80, 105),
('Jolteon', 'Gen 1', 'Lightning', 'Electric', NULL, 30, 65, 65, 60, 130),
('Vaporeon', 'Gen 1', 'Bubble Jet', 'Water', NULL, 30, 130, 65, 60, 65),
('Flareon', 'Gen 1', 'Flame', 'Fire', NULL, 30, 65, 130, 60, 65),
('Mewtwo', 'Gen 1', 'Genetic', 'Psychic', NULL, 70, 106, 110, 90, 130),
-- Gen 2
('Chikorita', 'Gen 2', 'Leaf', 'Grass', NULL, 16, 45, 49, 65, 45),
('Cyndaquil', 'Gen 2', 'Fire Mouse', 'Fire', NULL, 16, 39, 52, 43, 65),
('Totodile', 'Gen 2', 'Big Jaw', 'Water', NULL, 16, 50, 65, 64, 43),
('Ampharos', 'Gen 2', 'Light', 'Electric', NULL, 30, 90, 75, 85, 55),
('Espeon', 'Gen 2', 'Sun', 'Psychic', NULL, 30, 65, 65, 60, 110),
('Umbreon', 'Gen 2', 'Moonlight', 'Dark', NULL, 30, 95, 65, 110, 65),
('Steelix', 'Gen 2', 'Iron Snake', 'Steel', 'Ground', 36, 75, 85, 200, 30),
('Scizor', 'Gen 2', 'Pincer', 'Bug', 'Steel', 36, 70, 130, 100, 65),
('Heracross', 'Gen 2', 'Single Horn', 'Bug', 'Fighting', 30, 80, 125, 75, 85),
('Tyranitar', 'Gen 2', 'Armor', 'Rock', 'Dark', 55, 100, 134, 110, 61),
('Lugia', 'Gen 2', 'Diving', 'Psychic', 'Flying', 70, 106, 90, 130, 110),
('Ho-Oh', 'Gen 2', 'Rainbow', 'Fire', 'Flying', 70, 106, 130, 90, 90),
-- Gen 3
('Treecko', 'Gen 3', 'Wood Gecko', 'Grass', NULL, 16, 40, 45, 35, 70),
('Torchic', 'Gen 3', 'Chick', 'Fire', NULL, 16, 45, 60, 40, 45),
('Mudkip', 'Gen 3', 'Mud Fish', 'Water', NULL, 16, 50, 70, 50, 40),
('Gardevoir', 'Gen 3', 'Embrace', 'Psychic', 'Fairy', 30, 68, 65, 65, 80),
('Sableye', 'Gen 3', 'Darkness', 'Dark', 'Ghost', 30, 50, 75, 75, 50),
('Mawile', 'Gen 3', 'Deceiver', 'Steel', 'Fairy', 30, 50, 85, 85, 50),
('Aggron', 'Gen 3', 'Iron Armor', 'Steel', 'Rock', 42, 70, 110, 180, 50),
('Medicham', 'Gen 3', 'Meditate', 'Fighting', 'Psychic', 37, 60, 60, 75, 80),
('Manectric', 'Gen 3', 'Discharge', 'Electric', NULL, 40, 70, 75, 60, 105),
('Flygon', 'Gen 3', 'Mystic', 'Ground', 'Dragon', 45, 80, 100, 80, 100),
('Salamence', 'Gen 3', 'Dragon', 'Dragon', 'Flying', 50, 95, 135, 80, 100),
('Metagross', 'Gen 3', 'Iron Leg', 'Steel', 'Psychic', 45, 80, 135, 130, 70),
('Latias', 'Gen 3', 'Eon', 'Dragon', 'Psychic', 50, 80, 80, 90, 110),
('Latios', 'Gen 3', 'Eon', 'Dragon', 'Psychic', 50, 80, 90, 80, 110),
-- Gen 4
('Turtwig', 'Gen 4', 'Tiny Leaf', 'Grass', NULL, 16, 55, 68, 64, 31),
('Chimchar', 'Gen 4', 'Chimp', 'Fire', NULL, 16, 44, 58, 44, 61),
('Piplup', 'Gen 4', 'Penguin', 'Water', NULL, 16, 53, 51, 53, 40),
('Luxray', 'Gen 4', 'Gleam Eyes', 'Electric', NULL, 40, 80, 120, 79, 70),
('Roserade', 'Gen 4', 'Bouquet', 'Grass', 'Poison', 36, 60, 70, 65, 90),
('Garchomp', 'Gen 4', 'Mach', 'Dragon', 'Ground', 48, 108, 130, 95, 102),
('Lucario', 'Gen 4', 'Aura', 'Fighting', 'Steel', 40, 70, 110, 70, 90),
('Hippowdon', 'Gen 4', 'Heavyweight', 'Ground', NULL, 40, 108, 112, 118, 47),
('Drapion', 'Gen 4', 'Ogre Scorp', 'Poison', 'Dark', 40, 70, 90, 110, 95),
('Toxicroak', 'Gen 4', 'Toxic Mouth', 'Poison', 'Fighting', 37, 83, 106, 65, 85),
('Weavile', 'Gen 4', 'Sharp Claw', 'Dark', 'Ice', 40, 70, 120, 65, 125),
('Magnezone', 'Gen 4', 'Magnet Area', 'Electric', 'Steel', 40, 70, 70, 115, 60),
('Leafeon', 'Gen 4', 'Verdant', 'Grass', NULL, 30, 65, 110, 130, 95),
('Glaceon', 'Gen 4', 'Fresh Snow', 'Ice', NULL, 30, 65, 60, 110, 65),
-- Gen 5
('Snivy', 'Gen 5', 'Grass Snake', 'Grass', NULL, 16, 45, 45, 55, 63),
('Tepig', 'Gen 5', 'Fire Pig', 'Fire', NULL, 16, 65, 63, 45, 45),
('Oshawott', 'Gen 5', 'Sea Otter', 'Water', NULL, 16, 55, 55, 45, 55),
('Zoroark', 'Gen 5', 'Illusion Fox', 'Dark', NULL, 30, 60, 105, 60, 105),
('Gothitelle', 'Gen 5', 'Astral Body', 'Psychic', NULL, 40, 70, 55, 95, 65),
('Reuniclus', 'Gen 5', 'Multiplying', 'Psychic', NULL, 40, 110, 65, 75, 30),
('Krookodile', 'Gen 5', 'Intimidation', 'Ground', 'Dark', 40, 95, 117, 80, 92),
('Sawsbuck', 'Gen 5', 'Season', 'Normal', 'Grass', 40, 80, 100, 70, 95),
('Chandelure', 'Gen 5', 'Luring', 'Ghost', 'Fire', 40, 60, 55, 90, 80),
('Haxorus', 'Gen 5', 'Axe Jaw', 'Dragon', NULL, 48, 76, 147, 90, 97),
('Ferrothorn', 'Gen 5', 'Thorn Pod', 'Grass', 'Steel', 40, 74, 94, 131, 20),
('Beheeyem', 'Gen 5', 'Cerebral', 'Psychic', NULL, 40, 75, 75, 75, 40),
('Hydreigon', 'Gen 5', 'Brutal', 'Dark', 'Dragon', 64, 92, 105, 90, 98),
('Volcarona', 'Gen 5', 'Sun', 'Bug', 'Fire', 59, 85, 60, 65, 100),
-- Gen 6
('Chespin', 'Gen 6', 'Spiny Nut', 'Grass', NULL, 16, 56, 61, 65, 38),
('Fennekin', 'Gen 6', 'Fox', 'Fire', NULL, 16, 40, 45, 40, 60),
('Froakie', 'Gen 6', 'Bubble Frog', 'Water', NULL, 16, 41, 56, 40, 71),
('Talonflame', 'Gen 6', 'Scorching', 'Fire', 'Flying', 40, 78, 81, 71, 126),
('Aegislash', 'Gen 6', 'Royal Sword', 'Steel', 'Ghost', 40, 60, 50, 140, 60),
('Noivern', 'Gen 6', 'Sound Wave', 'Flying', 'Dragon', 48, 85, 70, 80, 123),
('Sylveon', 'Gen 6', 'Intertwining', 'Fairy', NULL, 30, 95, 65, 65, 60),
('Goodra', 'Gen 6', 'Dragon', 'Dragon', NULL, 50, 90, 100, 70, 80),
('Trevenant', 'Gen 6', 'Elder Tree', 'Ghost', 'Grass', 40, 85, 110, 76, 56),
('Avalugg', 'Gen 6', 'Iceberg', 'Ice', NULL, 40, 95, 117, 184, 28),
('Noivern', 'Gen 6', 'Sound Wave', 'Flying', 'Dragon', 48, 85, 70, 80, 123),
-- Gen 7
('Rowlet', 'Gen 7', 'Grass Quill', 'Grass', 'Flying', 16, 68, 55, 55, 42),
('Litten', 'Gen 7', 'Fire Cat', 'Fire', NULL, 16, 45, 65, 40, 70),
('Popplio', 'Gen 7', 'Sea Lion', 'Water', NULL, 16, 50, 54, 54, 40),
('Decidueye', 'Gen 7', 'Arrow Quill', 'Grass', 'Ghost', 34, 78, 107, 75, 70),
('Incineroar', 'Gen 7', 'Heel', 'Fire', 'Dark', 34, 95, 115, 90, 60),
('Primarina', 'Gen 7', 'Soloist', 'Water', 'Fairy', 34, 80, 74, 74, 60),
('Lycanroc', 'Gen 7', 'Wolf', 'Rock', NULL, 30, 75, 115, 65, 112),
('Kommo-o', 'Gen 7', 'Scaly', 'Dragon', 'Fighting', 45, 75, 110, 125, 85),
('Toxapex', 'Gen 7', 'Brutal Star', 'Poison', 'Water', 40, 50, 63, 152, 35),
('Mimikyu', 'Gen 7', 'Disguise', 'Ghost', 'Fairy', 30, 55, 90, 80, 96),
('Drampa', 'Gen 7', 'Placid', 'Normal', 'Dragon', 40, 78, 60, 85, 36),
('Turtonator', 'Gen 7', 'Blast Turtle', 'Fire', 'Dragon', 40, 60, 78, 135, 36),
('Tapu Koko', 'Gen 7', 'Land Spirit', 'Electric', 'Fairy', 70, 70, 115, 85, 130),
('Tapu Lele', 'Gen 7', 'Land Spirit', 'Psychic', 'Fairy', 70, 70, 85, 75, 95),
-- Gen 8
('Grookey', 'Gen 8', 'Chimp', 'Grass', NULL, 16, 50, 65, 50, 65),
('Scorbunny', 'Gen 8', 'Rabbit', 'Fire', NULL, 16, 50, 71, 40, 69),
('Sobble', 'Gen 8', 'Water Lizard', 'Water', NULL, 16, 50, 40, 40, 70),
('Corviknight', 'Gen 8', 'Raven', 'Flying', 'Steel', 40, 98, 87, 105, 67),
('Orbeetle', 'Gen 8', 'Seven Spot', 'Bug', 'Psychic', 40, 60, 45, 110, 90),
('Thievul', 'Gen 8', 'Fox', 'Dark', NULL, 40, 70, 58, 58, 90),
('Dubwool', 'Gen 8', 'Sheep', 'Normal', NULL, 40, 72, 80, 100, 88),
('Drednaw', 'Gen 8', 'Bite', 'Water', 'Rock', 40, 90, 115, 90, 74),
('Coalossal', 'Gen 8', 'Coal', 'Rock', 'Fire', 40, 110, 80, 120, 30),
('Flapple', 'Gen 8', 'Apple Wing', 'Grass', 'Dragon', 40, 70, 110, 80, 70),
('Appletun', 'Gen 8', 'Apple Nectar', 'Grass', 'Dragon', 40, 110, 85, 80, 30),
('Eiscue', 'Gen 8', 'Penguin', 'Ice', NULL, 40, 75, 80, 110, 50),
('Cursola', 'Gen 8', 'Coral', 'Ghost', NULL, 40, 60, 95, 50, 30),
('Dragapult', 'Gen 8', 'Stealth', 'Dragon', 'Ghost', 55, 88, 120, 75, 142);

-- Inserting entries into the battles table
INSERT INTO battles (date, trainer_one, trainer_two, pokemon_one, pokemon_two, winner) VALUES
('2024-07-01', 1, 2, 1, 5, 1),  
('2024-07-02', 3, 4, 8, 10, 4),  
('2024-07-03', 5, 6, 23, 16, 5),  
('2024-07-04', 7, 8, 18, 20, 7),  
('2024-07-05', 9, 10, 22, 24, 10), 
('2024-07-06', 11, 12, 26, 28, 11), 
('2024-07-07', 13, 14, 30, 32, 14), 
('2024-07-08', 15, 16, 34, 36, 15), 
('2024-07-09', 17, 18, 38, 40, 17), 
('2024-07-10', 19, 20, 42, 44, 19), 
('2024-07-11', 21, 22, 46, 48, 21), 
('2024-07-12', 23, 24, 50, 52, 23), 
('2024-07-13', 25, 26, 54, 56, 25), 
('2024-07-14', 27, 28, 58, 60, 27), 
('2024-07-15', 29, 30, 62, 64, 29), 
('2024-07-16', 31, 32, 66, 68, 31), 
('2024-07-17', 33, 34, 70, 72, 34), 
('2024-07-18', 35, 36, 74, 76, 35), 
('2024-07-19', 37, 38, 78, 80, 37), 
('2024-07-20', 39, 40, 82, 84, 40), 
('2024-07-21', 41, 42, 86, 88, 41), 
('2024-07-22', 43, 44, 90, 92, 43), 
('2024-07-23', 45, 46, 94, 96, 45),
('2024-07-24', 47, 48, 98, 100, 47),
('2024-07-25', 49, 50, 102, 104, 49);

-- Inserting entries into the trainer_pokemon table
INSERT INTO trainer_pokemon (trainer_id, pokemon_id) VALUES
(1, 1), (1, 2),  
(2, 5), (2, 6),  
(3, 8), (3, 9),  
(4, 10), (4, 11),  
(5, 23), (5, 24), 
(6, 16), (6, 17),  
(7, 18), (7, 19),  
(8, 20), (8, 21),  
(9, 22), (9, 23),  
(10, 24), (10, 25),  
(11, 26), (11, 27),  
(12, 28), (12, 29),  
(13, 30), (13, 31),  
(14, 32), (14, 33), 
(15, 34), (15, 35),  
(16, 36), (16, 37),  
(17, 38), (17, 39),  
(18, 40), (18, 41),  
(19, 42), (19, 43),  
(20, 44), (20, 45),  
(21, 46), (21, 47),  
(22, 48), (22, 49),  
(23, 50), (23, 51),  
(24, 52), (24, 53), 
(25, 54), (25, 55), 
(26, 54), (26, 55),  
(27, 56), (27, 57),  
(28, 58), (28, 59),  
(29, 60), (29, 61),  
(30, 62), (30, 63),  
(31, 64), (31, 65),  
(32, 66), (32, 67),  
(33, 68), (33, 69),  
(34, 70), (34, 71),  
(35, 72), (35, 73),  
(36, 74), (36, 75),  
(37, 76), (37, 77),  
(38, 78), (38, 79),  
(39, 80), (39, 81),  
(40, 82), (40, 83),  
(41, 84), (41, 85),  
(42, 86), (42, 87),  
(43, 88), (43, 89),  
(44, 90), (44, 91),  
(45, 92), (45, 93),  
(46, 94), (46, 95),  
(47, 96), (47, 97),  
(48, 98), (48, 99),  
(49, 100), (49, 101),  
(50, 102), (50, 103); 
