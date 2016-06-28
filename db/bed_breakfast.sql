DROP TABLE bbs;

CREATE TABLE bbs (
  id serial4 primary key,
  first_name varchar(255),
  last_name varchar(255),
  length_of_stay int2,
  breakfast varchar(255),
  bedroom_type varchar(255),
  check_in varchar(255)
);