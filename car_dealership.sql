CREATE TABLE "New Car" (
	"id" serial NOT NULL,
	"Make" varchar(255) NOT NULL,
	"Model" varchar(255) NOT NULL,
	"Year" integer NOT NULL,
	"Price" float4 NOT NULL,
	"Serial_number" integer NOT NULL,
	"Salesperson_id" integer NOT NULL,
	"Customer_id" integer NOT NULL,
	"Service_Dept_id" integer NOT NULL,
	"Mechanic_id" integer NOT NULL,
	"Part_id" integer NOT NULL,
	CONSTRAINT "New Car_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

INSERT INTO "New Car"(id, Make, Model, Year, Price, Serial_number, Salesperson_id, Customer_id, Service_Dept_id, Mechanic_id, Part_id)
VALUES(01, 'Ford', 'Fusion', 2021, 25,000, 514353146345, 001, 1500, 222, 949, 214324123),
	  (02, 'Chevy', 'Camaro', 2022, 35,000, 5143531513451351345, 002, 1500, 222, 949, 214324123),
      (03, 'Mazda', 'CX-5', 2022, 28,000, 514353151343463661345, 003, 1500, 222, 949, 214324123),
      (04, 'Toyota', 'Tacoma', 2021, 45,000, 514353123451345, 004, 1500, 222, 949, 214324123);
	  
	  
CREATE TABLE "Used Car" (
	"id" serial NOT NULL,
	"Make" varchar(255) NOT NULL,
	"Model" varchar(255) NOT NULL,
	"Year" integer NOT NULL,
	"Price" float4 NOT NULL,
	"Serial_number" integer NOT NULL,
	"Salesperson_id" integer NOT NULL,
	"Customer_id" integer NOT NULL,
	"Servie_Dept_id" integer NOT NULL,
	"Mechanic_id" integer NOT NULL,
	"Part_id" integer NOT NULL,
	CONSTRAINT "Used Car_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

INSERT INTO "New Car"(id, Make, Model, Year, Price, Serial_number, Salesperson_id, Customer_id, Service_Dept_id, Mechanic_id, Part_id)
VALUES(05, 'Ford', 'Fusion', 2016, 15,000, 514353333345, 001, 1500, 222, 949, 214324123),
	  (06, 'Chevy', 'Camaro', 2017, 25,000, 514353151666651345, 002, 1500, 222, 949, 214324123),
      (07, 'Mazda', 'CX-5', 2015, 18,000, 5143531513434665456345, 003, 1500, 222, 949, 214324123),
      (08, 'Toyota', 'Tacoma', 2014, 35,000, 51434443451345, 004, 1500, 222, 949, 214324123);
	  

CREATE TABLE "Service Dept" (
	"id" serial NOT NULL,
	"Service_Type" varchar(255) NOT NULL,
	"Length_of_Time" varchar(255) NOT NULL,
	"Price" float4 NOT NULL,
	"Invoice_id" integer,
	CONSTRAINT "Service Dept_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

INSERT INTO "Service Dept"(id, Service_Type, Length_of_Time, Price, Invoice_id)
VALUES(033, 'Radiator Replacement', 3.5, 250.00),
      (033, 'Flat Tire', 1.5, 50.00);


CREATE TABLE "Salesperson" (
	"id" serial NOT NULL,
	"Name" varchar(255) NOT NULL,
	CONSTRAINT "Salesperson_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

INSERT INTO "Salesperson"(id, Name)
VALUES(0033, 'Sue Smith')
      (0035, 'Sarah Hamilton');


CREATE TABLE "Customer" (
	"id" serial NOT NULL,
	"Name" varchar(255) NOT NULL,
	"Salesperson_id" integer NOT NULL,
	"Service_Dept_id" integer NOT NULL,
	CONSTRAINT "Customer_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

INSERT INTO "Customer"(id, Name, Salesperson_id, Service_Dept_id)
VALUES(990, 'Emily Black', 903, 23423),
      (945, 'Stephanie Sanders', 453, 23443);
	  
	  
CREATE TABLE "Invoice" (
	"id" serial NOT NULL,
	"Customer_id" integer NOT NULL,
	"New_car_id" integer NOT NULL,
	"Used_car_id" integer NOT NULL,
	"Salesperson_id" integer NOT NULL,
	CONSTRAINT "Invoice_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

INSERT INTO "Invoice"(id, Customer_id, New_car_id, Used_car_id, Salesperson_id)
VALUES(4323, 2341, 23546, 23233, 534345),
      (4553, 2333, 23511, 23333, 533345);


CREATE TABLE "Mechanic" (
	"id" serial NOT NULL,
	"Service_Type" varchar(255) NOT NULL,
	"Invoice_id" integer NOT NULL,
	CONSTRAINT "Mechanic_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

INSERT INTO "Mechanic"(id, Service_Type, Invoice_id)
VALUES(232, 'Radiator Replacement', 2342),
      (332, 'Flat Tire', 2355);
	  
	  
CREATE TABLE "Part" (
	"id" serial NOT NULL,
	"Cost" float4 NOT NULL,
	"Invoice_id" integer NOT NULL,
	"Mechanic_id" integer NOT NULL,
	"Customer_id" integer NOT NULL,
	CONSTRAINT "Part_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

INSERT INTO "Part"(id, Cost, Invoice_id, Mechanic_id, Customer_id)
VALUES(234, 2300, 664, 34, 098),
      (244, 200, 633, 36, 023);
	  
	  
	  
ALTER TABLE "New Car" ADD CONSTRAINT "New Car_fk0" FOREIGN KEY ("Serial_number") REFERENCES "Service Dept"("id");
ALTER TABLE "New Car" ADD CONSTRAINT "New Car_fk1" FOREIGN KEY ("Salesperson_id") REFERENCES "Salesperson"("id");
ALTER TABLE "New Car" ADD CONSTRAINT "New Car_fk2" FOREIGN KEY ("Customer_id") REFERENCES "Customer"("id");
ALTER TABLE "New Car" ADD CONSTRAINT "New Car_fk3" FOREIGN KEY ("Service_Dept_id") REFERENCES "Service Dept"("id");
ALTER TABLE "New Car" ADD CONSTRAINT "New Car_fk4" FOREIGN KEY ("Mechanic_id") REFERENCES "Mechanic"("id");
ALTER TABLE "New Car" ADD CONSTRAINT "New Car_fk5" FOREIGN KEY ("Part_id") REFERENCES "Part"("id");

ALTER TABLE "Used Car" ADD CONSTRAINT "Used Car_fk0" FOREIGN KEY ("Serial_number") REFERENCES "Service Dept"("id");
ALTER TABLE "Used Car" ADD CONSTRAINT "Used Car_fk1" FOREIGN KEY ("Salesperson_id") REFERENCES "Salesperson"("id");
ALTER TABLE "Used Car" ADD CONSTRAINT "Used Car_fk2" FOREIGN KEY ("Customer_id") REFERENCES "Customer"("id");
ALTER TABLE "Used Car" ADD CONSTRAINT "Used Car_fk3" FOREIGN KEY ("Servie_Dept_id") REFERENCES "Service Dept"("id");
ALTER TABLE "Used Car" ADD CONSTRAINT "Used Car_fk4" FOREIGN KEY ("Mechanic_id") REFERENCES "Mechanic"("id");
ALTER TABLE "Used Car" ADD CONSTRAINT "Used Car_fk5" FOREIGN KEY ("Part_id") REFERENCES "Part"("id");

ALTER TABLE "Service Dept" ADD CONSTRAINT "Service Dept_fk0" FOREIGN KEY ("Invoice_id") REFERENCES "Invoice"("id");


ALTER TABLE "Customer" ADD CONSTRAINT "Customer_fk0" FOREIGN KEY ("Salesperson_id") REFERENCES "Salesperson"("id");
ALTER TABLE "Customer" ADD CONSTRAINT "Customer_fk1" FOREIGN KEY ("Service_Dept_id") REFERENCES "Service Dept"("id");

ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_fk0" FOREIGN KEY ("Customer_id") REFERENCES "Customer"("id");
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_fk1" FOREIGN KEY ("New_car_id") REFERENCES "New Car"("id");
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_fk2" FOREIGN KEY ("Used_car_id") REFERENCES "Used Car"("id");
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_fk3" FOREIGN KEY ("Salesperson_id") REFERENCES "Salesperson"("id");

ALTER TABLE "Mechanic" ADD CONSTRAINT "Mechanic_fk0" FOREIGN KEY ("Invoice_id") REFERENCES "Invoice"("id");

ALTER TABLE "Part" ADD CONSTRAINT "Part_fk0" FOREIGN KEY ("Invoice_id") REFERENCES "Invoice"("id");
ALTER TABLE "Part" ADD CONSTRAINT "Part_fk1" FOREIGN KEY ("Mechanic_id") REFERENCES "Mechanic"("id");
ALTER TABLE "Part" ADD CONSTRAINT "Part_fk2" FOREIGN KEY ("Customer_id") REFERENCES "Customer"("id");













