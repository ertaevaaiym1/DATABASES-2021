create table customer(
    customer_id integer primary key,
    full_name varchar(50) not null,
    phone_number integer not null,
    email_address text not null,
    date_of_birth timestamp not null,
    address varchar not null,
    gender text not null,
    person_id integer,
    foreign key (person_id)
                         references person,
    dealers_id integer,
    foreign key (dealers_id)
                         references dealers
);
DROP TABLE customer CASCADE;

create index customer_gender_index on customer(gender);
select * from customer where gender = 'Female';

create table regular_customer(
    discount_card integer not null,
    customer_id integer,
    foreign key (customer_id)
                         references customer
);
DROP TABLE regular_customer CASCADE;

create table new_customer(
    customer_id integer,
    foreign key (customer_id)
                         references customer
);
DROP TABLE new_customer CASCADE;

create table person(
    person_id integer primary key,
    first_name varchar not null,
    last_name varchar not null,
    phone_number integer not null,
    employee_id integer,
    foreign key (employee_id)
                         references employee
);
DROP TABLE person CASCADE;

create table employee(
    employee_id integer primary key,
    first_name varchar not null,
    last_name varchar not null,
    employee_position varchar not null

);
DROP TABLE employee CASCADE;

create table dealers(
    dealers_id integer primary key,
    dealer_name varchar not null,
    address varchar not null,
    phone_number integer not null,
    email_address text not null,
    date_of_sale timestamp not null,
    manufacturer_id integer,
    foreign key (manufacturer_id)
                         references manufacturer

);
DROP TABLE dealers CASCADE;

create table vehicles(
    vin_id integer primary key,
    vds text not null,
    wmi varchar(3) not null,
    b_name varchar not null,
    inventory_id integer unique,
    dealers_id integer,
    foreign key (dealers_id)
                         references dealers,
    customer_id integer,
    foreign key (customer_id)
                         references customers,
    brand_id integer,
    foreign key (brand_id)
                   references brands
);
DROP TABLE vehicles CASCADE;

create table models(
    model_id integer primary key,
    model_name varchar not null,
    model_year timestamp not null,
    model_color text not null,
    brand_name text not null,
    option_id integer,
    foreign key (option_id)
                   references options
);
DROP TABLE models CASCADE;

create index model_name_index on models(model_name);
select * from models where model_name = 'BMW M3';


create table options(
    option_id integer primary key,
    color text not null,
    transmission text not null,
    engine text not null,
    vin_id integer,
    foreign key (vin_id)
                         references vehicles
);
DROP TABLE options CASCADE;

create table brands(
    brand_id integer primary key,
    brand_name text not null,
    country text not null,
    model_id integer,
    foreign key (model_id)
                   references models
);
DROP TABLE brands CASCADE;


create index brands_country_index on brands(country);
select * from brands where country = 'Japan';

create table mechanical_equipment(
    id integer,
    foreign key (id)
                        references works_for
);
DROP TABLE mechanical_equipment CASCADE;

create table suppliers(
    supplier_id integer primary key,
    supplier_full_name varchar(50) not null,
    address varchar not null,
    company_name text not null,
    postal_code integer not null,
    total_sum double precision not null check ( total_sum > 0 ),
    fax text not null,
    homepage text not null,
    model_id integer,
    foreign key (model_id)
                   references models

);
DROP TABLE suppliers CASCADE;

create table works_for(
    id integer primary key,
    supplier_id integer,
    foreign key (supplier_id)
                            references suppliers
);
DROP TABLE works_for CASCADE;

create table manufacturer(
    manufacturer_id integer primary key,
    manufacturer_name text not null,
    address varchar not null,
    id integer,
    foreign key (id)
                        references works_for,
    vin_id integer,
    foreign key (vin_id)
                         references vehicles
);
DROP TABLE manufacturer CASCADE;

create table sales(
    cid varchar not null,
    did varchar not null,
    date_of_sale timestamp not null,
    price integer not null,
    vin_id integer,
    foreign key (vin_id)
                         references vehicles,
    customer_id integer,
    foreign key (customer_id)
                         references customers,
    dealer_id integer,
    foreign key (dealer_id)
                         references dealers
);
DROP TABLE sales CASCADE;
