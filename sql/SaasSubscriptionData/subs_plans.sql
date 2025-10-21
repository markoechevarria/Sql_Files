CREATE DATABASE subs_plans;
USE subs_plans;

CREATE TABLE plan_history (
	id int NOT NULL auto_increment,
    -- subscription_id int,
    plan_id int,
    date_start date,
    date_end date,
    insert_ts timestamp,
    PRIMARY KEY (id),
    -- FOREIGN KEY (subscription_id) REFERENCES subscription(id),
    FOREIGN KEY (plan_id) REFERENCES software_plans.plan(id)
);

CREATE TABLE invoice (
	id int NOT NULL auto_increment,
    customer_invoice_data text,
    -- subscription_id int,
    -- plan_history_id int,
    invoice_period_start_date date,
    invoice_period_end_date date,
    invoice_description varchar(255),
    invoice_amount decimal,
    invoice_created_ts timestamp,
    invoice_due_ts timestamp,
    invoice_paid_ts timestamp,
    PRIMARY KEY (id)
    -- FOREIGN KEY (plan_history_id) REFERENCES plan_history(id),
    -- FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE subscription (
	id int NOT Null auto_increment,
    user_group_id int,
    trial_period_start_date date,
    trial_period_end_date date,
    subscribe_after_trial bool,
    current_plan_id int,
    ofter_id int,
    ofter_start_date date,
    ofter_end_date date,
    date_subscribed date,
    valid_to date,
    date_unsubscribed date,
    insert_ts timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (user_group_id) REFERENCES users_groups.user_group(id),
    FOREIGN KEY (current_plan_id) REFERENCES software_plans.plan(id),
    FOREIGN KEY (ofter_id) REFERENCES software_plans.ofter(id)
);

DROP TABLE user_grup_type;
ALTER TABLE plan_history ADD subscription_id int;
ALTER TABLE plan_history ADD FOREIGN KEY (subscription_id) REFERENCES subscription(id);

ALTER TABLE invoice ADD subscription_id int;
ALTER TABLE invoice ADD plan_history_id int;

ALTER TABLE invoice ADD FOREIGN KEY (plan_history_id) REFERENCES plan_history(id);
ALTER TABLE invoice ADD FOREIGN KEY (subscription_id) REFERENCES subscription(id);