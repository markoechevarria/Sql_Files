CREATE DATABASE users_groups;
USE users_groups;

CREATE TABLE user_account(
	id int NOT NULL auto_increment,
    first_name varchar(64),
    last_name varchar(64),
    user_name varchar(64),
    password varchar(255),
    email varchar(128),
    confirmation_code text,
    confirmation_time timestamp,
    insert_ts timestamp,
    PRIMARY KEY (id)
);
CREATE TABLE in_group(
	id int NOT NULL auto_increment,
    user_group_id int,
    user_account_id int,
    time_added timestamp,
    time_removed timestamp,
    group_admin bool,
    PRIMARY KEY (id),
    FOREIGN KEY (user_group_id) REFERENCES user_group(id),
    FOREIGN KEY (user_account_id) REFERENCES user_account(id)
);
CREATE TABLE user_group(
	id int NOT NULL auto_increment,
    user_group_type_id int,
    customer_invoice_data text,
    insert_ts timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (user_group_type_id) REFERENCES user_group_type(id)
);
CREATE TABLE user_group_type(
	id int NOT NULL auto_increment,
    type_name varchar(128),
    member_min int,
    member_max int,
    PRIMARY KEY(id)
);