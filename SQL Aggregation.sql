SQL Aggregation 



###################### Understand all about SQL a ggregation ########################

Input:

CREATE TABLE int_orders (
 order_number int] NOT NULL,
 order_date date] NOT NULL,
 cust_id int NOT NULL,
 salesperson_id int NOT NULL,
 amount float NOT NULL
) 
 
INSERT INTO int_orders (order_number], order_date], cust_id], salesperson_id], amount]) 
VALUES (30, CAST(N'1995-07-14' AS Date), 9, 1, 460)
INSERT int_orders (order_number], order_date], cust_id], salesperson_id], amount]) VALUES (10, CAST(N'1996-08-02' AS Date), 4, 2, 540)
INSERT dbo].int_orders] (order_number], order_date], cust_id], salesperson_id], amount]) VALUES (40, CAST(N'1998-01-29' AS Date), 7, 2, 2400)
INSERT dbo].int_orders] (order_number], order_date], cust_id], salesperson_id], amount]) VALUES (50, CAST(N'1998-02-03' AS Date), 6, 7, 600)
INSERT dbo].int_orders] (order_number], order_date], cust_id], salesperson_id], amount]) VALUES (60, CAST(N'1998-03-02' AS Date), 6, 7, 720)
INSERT dbo].int_orders] (order_number], order_date], cust_id], salesperson_id], amount]) VALUES (70, CAST(N'1998-05-06' AS Date), 9, 7, 150)
INSERT dbo].int_orders] (order_number], order_date], cust_id], salesperson_id], amount]) VALUES (20, CAST(N'1999-01-30' AS Date), 4, 8, 1800)
