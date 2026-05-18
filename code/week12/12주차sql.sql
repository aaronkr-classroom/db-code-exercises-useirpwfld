select user_level from users;

-- check 유저 벨은 1~100만 가능
alter table users add constraint chk_user_level check (user_level >= 1 and user_level <= 100);

update users set user_level = 1010 where user_id =1;

-- 접속 상태는 online 또는 offline만 가능하다
alter table users add constraint chk_user_status check (status in ('online','connecting','offline'));

update users set status ='sleeping' where user_id = 2;

-- 아이템 가격은 0원 이상이어야 한다
alter table items add constraint chk_items_price check(price >= 0);

update items set price = -1 where item_id = 1001;

-- 아이템 등급을 정해진 값만 가능하다 (S,A,B,C,D,E,F)
alter table items add constraint chk_items_grade check (grade in ('S','A','B','C','D','E','F'));

update items set grade = '1' where item_id = 1001;

-- 닉네임은 중복되면 안된다 
table users;
alter table users add constraint uq_user_nickname unique (nickname);
insert into users values (6,'홍길동','DragonKing',10,'2026-05-18','home@home.com','offline');


select constraint_name, table_name from information_schema.table_constraints where constraint_type = 'FOREIGN KEY' and table_name = 'plays';

select constraint_name, table_name from information_schema.table_constraints where constraint_type = 'FOREIGN KEY' and table_name = 'user_items';

alter table plays drop constraint plays_user_id_fkey;
alter table plays drop constraint plays_game_id_fkey;
alter table user_items drop constraint user_items_user_id_fkey;
alter table user_items drop constraint user_items_item_id_fkey;

-- 새 FK 추가
-- 유저가 삭제되면 플레이 기록도 삭제되게 하기

alter table plays add constraint fk_plays_users foreign key (user_id) references users(user_id) on delete cascade;

-- 게임은 플레이 기록이 있으면 삭제하지 못하게 하기
alter table plays add constraint fk_plays_games foreign key (game_id) references games(game_id) on delete restrict;

-- 유저가 삭제되면 보유 아이템 기록도 삭제되게 하기
alter table user_items add constraint fk_user_items_usres foreign key (user_id) references users(user_id) on delete cascade;

-- 아이템 누군가 보유 중이면 삭제하지 못하게 하기
alter table user_items add constraint fk_user_items_items foreign key (item_id) references items(item_id) on delete restrict;

select * from plays where user_id=1;
select * from user_items where user_id = 1;
delete from users where user_id =1;

delete from games where game_id=101;
delete from items where item_id=1004;





