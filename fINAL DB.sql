DROP DATABASE IF EXISTS RecipePortal;
CREATE DATABASE RecipePortal;

USE RecipePortal;
CREATE TABLE SubscriptionClass (
	SubscriptionClassID int(5) not null Primary Key,
    SubscriptionClassName varchar(25) not null
);

insert into SubscriptionClass values
(1,'Free'),
(2,'Paid');

CREATE TABLE Customers (
  customerID int(11) NOT NULL Primary key,
  contactLastName varchar(50) NOT NULL,
  contactFirstName varchar(50) NOT NULL,
  phone varchar(50),
  addressLine1 varchar(50),
  addressLine2 varchar(50),
  city varchar(50),
  state varchar(50),
  postalCode varchar(15),
  country varchar(50),
  SubscriptionClassID int(5) not null,
  CONSTRAINT Customers_FK00 FOREIGN KEY (SubscriptionClassID) REFERENCES SubscriptionClass (SubscriptionClassID)
);

insert into Customers values
(1, 'Doe', 'John', '9452492244','Frankford Road','Pearl Apt', 'Dallas', 'Texas', '75252', 'United States', 1),
(2, 'Tendulkar', 'Sachin', '1234567890','Marine Lines','Sachin Apt', 'Mumbai', 'Maharashtra', '400072', 'India', 2),
(3, 'Kohli', 'Virat', '0123456789','Churchgate','Virat Apt', 'Mumbai', 'Maharashtra', '400050', 'India', 2),
(4, 'Doe', 'Jane', '0123459876','Frankford Road','Estates Apt', 'Dallas', 'Texas', '75250', 'United States', 2),
(5, 'Richards', 'Vivian', '0123458876','Frank Road','Estates Premier', 'Chaguaramas', 'Indies', '12345', 'West Indies', 2),
(6, 'Green', 'Colin', '6502122233','South Orange St.','King Premier', 'Princeton', 'New Jersey', '08326', 'United States', 2),
(7, 'Red', 'Ross', '6504281928','Euclid Blvd','Samon South', 'Mayville', 'Michigan', '48744', 'United States', 1),
(8, 'Aruthon', 'Davey', '6502818920','Pumpkin Hill Dr.','Apt 6', 'Mount Vernon', 'Illinois', '62864', 'United States', 1),
(9, 'Gilmore', 'Meredith', '9142132123','High Noon Ave','South Apt', 'Hutchinson', 'Kansas', '67502', 'United States', 2),
(10, 'Stout', 'Emily', '9875671293','Gordon Street','2082', 'Las Angeles', 'California', '90017', 'United States', 2),
(11, 'Pitts', 'Prince', '4238192833','Coit Road','Apt 149', 'Mine Hill', 'New Jersey', '07803', 'United States', 1),
(12, 'Stinson','Barney','4698796331','Frankford Road','3314','Dallas','Texas','75252','United States', 2),
(13, 'Lothbrok','Ragnar','4887994633','Renners Road','22','London','London','46594','United Kingdom', 1), 
(14, 'Holmes','Sherlock','9855632247','Baker Street','221B','London','London','68974','United Kingdom', 2),
(15,'Singh','Harbhajan','95498799510','Aarey Road', '133','Mumbai','Maharashtra','400102','India', 2),
(16,'Marsh','Debule','0389018380','Bridge Lane','5594','Sydney','Sydney','2137','Australia', 2),
(17,'Williams','Joey','9452329201','Hill Crest Road', 'Apt 1035','Dallas','Texas','75251','United States',1),
(18, 'Bhanushali', 'Dharmik', '9452329202', 'VP Road', 'BPS Plaza', 'Mumbai', 'Maharashtra', '400079', 'India', 2),
(19, 'Sharma', 'Kunal', '9452329209', 'Eksar Road', 'Royal Complex', 'Mumbai', 'Maharashtra', '400092', 'India', 1),
(20, 'Seth', 'Hitesh', '9769751529', 'Sun Apartments', 'Connaught Place', 'Delhi','Delhi', '110001','India', 2),
(21, 'Whalen', 'Jason', '5646768907', '156 Loagn St', 'Apt 907', 'Denver', 'Colorado', '80203','United States', 2);

insert into Customers values
(22, 'Bezos', 'Jeff', '3945798390','Terry Ave','BezosX', 'Albuquerque', 'New Mexico', '20743', 'United States', 2),
(23, 'Ronaldo', 'Cristiano', '3792792027','Rapida','Eduardo Park', 'Funchal', 'Madeira', '279429', 'Portugal', 1),
(24, 'Jhonson', 'Dwayne', '2804373992','Churchgate','Virat Apt', 'Mumbai', 'Maharashtra', '38945', 'India', 1),
(25, 'Srikant', 'Kannan', '9458808445','Kannan road','Srikant Bhavan', 'Richardson', 'Texas', '24533', 'United States', 2),
(26, 'Musk', 'Elon', '9274059722','Dorthway','Elon Niwas', 'Pretoria', 'Gauteng', '23423', 'South Africa', 2),
(27, 'Trump', 'Donald', '3279832372','Coit Road','Trump Tower', 'Dallas', 'Texas', '75082', 'United States', 2);



CREATE TABLE ingredient_classes (
  IngredientsClassID smallint NOT NULL Primary Key,
  IngredientsClassDescription varchar(100)
);

insert into ingredient_classes values
(1,'Animal Protein'),
(2,'Plant Protein'),
(3,'Cooking fat and oil'),
(4, 'Vegetables'),
(5, 'Fruits'),
(6, 'Grains'),
(7, 'Toppings and Seasoning'),
(8, 'Lentils'),
(9, 'Dairy'),
(10, 'Nuts'),
(11, 'Baking Product'),
(12, 'Others');

CREATE TABLE Measurements (
MeasurementID INT NOT NULL PRIMARY KEY,
MeasurementDescription VARCHAR(100)
);

insert into Measurements values
(1,'Cup'),
(2,'Tablespoon'),
(3,'Teaspoon'),
(4, 'Pinch'),
(5, 'Slice'),
(6, 'Bunch'),
(7, 'Ounce'),
(8, 'Pound'),
(9, 'To taste'),
(10, 'Scoop');

CREATE TABLE Ingredients (
IngredientsID INT NOT NULL PRIMARY KEY,
IngredientsName VARCHAR(50),
IngredientsClassID smallint NOT NULL, 
MeasurementID INT NOT NULL,
CONSTRAINT Ingredients_FK00 FOREIGN KEY (MeasurementID) REFERENCES Measurements (MeasurementID),
CONSTRAINT Ingredients_FK01 FOREIGN KEY (IngredientsClassID) REFERENCES Ingredient_Classes (IngredientsClassID)
);

INSERT INTO Ingredients VALUES (1,'Onion',4,1),(2,'Garlic',4,2),(3,'Water',12,7),(4,'Ginger',4,2),(5,'Potato',4,5),(6,'Carrot',4,1),
(7,'Tomato',4,1),(8,'Jalapeno',4,2),(9,'Chicken',1,8),(10,'Black Pepper (ground)',7,3),(11,'Salt',7,9),(12,'Cheese',9,8),
(13,'Bacon',1,7),(14,'Beef',1,7),(15,'Lettuce',4,1),(16,'Apple',5,1),(17,'Orange',5,1),(18,'Grapes',5,1),(19,'Salmon',1,8),
(20,'Vinegar',7,9),(21,'Olive Oil',3,2),(22,'Milk',9,7),(23,'Red wine',12,7),(24,'Fish',1,8),(25,'Butter',3,2),(26,'Rice',6,1),
(27,'Pasta',6,1),(28,'Parshley',7,6),(29,'Cilantro',7,6),(30,'Oregano',7,6),(31,'Dal',8,1),(32,'Almond',10,3),(33,'Cashew',10,3),
(34,'Chilli powder',7,4),(35,'Coconut milk',12,7), (36,'Flour',6,1), (37, 'Sugar',12,2);

CREATE TABLE Cuisine_Type (
Cuisine_TypeID INT(5) NOT NULL PRIMARY KEY,
Cuisine_TypeDescription VARCHAR(25) NOT NULL
);

insert into Cuisine_Type values
(1, 'French'),
(2, 'Chinese'),
(3, 'Japanese'),
(4, 'Indian'),
(5, 'Italian'),
(6, 'Greek'),
(7, 'Spanish'),
(8, 'Lebanese'),
(9, 'American'),
(10, 'Turkish'),
(11, 'Thai'),
(12, 'Others');

CREATE TABLE Meal_Type (
  Meal_TypeID smallint NOT NULL DEFAULT 0,
  Meal_TypeDescription varchar(255) DEFAULT NULL,
  PRIMARY KEY (Meal_TypeID)
  );
  
insert into Meal_Type values
(1, 'Breakfast'),
(2, 'Brunch'),
(3, 'Snack'),
(4, 'Lunch'),
(5, 'Tea'),
(6, 'Supper'),
(7, 'Dinner');

create table Meal_Course (
		Meal_CourseID int NOT NULL PRIMARY KEY,
        Meal_CourseDescription VARCHAR(255)
);

insert into Meal_Course values
(1, 'Soup'),
(2, 'Salad'),
(3, 'Appetizer'),
(4, 'Main Course'),
(5, 'Dessert'),
(6, 'Beverage');

create table Cooking_Level (
		Cooking_LevelID int NOT NULL PRIMARY KEY,
        Cooking_LevelDescription VARCHAR(255)
);

insert into Cooking_Level values
(1, 'Easy'),
(2, 'Intermediate'),
(3, 'Hard');

CREATE TABLE Recipes (
RecipeID int NOT NULL DEFAULT 0,
Cuisine_TypeID int(5) DEFAULT 0,
Meal_TypeID smallint DEFAULT 0,
Meal_CourseID int DEFAULT 0,
Cooking_LevelID int DEFAULT 0,
RecipeName varchar(255) DEFAULT NULL,
RecipeDescription varchar(255) DEFAULT NULL,
RecipePreparationTime_minutes int DEFAULT 0,
UploadedBy int(11) NOT NULL,
SubscriptionClassID int(5) not null,
  PRIMARY KEY (RecipeID),
  CONSTRAINT Recipes_FK00 FOREIGN KEY (Cuisine_TypeID) REFERENCES Cuisine_Type (Cuisine_TypeID),
  CONSTRAINT Recipes_FK01 FOREIGN KEY (Meal_TypeID) REFERENCES Meal_Type (Meal_TypeID),
  CONSTRAINT Recipes_FK02 FOREIGN KEY (Meal_CourseID) REFERENCES Meal_Course (Meal_CourseID),
  CONSTRAINT Recipes_FK03 FOREIGN KEY (Cooking_LevelID) REFERENCES Cooking_Level (Cooking_LevelID),
  CONSTRAINT Recipes_FK04 FOREIGN KEY (UploadedBy) REFERENCES Customers (customerID),
  CONSTRAINT Recipes_FK05 FOREIGN KEY (SubscriptionClassID) REFERENCES SubscriptionClass (SubscriptionClassID)
  );
  
  -- Add 5 recipes details each
insert into Recipes values
(1, 11, 4, 4, 1, 'Red Chicken Curry', 'Chicken curry in red sauce', 45, 1, 1),
(2, 8, 2, 3, 3, 'Hummus with Pita', 'Wheat flour based bread served with chickpea sauce', 60, 1, 2),
(3, 4, 4, 4, 2, 'Chicken Biriyani', 'Spiced rice with chicken', 120, 1, 2),
(4, 5, 7, 4, 3, 'Meatballs with Pasta', 'Chicken curry in red sauce', 60, 1, 2),
(5, 2, 3, 4, 1, 'Orange Chicken', 'Fried Chicken pieces tossed in tangy orange and honey sauce', 45, 1, 2),
(6, 4, 1, 4, 1, 'Poha', 'Flattened rice sauted with onions, peanuts and Indian spices and garnished with cilantro', 30, 3, 2),
(7, 4, 7, 4, 1, 'Khichdi', 'Rice and lentils cooked with a few vegetables', 30, 3, 2),
(8, 4, 3, 6, 1, 'Lassi', 'Curd based drink with little salt/ sugar seasoning', 15, 3, 2),
(9, 7, 2, 1, 2, 'Gazpacho', 'Best for cooling off heat, when the tomatoes turn juicy', 30, 10, 1),
(10, 7, 5, 5, 3, 'Basque Cheesecake', 'This cheesecake is baked without a crust and at high temperature', 45, 9, 2),
(11, 6, 5, 3, 1, 'Skordalia', 'Must try Greek dip!', 30, 6, 2),
(12, 6, 2, 2, 2, 'Greek Salad', 'With Greeks heavy us of veggies', 45, 5, 
2),
(13, 1, 7, 4, 3, 'Julia Child Potato Leek Soup', 'If soothing texture is what you are craving for', 90, 2, 2),
(14, 5, 2, 3, 1, 'Spaghetti Pasta','Pasta with puree of tomatoes with savory vegetables and other seasonings', 30, 14, 2),
(15, 4, 7, 3, 2, 'Paneer Tikka','Indian dish made from chunks of paneer marinated in spices and grilled in tandoor', 60, 15, 2),
(16, 4, 4, 4, 2, 'Missal Pav','Vibrant Meal consisting of a spicy sprouted bean curry topped with crunchy Farsan',  60, 11, 2),
(17, 5, 2, 3, 1, 'Pappardelle Pasta','Large surface and textured pasta which are perfect accompaniment to more robust sauces and ragus', 30, 13, 1),
(18, 9, 7, 5, 3, 'Double Fudge Brownie','Chocolaty product made in square and rectangle shape served hot with icecream', 60, 12, 2),
(19, 5, 1, 6, 1, 'Italian Hot Chocolate', 'Italian Hot Chocolate is a mug full of creamy deliciously thick Hot Chocolate', 5, 16, 1),
(20, 5, 7, 4, 3, 'Pizza', 'Italian Cheese Pizza', 120, 16, 2),
(21, 4, 2, 2, 1, 'Salad', 'Paneer Salad with vegies', 15, 17, 2),
(22, 4, 4, 4, 3, 'Dal fry', 'Indian Lentil dish made with onions, garlic and spices', 30, 17, 1),
(23, 1, 3, 3, 2, 'French Fries', 'snack typically made from deep-fried potatoes', 30, 18, 1);

insert into Recipes values
(24, 1, 4, 4, 3, 'Classic Coq Au Vin', 'French-style stew of tender chicken in a rich, tangy red wine sauce', 60, 1, 2),
(25, 6, 6, 4, 2, 'Shrimp Curry', 'Dish of shrimp in a spicy tomato sauce with feta cheese', 35, 1, 1),
(26, 7, 1, 4, 1, 'Spanish Rice', 'Mexican dish made from white rice, tomato, garlic, onion', 25, 1, 1);



CREATE TABLE RecipesIngredients (
RecipeID int NOT NULL DEFAULT 0,
IngredientsID int NOT NULL DEFAULT 0,
Amount DOUBLE DEFAULT 0.0,
  CONSTRAINT RecipesIngredients_FK00 FOREIGN KEY (RecipeID) REFERENCES Recipes (RecipeID),
  CONSTRAINT RecipesIngredients_FK01 FOREIGN KEY (IngredientsID) REFERENCES Ingredients (IngredientsID)
);

-- Add atleast 3 ingredients details per recipe, so at least 15 entries per person
insert into RecipesIngredients values
(1, 9, 2),(1, 1, 3),(1, 2, 3),
(2, 36, 2),(2, 30, 2),(2, 33, 10),
(3, 9, 3),(3, 26, 2),(3, 1, 11),
(4, 27, 2),(4, 14, 3),(4, 25, 10),
(5, 9, 2),(5, 2, 2),(5, 4, 3),
(6, 1, 4),(6, 32, 4),(6, 26, 2),
(7, 4, 3),(7, 31, 4),(7, 26, 3),
(8, 3, 1),(8, 11, 1),(8, 10, 1),
(9, 7, 3),(9, 2, 3),(9, 10, 1),
(10, 12, 4),(10, 3, 2),(10, 25, 3),
(11, 21, 2),(11, 7, 2),(11, 32, 3),
(12, 21, 2),(12, 7, 2),(12, 1, 2),
(13, 5, 5),(13, 21, 1),(13, 30, 2),
(14,1,5),(14,3,5),(14,27,4),
(15,22,4),(15,24,2),(15,11,2),
(16,3,3),(16,1,3),(16,5,5),
(17,1,5),(17,3,5),(17,27,4),
(18,36,2),(18,25,2),(18,22,4),
(19,22,1), (19,36,2),  (19,37,4),
(20,36,2), (20,7,2), (20,30,1),
(21,7,1), (21,29,1), (21,1,1),
(22,31,1), (22,2,2), (22,1,1),
(23,21,3), (23,5,3), (23,11,3),
(24,1,5),(24,3,5),(24,27,4),
(25,36,2),(25,25,2),(25,22,4),
(26,21, 3),(26, 2, 2),(26, 4, 3);


   
create table Recipes_Comments(
		RecipeID int,
        CommentID int NOT NULL primary key,
        CustomerID int,
        CustomerRating int,
        Customer_Comment_Description VARCHAR(255),
        constraint Recipes_Comments_FK00 foreign key(RecipeID) references Recipes(RecipeID)
); 

-- Add 5 comments details each
insert into Recipes_Comments values
(1, 1, 2, 10, 'Awesome recipe. Really easy to make'),
(1, 2, 3, 6, 'Okay recipe. Did not like it much'),
(3, 3, 3, 10, 'Wholesome food and baeutifully explained'),
(5, 4, 4, 8, 'Good'),
(4, 5, 5, 3, 'Did not taste good'),
(6, 6, 4, 10, 'Awesome taste'),
(7, 7, 5, 9, 'Yummy'),
(7, 8, 2, 1, 'Poorly explained'),
(7, 9, 3, 3, 'Does not deserve to be on this platform'),
(11,10,12,10,'It was Best'),
(15,11,14,10,'Squisito'),
(12,12,4,9,'Fantastic Recipe'),
(12,13,19,8,'Wow, this recipe is amazing'),
(13,14,7,10,'Mouth-Watering'),
(14,15,12,9,'plain but tasty'),
(15,16,13,8,'Super Delicious but can be better'),
(16,17,11,6,'mediocre taste'),
(17,18,14,5, 'awfull'),
(18,19,16,9, 'Well explained, easy to make');


CREATE TABLE Recipes_Views (
  NumberofViewsTotal int,
  NumberofViewsLastMonth int,
  NumberofViewsLastWeek int,
  RecipeID int,
  constraint Recipes_Views_FK00 FOREIGN KEY (RecipeID) REFERENCES Recipes (RecipeID)
);

-- Add 5 Recipes_Views each
insert into Recipes_Views values
(100, 48, 22, 1),
(20, 12, 2, 2),
(230, 171, 123, 3),
(403, 333, 222, 4),
(72, 33, 12, 5),
(327, 43, 21, 6),
(703, 93, 1, 7),
(237, 123, 91, 8),
(21, 10, 4, 9),
(323, 200, 53, 10),
(400, 200, 100, 11),
(492, 212, 102, 12),
(654, 543, 347, 13),
(334, 150, 70, 14),
(293, 590, 100, 15),
(90, 200, 10, 16),
(900, 500, 250, 17),
(50, 80, 8, 18),
(100, 50, 5, 19),
(150, 75, 8, 20),
(180, 90, 9, 21),
(200, 100, 10, 22),
(230, 115, 12, 23);


insert into Recipes_Views values
(900, 250, 10, 24),
(900, 300, 250, 25),
(500, 80, 8, 26);



CREATE TABLE PaymentClass (
  PaymentModeID int NOT NULL Primary key,
  PaymentModeDescription varchar(50)
);

insert into PaymentClass values
(1, 'Debit Card'),
(2, 'Credit Card'),
(3, 'Electronic Bank Transfer'),
(4, 'Third party application'),
(5, 'Others');

CREATE TABLE Payment_details(
  OrderNo int NOT NULL Primary key,
  PaymentDate date,
  CustomerID int,
  PaymentModeID int,
  CONSTRAINT Payment_details_FK00 FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
  CONSTRAINT Payment_details_FK01 FOREIGN KEY (PaymentModeID) REFERENCES PaymentClass (PaymentModeID)
);

-- Add 5 Payment_details each, only add details of paid customers (subscription class id is 2)
insert into Payment_details values
(1, '2022-11-01', 2, 1),
(2, '2022-11-03', 3, 2),
(3, '2022-11-04', 4, 2),
(4, '2022-11-05', 5, 3),
(5, '2022-11-05', 6, 2),
(6, '2022-10-30', 9, 4),
(7, '2022-11-01', 10, 5),
(8, '2022-11-02', 12, 2),
(9, '2022-12-01', 14, 2),
(10, '2022-12-01', 15, 4),
(11, '2022-12-01', 16, 2),
(12, '2022-12-02', 25, 5),
(13, '2022-12-03' ,18 , 2),
(14, '2022-12-04' ,22, 1),
(15, '2022-12-04', 20, 2),
(16, '2022-12-04', 21, 3),
(17, '2022-11-04', 26, 3),
(18, '2022-11-08', 27, 3);


-- Show all the Easy level recipes from India
SELECT Recipes.RecipeName As Recipe_Name, Recipes.RecipeDescription AS Recipe_Description,
Cooking_Level.Cooking_LevelDescription AS Cooking_Level, Cuisine_Type.Cuisine_TypeDescription AS Cuisine_Type FROM
Recipes, Cooking_Level, Cuisine_Type WHERE
(Recipes.Cuisine_TypeID=Cuisine_Type.Cuisine_TypeID AND
Recipes.Cooking_LevelID=Cooking_Level.Cooking_LevelID AND
Cuisine_Type.Cuisine_TypeDescription='Indian' AND
Cooking_Level.Cooking_LevelDescription='Easy');

-- Show the names of customers who paid by credit card (2 ways shown)
SELECT CONCAT (Customers.contactFirstName, ' ', Customers.contactLastName) AS Customer_Name, PaymentClass.PaymentModeDescription AS Paid_by FROM
Customers, PaymentClass, Payment_details WHERE
(Customers.customerID=Payment_details.CustomerID AND
Payment_details.PaymentModeID=PaymentClass.PaymentModeID AND
PaymentClass.PaymentModeDescription= 'Credit Card');

SELECT CONCAT (Customers.contactFirstName, ' ', Customers.contactLastName) AS Customers_who_paid_by_CreditCard FROM
Customers WHERE Customers.customerID IN
(SELECT Payment_details.CustomerID FROM PaymentClass, Payment_details WHERE
Payment_details.PaymentModeID=PaymentClass.PaymentModeID AND
PaymentClass.PaymentModeDescription= 'Credit Card');

-- Show me recipes with proteins
SELECT DISTINCT Recipes.RecipeName As Recipe_Name, Recipes.RecipeDescription AS Recipe_Description FROM
Recipes, RecipesIngredients, Ingredients, Ingredient_classes
WHERE
(Recipes.RecipeID=RecipesIngredients.RecipeID AND
RecipesIngredients.IngredientsID=Ingredients.IngredientsID AND
Ingredients.IngredientsClassID=Ingredient_classes.IngredientsClassID AND
Ingredient_classes.IngredientsClassDescription IN ('Animal Protein', 'Plant Protein', 'Lentils', 'Nuts'));

-- Create a stored function to return customer tier based on recipes uploads count (Criteria: More than 4 recipes uploaded -> Platinum,
-- 2-4 recipes uploaded -> Gold, 1 or no recipe uploaded -> Silver). Create a procedure to invoke this function and categorise all customers
DROP FUNCTION IF EXISTS Customer_Tier;
DELIMITER $$
CREATE FUNCTION Customer_Tier(Recipes_Count INT)
RETURNS VARCHAR(20)
deterministic
BEGIN
	DECLARE Customer_Tier VARCHAR(20);
    IF Recipes_Count> 3 THEN
		SET Customer_Tier= 'PLATINUM';
	ELSEIF (Recipes_Count>= 2) THEN
		SET Customer_Tier= 'GOLD';
	ELSEIF (Recipes_Count>= 0) THEN
		SET Customer_Tier='SILVER';
	ELSE
		SET Customer_Tier='Wrong Input';
	END IF;
RETURN (Customer_Tier);
END $$
DELIMITER ;
SELECT Customer_Tier(-1);
SELECT Customer_Tier(5);
SELECT Customer_Tier(2);
SELECT Customer_Tier(0);

DROP PROCEDURE IF EXISTS All_Customers_Tiers;
DELIMITER $$
CREATE PROCEDURE All_Customers_Tiers()
BEGIN
	DECLARE Customer_Nos INT;
    DECLARE Counter INT DEFAULT 1;
    DECLARE Function_Input INT;
    DECLARE MESSAGE VARCHAR(1024) DEFAULT ' ';
    DECLARE Customer_Name VARCHAR(50);
    SELECT COUNT(customerID) INTO Customer_Nos FROM Customers;
    WHILE Counter <= Customer_Nos DO
		SELECT COUNT(RecipeID) INTO Function_Input FROM Recipes WHERE UploadedBy= Counter;
        SELECT CONCAT(contactFirstName, ' ', contactLastName) INTO Customer_Name FROM Customers WHERE customerID= Counter;
        SET MESSAGE = CONCAT(MESSAGE, Customer_Name ,' ', Customer_Tier(Function_Input), ' | ');
        SET Counter=Counter+1;
	END WHILE;
    SELECT MESSAGE AS Tier_List;
    END $$

DELIMITER $$
CREATE PROCEDURE Single_Customer_Tier(
	IN Cust_ID INT,
    OUT CustomerTier VARCHAR(20)
)
BEGIN
	DECLARE RecipeCount INT DEFAULT 0;
    SELECT
		COUNT(RecipeID)
	INTO RecipeCount
    FROM Recipes
    WHERE
		UploadedBy=Cust_ID;
    SET CustomerTier=Customer_Tier(RecipeCount);
END$$

DELIMITER ;

CALL All_Customers_Tiers();

CALL Single_Customer_Tier(2,@CustomerTier);
SELECT @CustomerTier;

### Pasta Recipes with no Spaghetti 
SELECT *
FROM Recipes
WHERE RecipeName LIKE '%Pasta%'and RecipeName Not Like '%Spaghetti%';

### Customers who subscribed in Nov 2022 (Use BETWEEN)
SELECT CONCAT (Customers.contactFirstName, ' ', Customers.contactLastName) AS Customer_Name, Payment_details.PaymentDate
FROM Payment_details, Customers
WHERE
(Payment_details.CustomerID=Customers.customerID AND
Payment_details.PaymentDate BETWEEN '2022-11-01' AND '2022-11-30')
ORDER BY Payment_details.PaymentDate ASC;

### Add calories column in Recipes Table (To be checked later)
ALTER TABLE Recipes
ADD Calories Int;

Update Recipes Set calories = '150' where RecipeID = 1;
Update Recipes Set calories = '250' where RecipeID = 2;
Update Recipes Set calories = '180' where RecipeID = 3;
Update Recipes Set calories = '110' where RecipeID = 4;
Update Recipes Set calories = '80' where RecipeID = 5;
Update Recipes Set calories = '150' where RecipeID = 6;
Update Recipes Set calories = '300' where RecipeID = 7;
Update Recipes Set calories = '180' where RecipeID = 8;
Update Recipes Set calories = '120' where RecipeID = 9;
Update Recipes Set calories = '170' where RecipeID = 10;

### Recipes and their views in descending order
SELECT Recipes.RecipeName, Recipes_Views.NumberofViewsTotal
FROM Recipes_Views
INNER JOIN Recipes
ON Recipes.RecipeID = Recipes_Views.RecipeID
Order By Recipes_Views.NumberofViewsTotal DESC;


### Before update trigger: Customers who goes from free to paid

drop trigger if exists subscription_change;
DROP TABLE IF EXISTS Subscriber_Change;
CREATE TABLE Subscriber_Change (
	SR INT AUTO_INCREMENT PRIMARY KEY,
    ID INT NOT NULL,
	LastName varchar(50) NOT NULL,
	FirstName varchar(50) NOT NULL,
	PhoneNumber varchar(50),
	ClassID int(5) not null,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);
SELECT * FROM Subscriber_Change;

CREATE  TRIGGER subscription_change
            BEFORE UPDATE
            ON Customers FOR EACH ROW
			INSERT INTO Subscriber_Change
            SET action = 'update',
            ID=old.customerID,
            ClassID = old.SubscriptionClassID,
            LastName= old.contactLastName,
            FirstName= old.contactFirstName,
            PhoneNumber= old.phone,
            changedat = now();

SHOW TRIGGERS;

UPDATE Customers
SET SubscriptionClassID = 1
WHERE customerID = 1;

SELECT * FROM Customers;
SELECT * FROM Subscriber_Change;

UPDATE Customers
SET SubscriptionClassID = 2
WHERE customerID = 1;

SELECT * FROM Customers;
SELECT * FROM Subscriber_Change;

UPDATE Customers
SET SubscriptionClassID = 1
WHERE customerID = 1;

SELECT * FROM Customers;
SELECT * FROM Subscriber_Change;

-- Recipe with the 2nd highest number of comments (SUB QUERY, COUNT)
Select r1.recipeid, r3.recipename from Recipes_Comments r1 inner join recipes r3 on r1.recipeid=r3.recipeid 
where 1=(Select count(distinct(recipeid)) from Recipes_Comments r2 where r2.recipeid<r1.recipeid);

-- Recipes ending in curry (Use LIKE ‚%curry)
Select RecipeID, RecipeName, RecipeDescription from recipes where RecipeName Like '%Curry';

-- Top 5 recipes of last week based on number of views (LIMIT, ORDER BY)
Select RecipeID, NumberofViewsLastWeek from Recipes_views order by NumberofViewsLastWeek desc Limit 5;

-- last week views of the recipes Meal type wise (USE SUM, JOIN)
Select Sum(NumberofViewsLastWeek) AS Views_Last_week, mt.meal_typeid, mt.meal_typedescription from Recipes_views rv 
inner join recipes r on rv.recipeid=r.recipeid 
inner join meal_type mt on r.meal_typeid=mt.meal_typeid
group by meal_typeid, meal_typedescription ORDER BY Views_Last_week DESC;

-- Show me the customers who have not uploaded any recipes (Outer Join)
Select distinct(Customerid), concat(ContactFirstName,' ', ContactLastName) as Customer_Name from customers c 
where c.customerid Not in (Select r.uploadedby from recipes r);

select customerid, concat(ContactFirstName,' ',ContactLastName) as CustomerName from customers c left outer join Recipes r on c.customerid=r.uploadedby
where r.recipeid is null;


##1.Customers count by statewise (US states only) in descending order (Use count, group by, order by) 

Select count(*) as "Count of customers" , state from Customers where country = 'United States' group by state order by state desc;


##2.Number of free and paid subscribers countrywise (Use count) 
Select count(Customers.customerID), Customers.country, SubscriptionClass.SubscriptionClassName from Customers, SubscriptionClass
where (Customers.SubscriptionClassID = SubscriptionClass.SubscriptionClassID) group by SubscriptionClass.SubscriptionClassName, Customers.country ORDER BY Customers.country;


##3.Highest and lowest viewed recipes (MIN, MAX)

SELECT Recipes.RecipeName, Recipes_Views.RecipeID, Recipes_Views.NumberofViewsTotal FROM
(SELECT MAX(NumberofViewsTotal) AS Max_R FROM Recipes_Views) Maxi,
(SELECT MIN(NumberofViewsTotal) AS Min_R FROM Recipes_Views) Mini,
Recipes_Views, Recipes WHERE 
Recipes_Views.RecipeID = Recipes.RecipeID and 
(Recipes_Views.NumberofViewsTotal=Maxi.Max_R OR
Recipes_Views.NumberofViewsTotal=Mini.Min_R);


##4.Show me all the recipes based on meal course input (create Procedure) 

delimiter $$ 
create procedure show_recipes(meal_course int(5) ) begin select * from RecipePortal.Recipes where Meal_CourseID = meal_course; 
end $$
call show_recipes(4);




##5.Recipes with rice as an ingredient (JOIN)

select Recipes.* from Recipes, RecipesIngredients, Ingredients where
(Recipes.RecipeID = RecipesIngredients.RecipeID AND
RecipesIngredients.IngredientsID = Ingredients.IngredientsID AND
Ingredients.IngredientsName = 'Rice');

### Recipes that are from Europe ('France', 'Italy', 'Spanish', 'Greece')
SELECT RecipeName, RecipeDescription
FROM recipes
JOIN Cuisine_Type ON recipes.Cuisine_TypeID = Cuisine_Type.Cuisine_TypeID
WHERE Cuisine_TypeDescription = ('French') OR Cuisine_TypeDescription = ('Italian') OR Cuisine_TypeDescription = ('Spanish') 
OR Cuisine_TypeDescription = ('Greek');


### Customers who are not paid customers and are from Dallas
SELECT CONCAT(contactFirstName, ' ', contactLastName) AS ContactName, SubscriptionClassName, city
FROM customers
JOIN subscriptionclass ON customers.SubscriptionClassID = SubscriptionClass.SubscriptionClassID
WHERE subscriptionclass.SubscriptionClassName = ('Free') AND customers.city = ('Dallas');


### What are the total views a recipe got over the time
DROP FUNCTION IF EXISTS Get_Total_Views;
DELIMITER //
CREATE FUNCTION Get_Total_Views (ID INT)
RETURNS INT
deterministic
BEGIN
     DECLARE ViewsTotal INT;
     SELECT NumberofViewsTotal INTO ViewsTotal
        FROM Recipes_Views
        WHERE RecipeID = ID ;
     RETURN ViewsTotal;
END //
select Get_Total_Views (1) //
select Get_Total_Views (2) //
select Get_Total_Views (3) //

### Create a before delete trigger that backs up recipes after being deleted
DELIMITER $$ 
CREATE TRIGGER BackUp_Insert
BEFORE DELETE ON recipes
FOR EACH ROW
BEGIN
    INSERT INTO Deleted_BackUp
        (RecipeID, Cuisine_TypeID, Meal_TypeID, Meal_CourseID, Cooking_LevelID, RecipeName, RecipeDescription,
RecipePreparationTime_minutes, UploadedBy, SubscriptionClassID)
    VALUES (OLD.RecipeID, OLD.Cuisine_TypeID, OLD.Meal_TypeID, OLD.Meal_CourseID, OLD.Cooking_LevelID, OLD.RecipeName, 
    OLD.RecipeDescription, OLD.RecipePreparationTime_minutes, OLD.UploadedBy, OLD.SubscriptionClassID);
END$$
DELIMITER ;


### Recipes that use 2 or more table spoon's of olive oil
SELECT r.RecipeName, i.IngredientsName, ri.Amount
FROM recipesingredients ri
JOIN recipes r ON ri.RecipeID = r.RecipeID
JOIN ingredients i ON ri.IngredientsID = i.IngredientsID
JOIN measurements m ON i.MeasurementID = m.MeasurementID
WHERE i.IngredientsName = 'Olive Oil' AND ri.Amount >= 2;







