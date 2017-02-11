/* DML for inserting initial data for DB */
INSERT INTO recipe."Users" (first_name, last_name, date_of_birth, login_id, password, email_address, created_by, created_timestamp) 
	VALUES ('Admin', 'Admin', '1977-01-01', 'admin', 'admin', 'mike@michaelhoffmaninc.com', 'admin', TIMESTAMP '2017-02-02 01:01:01');