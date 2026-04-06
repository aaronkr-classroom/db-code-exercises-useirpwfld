Table UserAccount{
	user_id int [pk]
	email varchar
	password varchar
	created_at timestamp
}
Table Character{
	character_id int [pk]
	user_id int
	name varchar
	level int
	class varchar
}
Table Item{
	item_id int [pk]
	name varchar
	type varchar
}
Table Inventory{
	character_id int
	item_id int
	quantity int
	indexes{
		(character_id, item_id) [pk]
	}
}

ref. Inventory.character_id > Character.character_id
ref. Inventory.item_id > Item.item_id
ref. Character.user_id > UserAccount.user_id








