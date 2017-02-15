/* DDL initialization for the database */
CREATE TABLE recipe."recipe" (
	recipe_id SERIAL PRIMARY KEY, -- Unique ID of the recipe
	user_id integer NOT NULL, -- ID of the user
	recipe_name varchar(150) NOT NULL, -- Recipe name
	is_active boolean NOT NULL, -- Flag if recipe is actively on the site
	created_by varchar(100) NOT NULL, -- User created
	created_timestamp timestamp NOT NULL -- Created timestamp
); 

COMMENT ON COLUMN recipe."recipe".recipe_id IS 'Unique ID of the recipe';
COMMENT ON COLUMN recipe."recipe".user_id IS 'Unique ID of the user';
COMMENT ON COLUMN recipe."recipe".recipe_name IS 'Name of the recipe';
COMMENT ON COLUMN recipe."recipe".is_active IS 'Is active flag of the recipe';
COMMENT ON COLUMN recipe."recipe".created_by IS 'Created by user';
COMMENT ON COLUMN recipe."recipe".created_timestamp IS 'Created timestamp by the user';

CREATE TABLE recipe."recipe_attribute" (
	recipe_attribute_id SERIAL PRIMARY KEY, -- Unique ID of the recipe attribute
	recipe_id integer NOT NULL, -- Unique ID of the recipe assigned attached to this attribute
	attribute_name varchar(250) NOT NULL, -- Name of the recipe attribute
	attribute_value varchar(1000) NOT NULL, -- Value of the recipe attribute 
	created_by varchar(100) NOT NULL, -- User created
	created_timestamp timestamp NOT NULL -- Created timestamp
); 

ALTER TABLE recipe."recipe_attribute" 
	ADD CONSTRAINT recipe_attribute_fk_1
	FOREIGN KEY (recipe_id) 
	REFERENCES recipe."recipe" (recipe_id);

COMMENT ON COLUMN recipe."recipe_attribute".recipe_attribute_id IS 'Unique ID of the recipe attribute';
COMMENT ON COLUMN recipe."recipe_attribute".recipe_id IS 'Unique ID of the recipe assinged to the attribute';
COMMENT ON COLUMN recipe."recipe_attribute".attribute_name IS 'Name of the recipe attribute';
COMMENT ON COLUMN recipe."recipe_attribute".attribute_value IS 'Value of the recipe attribute';
COMMENT ON COLUMN recipe."recipe_attribute".created_by IS 'Created by user';
COMMENT ON COLUMN recipe."recipe_attribute".created_timestamp IS 'Created timestamp by the user';

CREATE TABLE recipe."recipe_instruction" (
	recipe_instruction_id SERIAL PRIMARY KEY, -- Unique ID of the recipe instruction
	recipe_id integer NOT NULL, -- Unique ID of the recipe assigned attached to this instruction
	instruction_value text NOT NULL, -- Text value of the instruction
	sequence_number integer NOT NULL, -- Sequence number of the instruction 
	created_by varchar(100) NOT NULL, -- User created
	created_timestamp timestamp NOT NULL -- Created timestamp
); 

ALTER TABLE recipe."recipe_instruction" 
	ADD CONSTRAINT recipe_instruction_fk_1
	FOREIGN KEY (recipe_id) 
	REFERENCES recipe."recipe" (recipe_id);

COMMENT ON COLUMN recipe."recipe_instruction".recipe_instruction_id IS 'Unique ID of the recipe instruction';
COMMENT ON COLUMN recipe."recipe_instruction".recipe_id IS 'Unique ID of the recipe assinged to the instruction';
COMMENT ON COLUMN recipe."recipe_instruction".instruction_value IS 'Text value of the instruction';
COMMENT ON COLUMN recipe."recipe_instruction".sequence_number IS 'Sequence number of the instruction';
COMMENT ON COLUMN recipe."recipe_instruction".created_by IS 'Created by user';
COMMENT ON COLUMN recipe."recipe_instruction".created_timestamp IS 'Created timestamp by the user';

CREATE TABLE recipe."recipe_ingredient" (
	recipe_ingredient_id SERIAL PRIMARY KEY, -- Unique ID of the recipe ingredient
	recipe_id integer NOT NULL, -- Unique ID of the recipe assigned attached to this ingredient
	ingredient_type text NOT NULL, -- Text value of the ingredient type
	ingredient_measurement text, -- Measurement for the ingredient
	ingredient_amount text, -- Amount for the ingredient 
	sequence_number integer NOT NULL, -- Sequence number of the instruction
	created_by varchar(100) NOT NULL, -- User created
	created_timestamp timestamp NOT NULL -- Created timestamp
); 

ALTER TABLE recipe."recipe_ingredient" 
	ADD CONSTRAINT recipe_ingredient_fk_1
	FOREIGN KEY (recipe_id) 
	REFERENCES recipe."recipe" (recipe_id);

COMMENT ON COLUMN recipe."recipe_ingredient".recipe_ingredient_id IS 'Unique ID of the recipe ingredient';
COMMENT ON COLUMN recipe."recipe_ingredient".recipe_id IS 'Unique ID of the recipe assinged to the ingredient';
COMMENT ON COLUMN recipe."recipe_ingredient".ingredient_type IS 'Type of ingredient';
COMMENT ON COLUMN recipe."recipe_ingredient".ingredient_measurement IS 'Measurement for the ingredient';
COMMENT ON COLUMN recipe."recipe_ingredient".ingredient_amount IS 'Amount for the ingredient';
COMMENT ON COLUMN recipe."recipe_ingredient".sequence_number IS 'Sequence number for the ingredient';
COMMENT ON COLUMN recipe."recipe_ingredient".created_by IS 'Created by user';
COMMENT ON COLUMN recipe."recipe_ingredient".created_timestamp IS 'Created timestamp by the user';

CREATE TABLE recipe."recipe_review" (
	recipe_review_id SERIAL PRIMARY KEY, -- Unique ID of the recipe user review
	user_id integer NOT NULL, -- Unique ID of the user for this recipe review
	recipe_id integer NOT NULL, -- Unique ID of the recipe for the user review
	review_rating integer, -- Rating review number by the user
	review_comment text, -- Review comment by the user 
	created_by varchar(100) NOT NULL, -- User created
	created_timestamp timestamp NOT NULL -- Created timestamp
);

ALTER TABLE recipe."recipe_review" 
	ADD CONSTRAINT recipe_review_fk_1
	FOREIGN KEY (recipe_id) 
	REFERENCES recipe."recipe" (recipe_id);

COMMENT ON COLUMN recipe."recipe_review".recipe_review_id IS 'Unique ID of the user recipe review';
COMMENT ON COLUMN recipe."recipe_review".user_id IS 'Unique ID of the user for this review';
COMMENT ON COLUMN recipe."recipe_review".recipe_id IS 'Unique ID of the recipe for this review';
COMMENT ON COLUMN recipe."recipe_review".review_rating IS 'Rating of the user review';
COMMENT ON COLUMN recipe."recipe_review".review_comment IS 'Comment by the user for the review';
COMMENT ON COLUMN recipe."recipe_review".created_by IS 'Created by user';
COMMENT ON COLUMN recipe."recipe_review".created_timestamp IS 'Created timestamp by the user';

CREATE TABLE recipe."recipe_picture" (
	recipe_picture_id SERIAL PRIMARY KEY, -- Unique ID of the recipe picture
	recipe_id integer NOT NULL, -- Unique ID of the recipe for this picture
	picture_name varchar(250) NOT NULL, -- Name of the recipe picture
	recipe_picture bytea NOT NULL, -- Binary value of the recipe picture
	created_by varchar(100) NOT NULL, -- User created
	created_timestamp timestamp NOT NULL -- Created timestamp
);

ALTER TABLE recipe."recipe_picture" 
	ADD CONSTRAINT recipe_picture_fk_1
	FOREIGN KEY (recipe_id) 
	REFERENCES recipe."recipe" (recipe_id);

COMMENT ON COLUMN recipe."recipe_picture".recipe_picture_id IS 'Unique ID of the recipe picture';
COMMENT ON COLUMN recipe."recipe_picture".recipe_id IS 'Unique ID of the recipe for this picture';
COMMENT ON COLUMN recipe."recipe_picture".picture_name IS 'Name of the picture';
COMMENT ON COLUMN recipe."recipe_picture".recipe_picture IS 'Binary of the picture';
COMMENT ON COLUMN recipe."recipe_picture".created_by IS 'Created by user';
COMMENT ON COLUMN recipe."recipe_picture".created_timestamp IS 'Created timestamp by the user';

CREATE TABLE recipe."category" (
	category_id SERIAL PRIMARY KEY, -- Unique ID of the category
	category_name varchar(200) NOT NULL, -- Name of the category
	created_by varchar(100) NOT NULL, -- User created
	created_timestamp timestamp NOT NULL -- Created timestamp
);

COMMENT ON COLUMN recipe."category".category_id IS 'Unique ID of the category';
COMMENT ON COLUMN recipe."category".category_name IS 'Name of the category';
COMMENT ON COLUMN recipe."category".created_by IS 'Created by user';
COMMENT ON COLUMN recipe."category".created_timestamp IS 'Created timestamp by the user';

CREATE TABLE recipe."recipe_category" (
	recipe_category_id SERIAL PRIMARY KEY, -- Unique ID of the recipe category
	recipe_id integer NOT NULL, -- Unique ID of the recipe for this category
	category_id integer NOT NULL, -- Unique ID of the category
	created_by varchar(100) NOT NULL, -- User created
	created_timestamp timestamp NOT NULL -- Created timestamp
);

ALTER TABLE recipe."recipe_category" 
	ADD CONSTRAINT recipe_category_fk_1
	FOREIGN KEY (recipe_id) 
	REFERENCES recipe."recipe" (recipe_id);

ALTER TABLE recipe."recipe_category" 
	ADD CONSTRAINT recipe_category_fk_2
	FOREIGN KEY (category_id) 
	REFERENCES recipe."category" (category_id);

COMMENT ON COLUMN recipe."recipe_category".recipe_category_id IS 'Unique ID of the recipe category';
COMMENT ON COLUMN recipe."recipe_category".recipe_id IS 'Unique ID of the recipe';
COMMENT ON COLUMN recipe."recipe_category".category_id IS 'Unique ID of the category';
COMMENT ON COLUMN recipe."recipe_category".created_by IS 'Created by user';
COMMENT ON COLUMN recipe."recipe_category".created_timestamp IS 'Created timestamp by the user';
