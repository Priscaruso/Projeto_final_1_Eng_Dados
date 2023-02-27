COPY categories
FROM 's3://projeto1-eng-dados-udemy/input/categories.csv' 
CREDENTIALS 'aws_access_key_id=??????;aws_secret_access_key=????????' 
delimiter ';' 
region 'us-west-2'
IGNOREHEADER 1
DATEFORMAT AS 'YYYY-MM-DD HH:MI:SS'
removequotes;

COPY customers
FROM 's3://projeto1-eng-dados-udemy/input/customers.csv' 
CREDENTIALS 'aws_access_key_id=???????;aws_secret_access_key=???????' 
delimiter ';' 
region 'us-west-2'
IGNOREHEADER 1
DATEFORMAT AS 'YYYY-MM-DD HH:MI:SS'
removequotes;

COPY employees
FROM 's3://projeto1-eng-dados-udemy/input/employees.csv' 
CREDENTIALS 'aws_access_key_id=AKIAQ4RUE4CP7USFIOPM;aws_secret_access_key=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' 
delimiter ';' 
region 'us-west-2'
IGNOREHEADER 1
DATEFORMAT AS 'YYYY-MM-DD HH:MI:SS'
removequotes;

COPY order_details
FROM 's3://projeto1-eng-dados-udemy/input/orderdetails.csv' 
CREDENTIALS 'aws_access_key_id=AKIAQ4RUE4CP7USFIOPM;aws_secret_access_key=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' 
delimiter ';' 
region 'us-west-2'
IGNOREHEADER 1
DATEFORMAT AS 'YYYY-MM-DD HH:MI:SS'
removequotes;

COPY orders
FROM 's3://projeto1-eng-dados-udemy/input/orders.csv' 
CREDENTIALS 'aws_access_key_id=AKIAQ4RUE4CP7USFIOPM;aws_secret_access_key=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' 
delimiter ';' 
region 'us-west-2'
IGNOREHEADER 1
DATEFORMAT AS 'YYYY-MM-DD HH:MI:SS'
removequotes;

COPY products
FROM 's3://projeto1-eng-dados-udemy/input/products.csv' 
CREDENTIALS 'aws_access_key_id=AKIAQ4RUE4CP7USFIOPM;aws_secret_access_key=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' 
delimiter ';' 
region 'us-west-2'
IGNOREHEADER 1
DATEFORMAT AS 'YYYY-MM-DD HH:MI:SS'
removequotes;

COPY shippers
FROM 's3://projeto1-eng-dados-udemy/input/shippers.csv' 
CREDENTIALS 'aws_access_key_id=AKIAQ4RUE4CP7USFIOPM;aws_secret_access_key=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' 
delimiter ';' 
region 'us-west-2'
IGNOREHEADER 1
DATEFORMAT AS 'YYYY-MM-DD HH:MI:SS'
removequotes;

COPY suppliers
FROM 's3://projeto1-eng-dados-udemy/input/suppliers.csv' 
CREDENTIALS 'aws_access_key_id=AKIAQ4RUE4CP7USFIOPM;aws_secret_access_key=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' 
delimiter ';' 
region 'us-west-2'
IGNOREHEADER 1
DATEFORMAT AS 'YYYY-MM-DD HH:MI:SS'
removequotes;