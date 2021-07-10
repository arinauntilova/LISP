domains
	surname = symbol.
	phone_num = symbol.
	city = symbol.
	street = symbol.
	brand = symbol.
	color =  symbol.
	bank = symbol.
	name = symbol.
	house = integer.
	flat = integer.
	cost = integer.
	bank_account = integer.
	sum = integer.
	address = address(city, street, house, flat).
	
	property = car(name, color, cost);
	 	       building(name, cost, address);
		       place(name, cost, address);
		       water_transport(name, cost).	
	
predicates
	person(surname, phone_num, address).
	depositor(surname, bank, bank_account, sum, city).

	owns(surname, property).
	owned(surname, name, cost).
	
clauses
	owns("Vetrova", car("car BMW", "black", 7320000)).
	owns("Vetrova", building("building House", 3000000, address("Tver", "Pushkina street", 19, 128))).
	owns("Vetrova", place("place Green place", 150000, address("Tver", "Pushkina street", 20, 8))).
	owns("Vetrova", water_transport("water transport yacht", 1000000)).
	
	owns("Perov", car("car KIA", "white", 829900)).
	owns("Perov", building("building Hotel", 13000000, address("Moscow", "Lenina street", 55, 41))).
	
	owned(Surname, Name, Cost) :- owns(Surname, car(Name, _, Cost)).
	owned(Surname, Name, Cost) :- owns(Surname, building(Name, Cost, _)).
	owned(Surname, Name, Cost) :- owns(Surname, place(Name, Cost, _)).
	owned(Surname, Name, Cost) :- owns(Surname, water_transport(Name, Cost)).

	person("Vetrova", "89876741323", address("Tver", "Pushkina street", 19, 128)).
	person("Perov", "89871260543", address("Moscow", "Lenina street", 50, 43)).

	depositor("Vetrova", "Sberbank", 12345, 1000000, "Tver").
	depositor("Perov", "Sberbank", 55555, 30000000, "Moscow").
	
goal
	owned("Vetrova", NameQ, _).
	%owned("Perov", NameQ, CostQ).
