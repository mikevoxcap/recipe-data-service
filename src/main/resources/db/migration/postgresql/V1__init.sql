/* DDL initialization for the database */
CREATE TABLE recipe."Users" (
	user_id serial NOT NULL, -- Unique ID of the user
	first_name varchar(100) NOT NULL, -- First name of the user
	last_name varchar(100) NOT NULL, -- Last name of the user
	date_of_birth date NOT NULL, -- Birth date of the user
	login_id varchar(100) NOT NULL, -- Login ID of the user
	password varchar(50) NOT NULL, -- Password of the user
	email_address varchar(150) NOT NULL, -- Email address of the user
	created_by varchar(100) NOT NULL, -- User created
	created_timestamp timestamp NOT NULL, -- Created timestamp
	PRIMARY KEY (user_id)
);

COMMENT ON COLUMN recipe."Users".user_id IS 'Unique ID of the user';
COMMENT ON COLUMN recipe."Users".first_name IS 'First name of the user';
COMMENT ON COLUMN recipe."Users".last_name IS 'Last name of the user';
COMMENT ON COLUMN recipe."Users".date_of_birth IS 'Birth date of the user';
COMMENT ON COLUMN recipe."Users".login_id IS 'Login ID of the user';
COMMENT ON COLUMN recipe."Users".password IS 'Password of the user';
COMMENT ON COLUMN recipe."Users".email_address IS 'Email address of the user';
COMMENT ON COLUMN recipe."Users".created_by IS 'Created by user';
COMMENT ON COLUMN recipe."Users".created_timestamp IS 'Created timestamp by the user';

CREATE TABLE recipe."Recipe" (
	recipe_id serial NOT NULL, -- Unique ID of the recipe
	user_id integer NOT NULL, -- Unique ID of the user
	name varchar(150) NOT NULL, -- Recipe name
	is_active boolean NOT NULL, -- Flag if recipe is actively on the site
	created_by varchar(100) NOT NULL, -- User created
	created_timestamp timestamp NOT NULL, -- Created timestamp
	PRIMARY KEY (recipe_id)	
); 

ALTER TABLE recipe."Recipe" 
	ADD CONSTRAINT recipe_fk_1
	FOREIGN KEY (user_id) 
	REFERENCES recipe."Users" (user_id);

COMMENT ON COLUMN recipe."Recipe".recipe_id IS 'Unique ID of the recipe';
COMMENT ON COLUMN recipe."Recipe".user_id IS 'Unique ID of the user';
COMMENT ON COLUMN recipe."Recipe".name IS 'Name of the recipe';
COMMENT ON COLUMN recipe."Recipe".is_active IS 'Is active flag of the recipe';
COMMENT ON COLUMN recipe."Recipe".created_by IS 'Created by user';
COMMENT ON COLUMN recipe."Recipe".created_timestamp IS 'Created timestamp by the user';

CREATE TABLE recipe."RecipeAttribute" (
	recipe_attribute_id serial NOT NULL, -- Unique ID of the recipe attribute
	recipe_id integer NOT NULL, -- Unique ID of the recipe assigned attached to this attribute
	attribute_name varchar(250) NOT NULL, -- Name of the recipe attribute
	attribute_value varchar(1000) NOT NULL, -- Value of the recipe attribute 
	created_by varchar(100) NOT NULL, -- User created
	created_timestamp timestamp NOT NULL, -- Created timestamp
	PRIMARY KEY (recipe_attribute_id)	
); 

ALTER TABLE recipe."RecipeAttribute" 
	ADD CONSTRAINT recipe_attribute_fk_1
	FOREIGN KEY (recipe_id) 
	REFERENCES recipe."Recipe" (recipe_id);

COMMENT ON COLUMN recipe."RecipeAttribute".recipe_attribute_id IS 'Unique ID of the recipe attribute';
COMMENT ON COLUMN recipe."RecipeAttribute".recipe_id IS 'Unique ID of the recipe assinged to the attribute';
COMMENT ON COLUMN recipe."RecipeAttribute".attribute_name IS 'Name of the recipe attribute';
COMMENT ON COLUMN recipe."RecipeAttribute".attribute_value IS 'Value of the recipe attribute';
COMMENT ON COLUMN recipe."RecipeAttribute".created_by IS 'Created by user';
COMMENT ON COLUMN recipe."RecipeAttribute".created_timestamp IS 'Created timestamp by the user';

CREATE TABLE recipe."RecipeInstruction" (
	recipe_instruction_id serial NOT NULL, -- Unique ID of the recipe instruction
	recipe_id integer NOT NULL, -- Unique ID of the recipe assigned attached to this instruction
	instruction_value text NOT NULL, -- Text value of the instruction
	sequence integer NOT NULL, -- Sequence number of the instruction 
	created_by varchar(100) NOT NULL, -- User created
	created_timestamp timestamp NOT NULL, -- Created timestamp
	PRIMARY KEY (recipe_instruction_id)	
); 

ALTER TABLE recipe."RecipeInstruction" 
	ADD CONSTRAINT recipe_instruction_fk_1
	FOREIGN KEY (recipe_id) 
	REFERENCES recipe."Recipe" (recipe_id);

COMMENT ON COLUMN recipe."RecipeInstruction".recipe_instruction_id IS 'Unique ID of the recipe instruction';
COMMENT ON COLUMN recipe."RecipeInstruction".recipe_id IS 'Unique ID of the recipe assinged to the instruction';
COMMENT ON COLUMN recipe."RecipeInstruction".instruction_value IS 'Text value of the instruction';
COMMENT ON COLUMN recipe."RecipeInstruction".sequence IS 'Sequence number of the instruction';
COMMENT ON COLUMN recipe."RecipeInstruction".created_by IS 'Created by user';
COMMENT ON COLUMN recipe."RecipeInstruction".created_timestamp IS 'Created timestamp by the user';

CREATE TABLE recipe."RecipeIngredient" (
	recipe_ingredient_id serial NOT NULL, -- Unique ID of the recipe ingredient
	recipe_id integer NOT NULL, -- Unique ID of the recipe assigned attached to this ingredient
	ingredient_type text NOT NULL, -- Text value of the ingredient type
	ingredient_measurement integer NOT NULL, -- Measurement for the ingredient 
	created_by varchar(100) NOT NULL, -- User created
	created_timestamp timestamp NOT NULL, -- Created timestamp
	PRIMARY KEY (recipe_ingredient_id)	
); 

ALTER TABLE recipe."RecipeIngredient" 
	ADD CONSTRAINT recipe_ingredient_fk_1
	FOREIGN KEY (recipe_id) 
	REFERENCES recipe."Recipe" (recipe_id);

COMMENT ON COLUMN recipe."RecipeIngredient".recipe_ingredient_id IS 'Unique ID of the recipe ingredient';
COMMENT ON COLUMN recipe."RecipeIngredient".recipe_id IS 'Unique ID of the recipe assinged to the ingredient';
COMMENT ON COLUMN recipe."RecipeIngredient".ingredient_type IS 'Type of ingredient';
COMMENT ON COLUMN recipe."RecipeIngredient".ingredient_measurement IS 'Measurement for the ingredient';
COMMENT ON COLUMN recipe."RecipeIngredient".created_by IS 'Created by user';
COMMENT ON COLUMN recipe."RecipeIngredient".created_timestamp IS 'Created timestamp by the user';

CREATE TABLE recipe."UserRecipeReview" (
	user_recipe_review_id serial NOT NULL, -- Unique ID of the recipe user review
	user_id integer NOT NULL, -- Unique ID of the user for this recipe review
	recipe_id integer NOT NULL, -- Unique ID of the recipe for the user review
	review_rating integer, -- Rating review number by the user
	review_comment text, -- Review comment by the user 
	created_by varchar(100) NOT NULL, -- User created
	created_timestamp timestamp NOT NULL, -- Created timestamp
	PRIMARY KEY (user_recipe_review_id)		
);

ALTER TABLE recipe."UserRecipeReview" 
	ADD CONSTRAINT user_recipe_review_fk_1
	FOREIGN KEY (user_id) 
	REFERENCES recipe."Users" (user_id);

ALTER TABLE recipe."UserRecipeReview" 
	ADD CONSTRAINT user_recipe_review_fk_2
	FOREIGN KEY (recipe_id) 
	REFERENCES recipe."Recipe" (recipe_id);

COMMENT ON COLUMN recipe."UserRecipeReview".user_recipe_review_id IS 'Unique ID of the user recipe review';
COMMENT ON COLUMN recipe."UserRecipeReview".user_id IS 'Unique ID of the user for this review';
COMMENT ON COLUMN recipe."UserRecipeReview".recipe_id IS 'Unique ID of the recipe for this review';
COMMENT ON COLUMN recipe."UserRecipeReview".review_rating IS 'Rating of the user review';
COMMENT ON COLUMN recipe."UserRecipeReview".review_comment IS 'Comment by the user for the review';
COMMENT ON COLUMN recipe."UserRecipeReview".created_by IS 'Created by user';
COMMENT ON COLUMN recipe."UserRecipeReview".created_timestamp IS 'Created timestamp by the user';

CREATE TABLE recipe."RecipePicture" (
	recipe_picture_id serial NOT NULL, -- Unique ID of the recipe picture
	recipe_id integer NOT NULL, -- Unique ID of the recipe for this picture
	picture_name varchar(250) NOT NULL, -- Name of the recipe picture
	recipe_picture bytea NOT NULL, -- Binary value of the recipe picture
	created_by varchar(100) NOT NULL, -- User created
	created_timestamp timestamp NOT NULL, -- Created timestamp
	PRIMARY KEY (recipe_picture_id)			
);

ALTER TABLE recipe."RecipePicture" 
	ADD CONSTRAINT recipe_picture_fk_1
	FOREIGN KEY (recipe_id) 
	REFERENCES recipe."Recipe" (recipe_id);

COMMENT ON COLUMN recipe."RecipePicture".recipe_picture_id IS 'Unique ID of the recipe picture';
COMMENT ON COLUMN recipe."RecipePicture".recipe_id IS 'Unique ID of the recipe for this picture';
COMMENT ON COLUMN recipe."RecipePicture".picture_name IS 'Name of the picture';
COMMENT ON COLUMN recipe."RecipePicture".recipe_picture IS 'Binary of the picture';
COMMENT ON COLUMN recipe."RecipePicture".created_by IS 'Created by user';
COMMENT ON COLUMN recipe."RecipePicture".created_timestamp IS 'Created timestamp by the user';

CREATE TABLE recipe."Category" (
	category_id serial NOT NULL, -- Unique ID of the category
	category_name varchar(200) NOT NULL, -- Name of the category
	created_by varchar(100) NOT NULL, -- User created
	created_timestamp timestamp NOT NULL, -- Created timestamp
	PRIMARY KEY (category_id)			
);

COMMENT ON COLUMN recipe."Category".category_id IS 'Unique ID of the category';
COMMENT ON COLUMN recipe."Category".category_name IS 'Name of the category';
COMMENT ON COLUMN recipe."Category".created_by IS 'Created by user';
COMMENT ON COLUMN recipe."Category".created_timestamp IS 'Created timestamp by the user';

CREATE TABLE recipe."RecipeCategory" (
	recipe_category_id serial NOT NULL, -- Unique ID of the recipe category
	recipe_id integer NOT NULL, -- Unique ID of the recipe for this category
	category_id integer NOT NULL, -- Unique ID of the category
	created_by varchar(100) NOT NULL, -- User created
	created_timestamp timestamp NOT NULL, -- Created timestamp
	PRIMARY KEY (recipe_category_id)
);

ALTER TABLE recipe."RecipeCategory" 
	ADD CONSTRAINT recipe_category_fk_1
	FOREIGN KEY (recipe_id) 
	REFERENCES recipe."Recipe" (recipe_id);

ALTER TABLE recipe."RecipeCategory" 
	ADD CONSTRAINT recipe_category_fk_2
	FOREIGN KEY (category_id) 
	REFERENCES recipe."Category" (category_id);

COMMENT ON COLUMN recipe."RecipeCategory".recipe_category_id IS 'Unique ID of the recipe category';
COMMENT ON COLUMN recipe."RecipeCategory".recipe_id IS 'Unique ID of the recipe';
COMMENT ON COLUMN recipe."RecipeCategory".category_id IS 'Unique ID of the category';
COMMENT ON COLUMN recipe."RecipeCategory".created_by IS 'Created by user';
COMMENT ON COLUMN recipe."RecipeCategory".created_timestamp IS 'Created timestamp by the user';
