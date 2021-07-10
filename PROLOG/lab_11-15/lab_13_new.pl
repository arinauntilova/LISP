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
	viewCar(phoneNum, lastname, model, price)
	viewModel(phoneNum, model)
	viewData(lastname, city, street, bank, phoneNum)

clauses
	person(untilova, "89036609896", address(moscow, izmailovo, 15, 22)).
	person(untilova, "89851101112", address(ryazan, soltsevo, 13, 14)).
	person(petrov, "89068887745", address(moscow, izmailovo, 14, 24)).
	person(petrov, "89068886695", address(vologda, vetrovaya, 1, 86)).
	person(sidorov, "89068887745", address(moscow, lubanka, 36, 78)).
	person(nikolaeva, "89068880045", address(ryazan, lenina, 13, 2)).
	
	car(untilova, toyota, white, 14000).
	car(untilova, mercedes, black, 40000).
	car(petrov, renault, black, 45000).
	car(vetrov, toyota, red, 30000).
	
	deposit(untilova, alphabank, "123456789", 12345).
	deposit(untilova, sberbank, "326856789", 15000).
	deposit(petrov, alphabank, "123456000", 45678).
	deposit(nikolaeva, sberbank, "326556000", 10000).

	% Rules
	viewCar(PhoneNum, Lastname, Model, Price) :- person(Lastname, PhoneNum, _),
									 car(Lastname, Model, _, Price).

	viewModel(PhoneNum, Model) :- viewCar(PhoneNum, _, Model, _).

	viewData(Lastname, City, Street, Bank, PhoneNum) :- person(Lastname, PhoneNum, address(City, Street, _, _)),
										  deposit(Lastname, Bank, _, _).
goal
	% Task 1.a
	 viewCar("89036609896", Lastname_t, Model_t, Price_t).
	% Task 1.b
	% viewModel("89036609896", Model).
	% Task 2
	% viewData(untilova, moscow, Street, Bank, PhoneNum).