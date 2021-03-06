CREATE TABLE "mechanic" (
  "mechanic_id" SERIAL,
  "first_name" VARCHAR(50),
  "last_name" VARCHAR(50),
  PRIMARY KEY ("mechanic_id")
);

CREATE TABLE "car" (
  "car_id" SERIAL,
  "car_make" VARCHAR(50),
  "car_model" VARCHAR(50),
  "car_year" INTEGER,
  "license_plate" VARCHAR(6),
  PRIMARY KEY ("car_id")
);

CREATE TABLE "customer" (
  "customer_id" SERIAL,
  "first_name" VARCHAR(50),
  "last_name" VARCHAR(50),
  "age" INTEGER,
  "address" VARCHAR(150),
  "email" VARCHAR(50),
  PRIMARY KEY ("customer_id")
);

CREATE TABLE "service_ticket" (
  "service_id" SERIAL,
  "customer_id" INTEGER,
  "car_id" INTEGER,
  "parts" VARCHAR(50),
  "service_amount" NUMERIC(6,2),
  "service_type" VARCHAR(50),
  PRIMARY KEY ("service_id"),
  CONSTRAINT "FK_service_ticket.car_id"
    FOREIGN KEY ("car_id")
      REFERENCES "car"("car_id"),
  CONSTRAINT "FK_service_ticket.customer_id"
    FOREIGN KEY ("customer_id")
      REFERENCES "customer"("customer_id")
);

CREATE TABLE "service_ticket_mechanic" (
  "service_mechanic_id" SERIAL,
  "service_id" INTEGER,
  "mechanic_id" INTEGER,
  PRIMARY KEY ("service_mechanic_id"),
  CONSTRAINT "FK_service_ticket_mechanic.mechanic_id"
    FOREIGN KEY ("mechanic_id")
      REFERENCES "mechanic"("mechanic_id"),
  CONSTRAINT "FK_service_ticket_mechanic.service_id"
    FOREIGN KEY ("service_id")
      REFERENCES "service_ticket"("service_id")
);

CREATE TABLE "salesperson" (
  "sales_id" SERIAL,
  "first_name" VARCHAR(50),
  "last_name" VARCHAR(50),
  PRIMARY KEY ("sales_id")
);

CREATE TABLE "invoice" (
  "invoice_id" SERIAL,
  "customer_id" INTEGER,
  "sales_id" INTEGER,
  "car_id" INTEGER,
  "invoice_amount" NUMERIC(8,2),
  "invoice_date" DATE,
  PRIMARY KEY ("invoice_id"),
  CONSTRAINT "FK_invoice.sales_id"
    FOREIGN KEY ("sales_id")
      REFERENCES "salesperson"("sales_id"),
  CONSTRAINT "FK_invoice.customer_id"
    FOREIGN KEY ("customer_id")
      REFERENCES "customer"("customer_id")
);


insert into customer(
	first_name,
	last_name,
	age,
	address,
	email
)
values(
	'david',
	'broadwater',
	31,
	'8 Spring Dr',
	'dhbroad@udel.edu'
),(
	'Christine',
	'Broadwater',
	29,
	'8 Spring Dr',
	'christine@christine.com'
);

insert into salesperson(
	first_name,
	last_name
)
values( 
	'Shoha',
	'Tsuchida'
),( 
	'Dylan',
	'Smith'
);


insert into car(
	car_make,
	car_model,
	car_year,
	license_plate
)
values(
	'Scion',
	'tC',
	'2012', 
	'12345b'
),(
	'Toyota', 
	'Camry', 
	'2015', 
	'lZBASb'
);

INSERT INTO mechanic(
	first_name,
	last_name
)
values(
	'Muffin', 
	'Man'
),(
	'King',
	'Kong'
);

SELECT *
FROM customer;

INSERT INTO invoice(
	customer_id,
	sales_id,
	car_id,
	invoice_amount,
	invoice_date
)
VALUES(
	1,
	1,
	1,
	20000.00,
	TO_DATE('03/06/2022', 'DD/MM/YYYY')
),(
	2,
	2,
	2,
	26000.00,
	TO_DATE('03/07/2022', 'DD/MM/YYYY')
);


INSERT INTO service_ticket(
	service_id,
	customer_id,
	car_id,
	parts,
	service_amount,
	service_type
)
VALUES ( 
	1,
	2,
	2,
	'Oil',
	0,
	'Oil Change'
),( 
	2,
	2,
	2,
	'Air Filter',
	0,
	'Filter Change'
)

INSERT INTO service_ticket_mechanic(
	service_id,
	mechanic_id
)
values
	(1,1),(2,2)
	


CREATE OR REPLACE FUNCTION complete_service( 
	service integer,
	complete_service_amount NUMERIC(6,2)
)
RETURNS void
AS $MAIN$
BEGIN 
	-- add value to service when complete
	UPDATE service_ticket 
	SET service_amount = complete_service_amount
	WHERE service_id = service;
END;
$MAIN$
LANGUAGE plpgsql;

DROP FUNCTION complete_service

select complete_service(1,30.00)

SELECT complete_service(2,25.00)

SELECT *
FROM service_ticket