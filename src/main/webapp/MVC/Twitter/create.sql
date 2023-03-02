drop sequence twitter_seq;
drop table twitter;
drop table twitter_login;

create table twitter_login (
	id 		varchar2(20) constraint twitter_login_id_pk primary key
,	psswd 	varchar2(20) constraint twitter_login_passwd_nn not null
,	name	 	varchar2(15) constraint twitter_login_name_nn not null
);

insert into twitter_login
values('longlee', '6789', '이성구');

insert into twitter_login
values('gdhong', '1234', '홍길동');

insert into twitter_login
values('yakim', '4567', '김연아');

commit;

select * from twitter_login;

create table twitter(
	no		 number(7)	 	constraint 	twitter_no_pk 	primary  key
,	id 		 varchar2(20) 	constraint 	twitter_id_fk 	references 	twitter_login (id)
,	message 	 varchar2(300) 	constraint 	twitter_message_nn  not null
,	create_date  date  		default  sysdate
);

create sequence twitter_seq
 	start with 1
 	increment by 1
 	maxvalue 9999999
 	nocycle;

insert into twitter (no,id,message)
values(twitter_seq.nextval,'longlee','첫 번째 트윗입니다');

insert into twitter (no,id,message)
values(twitter_seq.nextval,'gdhong','두 번째 트윗입니다');

commit;

select * from twitter;

select twitter.id || '@' || name as id_name, message, create_date, to_char(create_date, 'YYYY/MM/DD HH24:MI:SS') as cdatedtime
from twitter inner join twitter_login
  on twitter.id = twitter_login.id;