$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.29-0ubuntu0.22.04.2 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show database;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'database' at line 1
mysql> show databases
    -> ;
+--------------------+
| Database           |
+--------------------+
| Akanksha           |
| HR                 |
| HospitalFile       |
| HospitalInfo       |
| NR                 |
| Rushi              |
| University         |
| b2                 |
| classroom          |
| information_schema |
| kunal              |
| manufacturing      |
| mysql              |
| online_retail      |
| performance_schema |
| pizzahub           |
| sys                |
| te                 |
| vrushali           |
+--------------------+
19 rows in set (0.00 sec)

mysql> use pizzahub;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> create table dominos ( itemno int , pizzaname varchar(10) , price int );
Query OK, 0 rows affected (0.04 sec)

mysql> insert into dominos values ( 1 , " farm house" , 150 );
ERROR 1406 (22001): Data too long for column 'pizzaname' at row 1
mysql> insert into dominos values ( 1 , " farmhouse" , 150 );
Query OK, 1 row affected (0.03 sec)

mysql> insert into dominos values ( 2 , "lopanner" , 200 );
Query OK, 1 row affected (0.03 sec)

mysql> select * from dominos;
+--------+------------+-------+
| itemno | pizzaname  | price |
+--------+------------+-------+
|      1 |  farmhouse |   150 |
|      2 | lopanner   |   200 |
+--------+------------+-------+
2 rows in set (0.00 sec)

mysql> create table burgerking ( itemno int not null , pizzaname varchar(10) , price int );
Query OK, 0 rows affected (0.04 sec)

mysql> insert into dominos values ( 1 , "crispyveg" , 150 );
Query OK, 1 row affected (0.02 sec)

mysql> insert into dominos values ( 1 , "doubleveg" , 100 );
Query OK, 1 row affected (0.00 sec)

mysql> select * from burgerking;
Empty set (0.00 sec)

mysql> insert into burgerking  values ( 1 , "doubleveg" , 100 );
Query OK, 1 row affected (0.01 sec)

mysql> insert into burgerking  values ( 2 , "classicveg" , 120 );
Query OK, 1 row affected (0.03 sec)

mysql> select * from burgerking;
+--------+------------+-------+
| itemno | pizzaname  | price |
+--------+------------+-------+
|      1 | doubleveg  |   100 |
|      2 | classicveg |   120 |
+--------+------------+-------+
2 rows in set (0.00 sec)

mysql> insert into burgerking  values ( null , "classicveg" , 120 );
ERROR 1048 (23000): Column 'itemno' cannot be null
mysql> create table md ( itemno int , pizzaname varchar(10) unique , price int );
Query OK, 0 rows affected (0.04 sec)

mysql> insert into md ( 1," crispyveg ",200);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '1," crispyveg ",200)' at line 1
mysql> insert into md ( 1 ,"crispyveg",200);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '1 ,"crispyveg",200)' at line 1
mysql> create table burgerking2 ( itemno int not null , pizzaname varchar(10)unique , price int );
Query OK, 0 rows affected (0.03 sec)

mysql> insert into burgerking  values (1 , "classicveg" , 120 );
Query OK, 1 row affected (0.03 sec)

mysql> insert into burgerking  values (2 , "classicveg" , 220 );
Query OK, 1 row affected (0.03 sec)

mysql> select * from burgerking;
+--------+------------+-------+
| itemno | pizzaname  | price |
+--------+------------+-------+
|      1 | doubleveg  |   100 |
|      2 | classicveg |   120 |
|      1 | classicveg |   120 |
|      2 | classicveg |   220 |
+--------+------------+-------+
4 rows in set (0.00 sec)

mysql> select * from burgerking2;
Empty set (0.00 sec)

mysql> insert into burgerking2  values (1 , "classicveg" , 220 );
Query OK, 1 row affected (0.02 sec)

mysql> insert into burgerking2  values (2 , "classicveg" , 120 );
ERROR 1062 (23000): Duplicate entry 'classicveg' for key 'burgerking2.pizzaname'
mysql> create table pizzeria ( itemno int primary key, pizza varchar(15),price int ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> create table pizzeria ( itemno int primarykey, pizza varchar(15),price int ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'primarykey, pizza varchar(15),price int' at line 1
mysql> create table pizzeria ( itemno int PRIMARY KEY, pizza varchar(15),price int ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> create table pizzeria ( itemno int PRIMARY KEY, pizza varchar(15),price int) ;
Query OK, 0 rows affected (0.04 sec)

mysql> insert into pizzeria  values (1 , "tikkitwist" , 320 );
Query OK, 1 row affected (0.03 sec)

mysql> insert into pizzeria  values (1 , "tikkiblast" , 220 );
ERROR 1062 (23000): Duplicate entry '1' for key 'pizzeria.PRIMARY'
mysql> select * from pizzeria;
+--------+------------+-------+
| itemno | pizza      | price |
+--------+------------+-------+
|      1 | tikkitwist |   320 |
+--------+------------+-------+
1 row in set (0.00 sec)

mysql> insert into pizzeria  values (2 , "tikkiblast" , 220 );
Query OK, 1 row affected (0.03 sec)

mysql> create table pizzeria ( itemno int PRIMARY KEY, pizza varchar(15),price int check(price>1000) ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> create table pizzeria ( itemno int PRIMARY KEY, pizza varchar(15),price int check(price>1000)) ;
ERROR 1050 (42S01): Table 'pizzeria' already exists
mysql> create table ptown ( itemno int PRIMARY KEY, pizza varchar(15),price int check(price>1000)) ;
Query OK, 0 rows affected (0.04 sec)

mysql> insert into ptown  values (1 , "nonveg" , 500 );
ERROR 3819 (HY000): Check constraint 'ptown_chk_1' is violated.
mysql> insert into ptown  values (1 , "nonveg" ,1100 );
Query OK, 1 row affected (0.03 sec)

mysql> select * from ptown
    -> ;
+--------+--------+-------+
| itemno | pizza  | price |
+--------+--------+-------+
|      1 | nonveg |  1100 |
+--------+--------+-------+
1 row in set (0.00 sec)

mysql>  
