create table board(
    num number primary key,
    id varchar2(20) not null,
    name varchar2(20) not null,
    subject varchar2(100) not null,
    content varchar2(100),
    hit number,
    ip varchar2(20),
    regist_day date default sysdate,
    update_day date default sysdate
);
create SEQUENCE num nocycle nocache;
drop SEQUENCE num;

insert into board values(num.nextval, 'pretty', '손예진', '배송언제옴?','주문한지 일주일이 지났는대 배송이 안옴', 1, '128.120.190.2', sysdate, sysdate);

select * from board;

drop table board;
rollback;
commit;
