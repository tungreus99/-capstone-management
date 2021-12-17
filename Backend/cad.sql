use facilitiesbooking;
create table user_account
(
	id bigint AUTO_INCREMENT NOT NULL,
    email nvarchar(100) NOT NULL,
    fullname nvarchar(100),
    user_role nvarchar(7) NOT NULL,
    PRIMARY KEY(id)
);
create table club_detail
(
id bigint AUTO_INCREMENT NOT NULL,
club_name nvarchar(100),
PRIMARY KEY(id)
);
create table club_member
(
account_id bigint NOT NULL,
club_id bigint NOT NULL,
FOREIGN KEY(account_id) REFERENCES user_account(id),
FOREIGN KEY(club_id) REFERENCES club_detail(id)
);
create table event_detail
(
id bigint AUTO_INCREMENT NOT NULL,
event_name nvarchar(100),
from_date nvarchar(50),
to_date nvarchar(50),
PRIMARY KEY(id)
);
create table event_member
(
account_id bigint NOT NULL,
event_id bigint NOT NULL,
job_title nvarchar(20) NOT NULL,
FOREIGN KEY(account_id) REFERENCES user_account(id),
FOREIGN KEY(event_id) REFERENCES event_detail(id)
);
create table request
(
id bigint AUTO_INCREMENT NOT NULL,
account_id bigint NOT NULL,
date_created date,
date_modified date,
type_request nvarchar(50) NOT NULL,
note nvarchar(200),
request_status nvarchar(20) NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY(account_id) REFERENCES request(id)
);
create table facility
(
id bigint AUTO_INCREMENT NOT NULL,
facility_name nvarchar(20),
is_avalable boolean,
is_building boolean,
PRIMARY KEY(id)
);
create table request_detail
(
id bigint AUTO_INCREMENT NOT NULL,
request_id bigint NOT NULL,
facility_id bigint NOT NULL,
use_date nvarchar(20),
time_using nvarchar(10),
PRIMARY KEY(id),
FOREIGN KEY(request_id) REFERENCES request(id),
FOREIGN KEY(facility_id) REFERENCES facility(id)
);
create table request_log
(
id bigint AUTO_INCREMENT NOT NULL,
request_id bigint,
date_log nvarchar(20),
account_id bigint,
type_change nvarchar(10),
PRIMARY KEY(id),
FOREIGN KEY(request_id) REFERENCES request(id),
FOREIGN KEY(account_id) REFERENCES user_account(id)
);


