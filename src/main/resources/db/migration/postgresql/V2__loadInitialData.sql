/* DML for inserting initial data for DB */
INSERT INTO recipe."Recipe" (user_id, recipe_name, is_active, created_by, created_timestamp) 
	VALUES (2, 'Boiled Water', true, 'admin', '2017-02-02 01:01:01');
	
INSERT INTO recipe."Category" (category_name, created_by, created_timestamp) 
	VALUES ('Simple', 'admin', '2017-02-02 01:01:01');
	
INSERT INTO recipe."RecipeAttribute" (recipe_id, attribute_name, attribute_value, created_by, created_timestamp)
	VALUES ((SELECT recipe_id from recipe."Recipe" WHERE recipe_name = 'Boiled Water'), 'Preparation Time', '1', 'admin', '2017-02-02 01:01:01');
INSERT INTO recipe."RecipeAttribute" (recipe_id, attribute_name, attribute_value, created_by, created_timestamp)
	VALUES ((SELECT recipe_id from recipe."Recipe" WHERE recipe_name = 'Boiled Water'), 'Preparation Measurement', 'minutes', 'admin', '2017-02-02 01:01:01');
INSERT INTO recipe."RecipeAttribute" (recipe_id, attribute_name, attribute_value, created_by, created_timestamp)
	VALUES ((SELECT recipe_id from recipe."Recipe" WHERE recipe_name = 'Boiled Water'), 'Cooking Time', '10', 'admin', '2017-02-02 01:01:01');
INSERT INTO recipe."RecipeAttribute" (recipe_id, attribute_name, attribute_value, created_by, created_timestamp)
	VALUES ((SELECT recipe_id from recipe."Recipe" WHERE recipe_name = 'Boiled Water'), 'Cooking Measurement', 'minutes', 'admin', '2017-02-02 01:01:01');
INSERT INTO recipe."RecipeAttribute" (recipe_id, attribute_name, attribute_value, created_by, created_timestamp)
	VALUES ((SELECT recipe_id from recipe."Recipe" WHERE recipe_name = 'Boiled Water'), 'Total Time', '11', 'admin', '2017-02-02 01:01:01');
INSERT INTO recipe."RecipeAttribute" (recipe_id, attribute_name, attribute_value, created_by, created_timestamp)
	VALUES ((SELECT recipe_id from recipe."Recipe" WHERE recipe_name = 'Boiled Water'), 'Total Measurement', 'minutes', 'admin', '2017-02-02 01:01:01');
INSERT INTO recipe."RecipeAttribute" (recipe_id, attribute_name, attribute_value, created_by, created_timestamp)
	VALUES ((SELECT recipe_id from recipe."Recipe" WHERE recipe_name = 'Boiled Water'), 'Servings', '1', 'admin', '2017-02-02 01:01:01');
INSERT INTO recipe."RecipeAttribute" (recipe_id, attribute_name, attribute_value, created_by, created_timestamp)
	VALUES ((SELECT recipe_id from recipe."Recipe" WHERE recipe_name = 'Boiled Water'), 'Calories', '0', 'admin', '2017-02-02 01:01:01');
INSERT INTO recipe."RecipeAttribute" (recipe_id, attribute_name, attribute_value, created_by, created_timestamp)
	VALUES ((SELECT recipe_id from recipe."Recipe" WHERE recipe_name = 'Boiled Water'), 
		'Pot', 'One pot that holds a minimum of 12 cups of liquid', 'admin', '2017-02-02 01:01:01');

INSERT INTO recipe."RecipeCategory" (recipe_id, category_id, created_by, created_timestamp) 
	VALUES ((SELECT recipe_id from recipe."Recipe" WHERE recipe_name = 'Boiled Water'), 
		(SELECT category_id FROM recipe."Category" WHERE category_name = 'Simple'), 'admin', '2017-02-02 01:01:01');
			
INSERT INTO recipe."RecipeIngredient" 
	(recipe_id, ingredient_type, ingredient_measurement, ingredient_amount, sequence_number, created_by, created_timestamp) 
		VALUES ((SELECT recipe_id from recipe."Recipe" WHERE recipe_name = 'Boiled Water'), 'Water', 'cup', '10', 0, 'admin', '2017-02-02 01:01:01');

INSERT INTO recipe."RecipeInstruction" (recipe_id, instruction_value, sequence_number, created_by, created_timestamp)
	VALUES ((SELECT recipe_id from recipe."Recipe" WHERE recipe_name = 'Boiled Water'), 'Place water into the pot', 0, 'admin', '2017-02-02 01:01:01');
INSERT INTO recipe."RecipeInstruction" (recipe_id, instruction_value, sequence_number, created_by, created_timestamp)
	VALUES ((SELECT recipe_id from recipe."Recipe" WHERE recipe_name = 'Boiled Water'), 
		'Place pot on stove with largest gas or electric output', 1, 'admin', '2017-02-02 01:01:01');
INSERT INTO recipe."RecipeInstruction" (recipe_id, instruction_value, sequence_number, created_by, created_timestamp)
	VALUES ((SELECT recipe_id from recipe."Recipe" WHERE recipe_name = 'Boiled Water'), 
		'Turn heat to highest setting', 2, 'admin', '2017-02-02 01:01:01');
INSERT INTO recipe."RecipeInstruction" (recipe_id, instruction_value, sequence_number, created_by, created_timestamp)
	VALUES ((SELECT recipe_id from recipe."Recipe" WHERE recipe_name = 'Boiled Water'), 
		'Wait approximately 10 minutes for water to come to a boil. Wait time varies by stove', 3, 'admin', '2017-02-02 01:01:01');
INSERT INTO recipe."RecipeInstruction" (recipe_id, instruction_value, sequence_number, created_by, created_timestamp)
	VALUES ((SELECT recipe_id from recipe."Recipe" WHERE recipe_name = 'Boiled Water'), 
		'Once water has reached a boil, turn stove heat off', 4, 'admin', '2017-02-02 01:01:01');
		
INSERT INTO recipe."UserRecipeReview" (user_id, recipe_id, review_rating, review_comment, created_by, created_timestamp) 
	VALUES (3, (SELECT recipe_id from recipe."Recipe" WHERE recipe_name = 'Boiled Water'), 1, 
		'Tried this on one of them walkers and it just made him mad, this recipe is horrible!', 'admin', '2017-02-02 01:01:01');