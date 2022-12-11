go
drop database ANIME_SHOP;
go
use ANIME_SHOP;

go
create table posters(
id bigint identity primary key,
[image] varchar(225) not null,
note nvarchar(max),
createdBy varchar(100),
updatedBy varchar(100),
createDate datetime default getDate() not null,
updateDate datetime,
isActive bit default 1 not null
)

go
create table users(
id bigint identity primary key,
username varchar(50) unique not null,
fullname nvarchar(225) not null,
email varchar(100) not null,
avatar varchar(50),
gender bit not null,
[password] varchar(225) not null,
createdBy varchar(100),
updatedBy varchar(100),
createDate datetime default getDate() not null,
updateDate datetime,
isActive bit default 1 not null
)

go
create table roles(
id bigint identity primary key,
name varchar(50) not null,
createdBy varchar(100),
updatedBy varchar(100),
createDate datetime default getDate() not null,
updateDate datetime,
isActive bit default 1 not null
)

go
create table user_roles(
id bigint identity primary key,
createdBy varchar(100),
updatedBy varchar(100),
createDate datetime default getDate() not null,
updateDate datetime,
isActive bit default 1 not null,
userId bigint,
roleId bigint,
constraint fk_user_roles_users foreign key (userId) references users(id),
constraint fk_user_roles_roles foreign key (roleId) references roles(id)
)

go
create table category_parents(
id bigint identity primary key,
name nvarchar(200) not null,
isActive bit default 1 not null,
createdBy varchar(100),
updatedBy varchar(100),
createDate datetime default getDate() not null,
updateDate datetime
)

go
create table categories(
id bigint identity primary key,
name nvarchar(200) not null,
isActive bit default 1 not null,
createdBy varchar(100),
updatedBy varchar(100),
createDate datetime default getDate() not null,
updateDate datetime,
categoryParentId bigint,
constraint fk_categories_category_parents foreign key (categoryParentId) references category_parents(id)
)

go
create table unit_types(
id bigint identity primary key,
name nvarchar(100) not null,
isActive bit default 1 not null,
createdBy varchar(100),
updatedBy varchar(100),
createDate datetime default getDate() not null,
updateDate datetime
)

go
create table products(
id bigint identity primary key,
name nvarchar(225) not null,
quantity int not null,
price decimal(12,3) not null,
slug varchar(255) unique not null,
discount float,
selled int,
nameMain nvarchar(225) not null,
material nvarchar(225) not null,
series nvarchar(225) not null,
[status] nvarchar(225) not null,
[view] int,
size varchar(10),
[description] nvarchar(max),
isActive bit default 1 not null,
createdBy varchar(100),
updatedBy varchar(100),
createDate datetime default getDate() not null,
updateDate datetime,
categoryId bigint,
unitTypeId bigint,
constraint fk_products_categories foreign key (categoryId) references categories(id),
constraint fk_products_unit_types foreign key (unitTypeId) references unit_types(id)
)

go
create table multiple_images(
id bigint identity primary key,
name nvarchar(225),
createdBy varchar(100),
updatedBy varchar(100),
createDate datetime default getDate() not null,
updateDate datetime,
isActive bit default 1 not null,
productId bigint,
constraint fk_multiple_images_products foreign key (productId) references products(id)
)

go
create table reviews(
id bigint identity primary key,
rating float,
comment nvarchar(max),
[like] int,
dislike int,
createdBy varchar(100),
updatedBy varchar(100),
createDate datetime default getDate() not null,
updateDate datetime,
isActive bit default 1 not null,
userId bigint,
productId bigint,
constraint fk_reviews_users foreign key (userId) references users(id),
constraint fk_reviews_products foreign key (productId) references products(id)
)

go
create table posts(
id bigint identity primary key,
[subject] nvarchar(max) not null,
body nvarchar(max) not null,
isActive bit default 1 not null,
[view] int,
slug varchar(255) not null,
[image] varchar(255) not null,
[description] nvarchar(max),
createdBy varchar(100),
updatedBy varchar(100),
createDate datetime default getDate() not null,
updateDate datetime,
productId bigint,
constraint fk_posts_products foreign key (productId) references products(id)
);

go
create table order_status(
id bigint identity primary key,
[status] int not null,
createdBy varchar(100),
updatedBy varchar(100),
createDate datetime default getDate() not null,
updateDate datetime,
isActive bit default 1 not null,
);

go
create table payment_methods(
id bigint identity primary key,
name nvarchar(225) not null,
icon varchar(225),
createdBy varchar(100),
updatedBy varchar(100),
createDate datetime default getDate() not null,
updateDate datetime,
isActive bit default 1 not null
);

go
create table shippers(
id bigint identity primary key,
name nvarchar(225) not null,
phone varchar(13)
)

go
create table orders(
id bigint identity primary key,
[address] nvarchar(255) not null,
phone varchar(13) not null,
createdBy varchar(50),
updatedBy varchar(50),
createDate datetime default getDate() not null,
updateDate datetime,
userId bigint,
orderStatusId bigint,
paymentMethodId bigint,
shipperId bigint,
constraint fk_orders_users foreign key (userId) references users(id),
constraint fk_orders_order_status foreign key (orderStatusId) references order_status(id),
constraint fk_orders_payment_methods foreign key (paymentMethodId) references payment_methods(id),
constraint fk_orders_shippers foreign key (shipperId) references shippers(id)
);

go
create table order_details(
id bigint identity primary key,
price decimal(12,3) not null,
quantity int not null,
orderId bigint,
productId bigint,
constraint fk_order_details_orders foreign key (orderId) references orders(id),
constraint fk_order_details_products foreign key (productId) references products(id)
);

