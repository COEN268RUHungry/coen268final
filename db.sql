create database ruhungry_db;

create table user
    (user_id integer auto_increment,
     user_name varchar(20), 
     user_phone char(13), 
     user_email varchar(30),
     user_password char(8), 
     user_address varchar(50), 
     primary key(user_id));

create table restaurant
     (restaurant_id integer auto_increment,
      restaurant_name varchar(40),
      restaurant_type varchar(40),
      open_hour varchar(20),
      zipcode char(5),
      restaurant_city varchar(30),
      restaurant_address varchar(100),
      restaurant_phone char(10),
      website varchar(100),
      accepted_credit varchar(50),
      restaurant_image varchar(100),
      primary key(restaurant_id));

create table food
    (food_id integer auto_increment,
     food_name varchar(40),
     price float,
     description varchar(60),
     food_type varchar(15), 
     food_image varchar(100),
     primary key(food_id));

create table orders
    (order_id  integer auto_increment,
     order_time timestamp,
     delivery_time timestamp,
     delivery_address varchar(50),
     total_amount float,
     user_id integer,
     primary key(order_id),
     foreign key(user_id) references user(user_id));


create table comments
    (comment_id integer auto_increment, 
     comment_content varchar(200), 
     comment_date date, 
     user_id integer,
     primary key(comment_id), 
     foreign key(user_id) references user(user_id));

create table cart
    (cart_id integer auto_increment, 
     user_id integer,
     primary key(cart_id), 
     foreign key(user_id) references user(user_id));

create table payment
    (order_id integer,
     payment_number integer,
     payment_date timestamp, 
     payment_amount float, 
     payment_method varchar(20),
     primary key(order_id, payment_number), 
     foreign key(order_id) references orders(order_id));

create table order_food
    (order_id integer, 
     restaurant_id integer,
     food_id integer, 
     food_quantity integer, 
     primary key(order_id, restaurant_id, food_id), 
     foreign key(order_id) references orders(order_id), 
     foreign key(restaurant_id) references restaurant(restaurant_id),
     foreign key(food_id) references food(food_id));

create table cart_food
    (cart_id integer, 
     restaurant_id integer,
     food_id integer, 
     food_quantity integer, 
     primary key(cart_id, restaurant_id, food_id), 
     foreign key(cart_id) references cart(cart_id), 
     foreign key(restaurant_id) references restaurant(restaurant_id),
     foreign key(food_id) references food(food_id));
