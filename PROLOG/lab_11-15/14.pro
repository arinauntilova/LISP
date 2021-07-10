domains
	lastname = symbol
	
	% person
	phoneNum = symbol
	address = address(symbol city, symbol street, integer house, integer apNum)
	city = symbol
	street = symbol
	
	% car
	model = symbol
	color = symbol
	price = real
		
	% deposit
	bank = symbol
	account = symbol
	amount = real	

predicates
	person(lastname, phoneNum, address)
	car(lastname, model, color, price)
	deposit(lastname, bank, account, amount)

	% Rules
	find(model, color, lastname, city, phoneNum, bank) 

clauses
	person(untilova, "89036609896", address(moscow, izmailovo, 15, 22)).
	person(petrov, "89068887745", address(moscow, izmailovo, 14, 24)).
	person(petrov, "89068886695", address(vologda, vetrovaya, 1, 86)).
	person(sidorov, "89068887745", address(moscow, lubanka, 36, 78)).
	person(nikolaeva, "89068880045", address(ryazan, lenina, 13, 2)).
	person(vetrov, "89266740121", address(tver, pushkina, 23, 12)).
	
	car(untilova, toyota, white, 14000).
	car(untilova, mercedes, black, 40000).
	car(petrov, kia, red, 45000).
	car(vetrov, toyota, white, 30000).
	car(nikolaeva, mercedes, blue,  33000).
	
	deposit(untilova, alphabank, "123456789", 12345).
	deposit(untilova, sberbank, "326856789", 15000).
	deposit(nikolaeva, sberbank, "326556000", 10000).
	deposit(vetrov, vostochnii, "782334082", 12000).
	
	% Rules
	find(Model, Color, Lastname, City, PhoneNum, Bank) :- car(Lastname, Model, Color, _),
						   person(Lastname, PhoneNum, address(City, _, _, _)),
						   deposit(Lastname, Bank, _, _).
goal
% 1
 %find(toyota, white, Lastname, City, PhoneNum, Bank).

% 2
% find(mercedes, blue, Lastname, City, PhoneNum, Bank).

% 3
find(kia, yellow , Lastname, City, PhoneNum, Bank).
