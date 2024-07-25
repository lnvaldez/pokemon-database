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
WHERE b.id = 8; -- Replace
