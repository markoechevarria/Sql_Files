CREATE DATABASE software_plans;
USE software_plans;

CREATE TABLE plan(
	id int NOT NULL auto_increment,
    plan_name varchar(255),
    user_group_type_id int,
    current_price decimal(8,2),
    insert_ts timestamp,
    is_active bool,
    PRIMARY KEY (id),
    FOREIGN KEY (user_group_type_id) REFERENCES user_grup_type(id) 
);
CREATE TABLE software(
	id int NOT NULL auto_increment,
    software_name varchar(255),
    details text,
    accesss_link text,
    PRIMARY KEY (id)
);
CREATE TABLE option_(
	id int NOT NULL auto_increment,
    option_name varchar(255),
    PRIMARY KEY(id)
);
CREATE TABLE option_included(
	id int NOT NULL auto_increment,
    plan_id int,
    option_id int,
    date_added date,
    date_removed date,
    PRIMARY KEY (id),
    FOREIGN KEY (plan_id) REFERENCES plan(id),
    FOREIGN KEY (option_id) REFERENCES option_(id)
);
CREATE TABLE include (
	id int NOT NULL auto_increment,
    ofter_id int,
    plan_id int,
    PRIMARY KEY (id),
    FOREIGN KEY(ofter_id) REFERENCES ofter(id),
    FOREIGN KEY(plan_id) REFERENCES plan(id)
);
CREATE TABLE ofter(
	id int NOT NULL auto_increment,
    ofter_name varchar(255),
    ofter_stand_date date,
    ofter_end_date date,
    description_ofter text,
    dicount_amount decimal(8,2),
    dicount_percentage decimal(5,2),
    duration_months int,
    duration_end_date date,
    PRIMARY KEY (id)
);
CREATE TABLE prerequisite(
	id int NOT NULL auto_increment,
    ofter_id int,
    plan_id int,
    PRIMARY KEY (id),
    FOREIGN KEY(ofter_id) REFERENCES ofter(id),
    FOREIGN KEY(plan_id) REFERENCES plan(id)
);
CREATE TABLE user_grup_type(
	id int NOT NULL auto_increment,
    type_name varchar(125),
    members_min int,
    mambers_max int,
    PRIMARY KEY (id)
);

ALTER TABLE plan ADD software_id int;
ALTER TABLE plan ADD FOREIGN KEY (software_id) REFERENCES software(id);