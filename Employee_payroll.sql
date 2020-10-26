Server version: 8.0.22 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
 MySQL  localhost:33060+ ssl  SQL > show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
7 rows in set (0.0013 sec)
 MySQL  localhost:33060+ ssl  SQL > use payroll_service
Default schema set to `payroll_service`.
Fetching table and column names from `payroll_service` for auto-completion... Press ^C to stop.
 MySQL  localhost:33060+ ssl  payroll_service  SQL > select * from employee_payroll
                                                  -> ;
+----+---------+-----------+------------+-------------+-----+---------+------------+
| id | name    | basic_pay | deductions | taxable_pay | tax | net_pay | start      |
+----+---------+-----------+------------+-------------+-----+---------+------------+
|  1 | shubham |     50000 |          0 |           0 |   0 |       0 | 2020-09-16 |
|  2 | anant   |     40000 |          0 |           0 |   0 |       0 | 2020-09-17 |
|  3 | tanmay  |     20200 |          0 |           0 |   0 |       0 | 2020-09-18 |
+----+---------+-----------+------------+-------------+-----+---------+------------+
3 rows in set (0.1332 sec)
 MySQL  localhost:33060+ ssl  payroll_service  SQL > select salary from employee_payroll where basic_pay = 50000;
ERROR: 1054: Unknown column 'salary' in 'field list'
 MySQL  localhost:33060+ ssl  payroll_service  SQL > select basic_pay from employee_payroll where name = 'shubham';
+-----------+
| basic_pay |
+-----------+
|     50000 |
+-----------+
1 row in set (0.0007 sec)
 MySQL  localhost:33060+ ssl  payroll_service  SQL > UPDATE employee_payroll set gender = 'M' where name = 'shubham' or name ='anant' or name ='tanmay';
ERROR: 1054: Unknown column 'gender' in 'field list'
 MySQL  localhost:33060+ ssl  payroll_service  SQL > DELETE FROM employee_payroll where name = 'tanmay';
Query OK, 1 row affected (0.6124 sec)
 MySQL  localhost:33060+ ssl  payroll_service  SQL > select * from employee_payroll;
+----+---------+-----------+------------+-------------+-----+---------+------------+
| id | name    | basic_pay | deductions | taxable_pay | tax | net_pay | start      |
+----+---------+-----------+------------+-------------+-----+---------+------------+
|  1 | shubham |     50000 |          0 |           0 |   0 |       0 | 2020-09-16 |
|  2 | anant   |     40000 |          0 |           0 |   0 |       0 | 2020-09-17 |
+----+---------+-----------+------------+-------------+-----+---------+------------+
2 rows in set (0.0304 sec)
 MySQL  localhost:33060+ ssl  payroll_service  SQL > INSERT INTO employee_payroll(name, basic_pay, start) VALUES('hazel',42000,'2020-08-02');
ERROR: 1364: Field 'deductions' doesn't have a default value
 MySQL  localhost:33060+ ssl  payroll_service  SQL > select * from employee_payroll
                                                  -> ;
+----+---------+-----------+------------+-------------+-----+---------+------------+
| id | name    | basic_pay | deductions | taxable_pay | tax | net_pay | start      |
+----+---------+-----------+------------+-------------+-----+---------+------------+
|  1 | shubham |     50000 |          0 |           0 |   0 |       0 | 2020-09-16 |
|  2 | anant   |     40000 |          0 |           0 |   0 |       0 | 2020-09-17 |
+----+---------+-----------+------------+-------------+-----+---------+------------+
2 rows in set (0.0006 sec)
 MySQL  localhost:33060+ ssl  payroll_service  SQL > INSERT INTO employee_payroll(name, basic_pay, deductions, start) VALUES('hazel',42000,0,'2020-08-02');
ERROR: 1364: Field 'taxable_pay' doesn't have a default value
 MySQL  localhost:33060+ ssl  payroll_service  SQL > INSERT INTO employee_payroll(name, basic_pay,deductions, taxable_pay,tax,net_pay, start) VALUES('hazel',42000,0,0,0,0,'2020-08-02');
Query OK, 1 row affected (0.1800 sec)
 MySQL  localhost:33060+ ssl  payroll_service  SQL > select * from employee_payroll;
+----+---------+-----------+------------+-------------+-----+---------+------------+
| id | name    | basic_pay | deductions | taxable_pay | tax | net_pay | start      |
+----+---------+-----------+------------+-------------+-----+---------+------------+
|  1 | shubham |     50000 |          0 |           0 |   0 |       0 | 2020-09-16 |
|  2 | anant   |     40000 |          0 |           0 |   0 |       0 | 2020-09-17 |
|  4 | hazel   |     42000 |          0 |           0 |   0 |       0 | 2020-08-02 |
+----+---------+-----------+------------+-------------+-----+---------+------------+
3 rows in set (0.0575 sec)
 MySQL  localhost:33060+ ssl  payroll_service  SQL > SELECT * from employee_payroll WHERE start BETWEEN CAST('2020-09-17' AS DATE) AND DATE(NOW());
+----+-------+-----------+------------+-------------+-----+---------+------------+
| id | name  | basic_pay | deductions | taxable_pay | tax | net_pay | start      |
+----+-------+-----------+------------+-------------+-----+---------+------------+
|  2 | anant |     40000 |          0 |           0 |   0 |       0 | 2020-09-17 |
+----+-------+-----------+------------+-------------+-----+---------+------------+
1 row in set (0.0447 sec)
 MySQL  localhost:33060+ ssl  payroll_service  SQL > ALTER TABLE employee_payroll ADD gender CHAR(1) AFTER name;
Query OK, 0 rows affected (5.2472 sec)

Records: 0  Duplicates: 0  Warnings: 0
 MySQL  localhost:33060+ ssl  payroll_service  SQL > UPDATE employee_payroll set gender = 'M' where name = 'shubham' or name = 'anant';
Query OK, 2 rows affected (0.1099 sec)

Rows matched: 2  Changed: 2  Warnings: 0
 MySQL  localhost:33060+ ssl  payroll_service  SQL > select * from employee_payroll;
+----+---------+--------+-----------+------------+-------------+-----+---------+------------+
| id | name    | gender | basic_pay | deductions | taxable_pay | tax | net_pay | start      |
+----+---------+--------+-----------+------------+-------------+-----+---------+------------+
|  1 | shubham | M      |     50000 |          0 |           0 |   0 |       0 | 2020-09-16 |
|  2 | anant   | M      |     40000 |          0 |           0 |   0 |       0 | 2020-09-17 |
|  4 | hazel   | NULL   |     42000 |          0 |           0 |   0 |       0 | 2020-08-02 |
+----+---------+--------+-----------+------------+-------------+-----+---------+------------+
3 rows in set (0.0007 sec)
 MySQL  localhost:33060+ ssl  payroll_service  SQL >  UPDATE employee_payroll set gender = 'F' where name = 'hazel';
Query OK, 1 row affected (0.0886 sec)

Rows matched: 1  Changed: 1  Warnings: 0
 MySQL  localhost:33060+ ssl  payroll_service  SQL > select * from employee_payroll;
+----+---------+--------+-----------+------------+-------------+-----+---------+------------+
| id | name    | gender | basic_pay | deductions | taxable_pay | tax | net_pay | start      |
+----+---------+--------+-----------+------------+-------------+-----+---------+------------+
|  1 | shubham | M      |     50000 |          0 |           0 |   0 |       0 | 2020-09-16 |
|  2 | anant   | M      |     40000 |          0 |           0 |   0 |       0 | 2020-09-17 |
|  4 | hazel   | F      |     42000 |          0 |           0 |   0 |       0 | 2020-08-02 |
+----+---------+--------+-----------+------------+-------------+-----+---------+------------+
3 rows in set (0.0008 sec)
 MySQL  localhost:33060+ ssl  payroll_service  SQL > SELECT SUM(basic_pay) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;
+----------------+
| SUM(basic_pay) |
+----------------+
|          42000 |
+----------------+
1 row in set (0.0009 sec)
 MySQL  localhost:33060+ ssl  payroll_service  SQL >  SELECT AVG(basic_pay) FROM employee_payroll WHERE gender = 'M' GROUP BY gender;
+----------------+
| AVG(basic_pay) |
+----------------+
|          45000 |
+----------------+
1 row in set (0.0350 sec)
 MySQL  localhost:33060+ ssl  payroll_service  SQL >