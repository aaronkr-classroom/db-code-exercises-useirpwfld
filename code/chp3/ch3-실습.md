온라인 쇼핑몰 

요구사항
고객 
1. 회원가입시 생년월일 정보를 입력해야 한다
2. 회원가입시 전화번호 인증을 해야 한다
3. 비밀번호는 10자리 이상이다
4. 마이페이지에서 프로필을 수정할 수 있다
5. 탈퇴시 1년후 정보를 삭제한다
관리자
1.상품의 가격, 이름, 사진을 삽입하여 쇼핑몰에 올릴수 있다
2.상품을 삭제할 수 있다
3.상품의 재고를 확인할 수 있다
4.상품을 구매한 고객의 배송지를 확인할 수 있다.
5.상품의 가격, 이름, 사진을 수정할 수 있다

/*
[Entities]
- costomer
- manager

[costomer Properties]
- id (TEXT)
- password (TEXT)
- phonenumber (INT)
- startdate (DATE)

[manager Properties]
-employee_id (INT)
-role (TEXT)
-password (TEXT)
*/

create table costomer(
  id varchar(20),
  password varchar(20),
  phonenumber int,
  startdate date
);
create table manager(
  employee_id int,
  role varchar(10),
  password varchar(10)
);

insert into costomer values ('qwtjwk', '1234', 01022222222, '1999-02-01');
insert into costomer values ('qwtjwk1', '1234', 01033333333, '1989-02-01');
insert into costomer values ('qwtjwk2', '1234', 01055555555, '1979-02-01');
insert into costomer values ('qwtjwk3', '1234', 01044444444, '1969-02-01');
insert into costomer values ('qwtjwk4', '1234', 01066666666, '1959-02-01');

insert into manager values (45, 'head', 'qweoi1pp');
insert into manager values (46, 'staff', 'qweoskfoskf');
insert into manager values (47, 'staff', 'qweouyiu');
insert into manager values (48, 'staff', 'qweowrwr');

select * from costomer order by startdate desc;

select * from manager order by employee_id;
