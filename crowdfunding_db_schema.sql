-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

--drop campaign table if already exists
DROP TABLE IF EXISTS "Campaign";
--drop contacts table if already exists
DROP TABLE IF EXISTS "Contacts";
--drop category table if already exists
DROP TABLE IF EXISTS "Category";
--drop subcategory table if already exists
DROP TABLE IF EXISTS "Subcategory";

--create category table
CREATE TABLE "Category" (
    "category_id" VARCHAR(50) NOT NULL,
    "category" VARCHAR(50) NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY ("category_id")
);


--create subcategory table
CREATE TABLE "Subcategory" (
    "subcategory_id" VARCHAR(50) NOT NULL,
    "subcategory" VARCHAR(50) NOT NULL,
    CONSTRAINT "pk_Subcategory" PRIMARY KEY ("subcategory_id")
);

--create campaign table
CREATE TABLE "Campaign" (
    "cf_id" INT NOT NULL,
    "contact_id" INT NOT NULL,
    "company_name" VARCHAR(100) NOT NULL,
    "description" VARCHAR(250) NOT NULL,
    "goal" FLOAT NOT NULL,
    "pledged" FLOAT NOT NULL,
    "outcome" VARCHAR(50) NOT NULL,
    "backers_count" INT NOT NULL,
    "country" VARCHAR(50) NOT NULL,
    "currency" VARCHAR(50) NOT NULL,
    "launched_date" DATE NOT NULL,
    "end_date" DATE NOT NULL,
    "category_id" VARCHAR(50) NOT NULL,
    "subcategory_id" VARCHAR(50) NOT NULL,
    CONSTRAINT "pk_Campaign" PRIMARY KEY ("cf_id")
);


--create contacts table
CREATE TABLE "Contacts" (
    "contact_id" INT NOT NULL,
    "first_name" VARCHAR(50) NOT NULL,
    "last_name" VARCHAR(50) NOT NULL,
    "email" VARCHAR(50) NOT NULL,
    CONSTRAINT "pk_Contacts" PRIMARY KEY ("contact_id")
);



-- alter tables to relate to each other using foreign keys
ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "Contacts" ("contact_id");

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "Category" ("category_id");

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "Subcategory" ("subcategory_id");

SELECT * FROM "Campaign";
SELECT * FROM "Category";
SELECT * FROM "Subcategory";
SELECT * FROM "Contacts";