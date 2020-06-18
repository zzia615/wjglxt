create database wjglxt
go

use wjglxt
go

create table admin
(
name nvarchar(12) not null primary key,
pwd nvarchar(12) not null
)
go
insert into admin values('admin','123456')
go
create table fileinfo
(
name nvarchar(100) not null primary key,
url nvarchar(100) not null,
rq datetime default getdate(),
xzcs int default 0 not null
)
go

