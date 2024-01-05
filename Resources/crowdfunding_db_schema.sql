-- Drop all below tables if they exist
drop table if exists contacts CASCADE;
drop table if exists category CASCADE;
drop table if exists subcategory CASCADE;
drop table if exists campaign CASCADE;

CREATE TABLE contacts (
	contact_id INTEGER NOT NULL,
	first_name VARCHAR(45) NOT NULL,
	last_name VARCHAR(45) NOT NULL,
	email VARCHAR(60) NOT NULL,
		CONSTRAINT "pk_contacts" PRIMARY KEY ("contact_id")
);

CREATE TABLE category (
	category_id VARCHAR(15) NOT NULL,
	category VARCHAR(60) NOT NULL,
		CONSTRAINT "pk_category" PRIMARY KEY ("category_id")
);

CREATE TABLE subcategory (
	subcategory_id VARCHAR(15) NOT NULL,
	subcategory VARCHAR(60) NOT NULL,
		CONSTRAINT "pk_subcategory" PRIMARY KEY ("subcategory_id")
);

CREATE TABLE campaign (
	cf_id INTEGER NOT NULL,
	contact_id INTEGER NOT NULL,
	company_name VARCHAR(60) NOT NULL,
	description TEXT NOT NULL,
	goal FLOAT NOT NULL,
	pledged FLOAT NOT NULL,
	outcome VARCHAR(60) NOT NULL,
	backers_count INTEGER NOT NULL,
	country VARCHAR(60) NOT NULL,
	currency VARCHAR(3) NOT NULL,
	launch_date DATE NOT NULL,
	end_date DATE NOT NULL,
	category_id VARCHAR(15) NOT NULL,
	subcategory_id VARCHAR(15) NOT NULL,
		CONSTRAINT "pk_campaign" PRIMARY KEY ("cf_id"),
		FOREIGN KEY ("subcategory_id") REFERENCES "subcategory"("subcategory_id"),
		FOREIGN KEY ("category_id") REFERENCES "category"("category_id"),
		FOREIGN KEY ("contact_id") REFERENCES "contacts"("contact_id")
);