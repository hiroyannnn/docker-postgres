CREATE TABLE population
(
  populationId INT NOT NULL PRIMARY KEY,
  category varchar(50),
  area_code varchar(50),
  area_detail_code varchar(50),
  pop_total INT,
  pop_m INT,
  pop_f INT,
  pop_r DECIMAL,
  house_holds_total INT,
  house_holds INT,
  col2 INT,
  col3 INT,
  col4 INT,
  col5 INT
);

COPY population FROM '/data/pop.csv'
with CSV;

CREATE TABLE address
(
  area_code varchar(50),
  area_detail_code varchar(50),
  address_name varchar(50)
);

COPY address FROM '/data/address.csv'
with CSV;

CREATE TABLE code
(
  area_code varchar(50),
  area_detail_code varchar(50)
);
COPY code FROM '/data/code.csv'
with CSV;

CREATE TABLE work
(
  workId INT NOT NULL PRIMARY KEY,
  -- primary key column
  area_code varchar(50),
  area_detail_code varchar(50),
  worker_ratio DECIMAL
);
COPY work FROM '/data/work.csv'
with CSV;

CREATE INDEX area_code_code_idx ON code (area_code);
CREATE INDEX area_detail_code_code_idx ON code (area_detail_code);
CREATE INDEX area_code_area_detail_code_code_idx ON code (area_code,area_detail_code);
CREATE INDEX pop_total_population_idx ON population (pop_total);
CREATE INDEX worker_ratio_work_idx ON work (worker_ratio);

CREATE INDEX address_name_address_idx ON address (address_name);

CREATE INDEX area_detail_code_work_idx ON work (area_detail_code);
CREATE INDEX area_detail_code_address_idx ON address (area_detail_code);
