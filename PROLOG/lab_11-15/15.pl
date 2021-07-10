domains 
    price, value, house, appartment = integer
    surName, phone, colour, bank, account, city, street, propertyName = symbol
    adress = adress(city, street, house, appartment)

    %  domen sobstvennost
    property =   car(propertyName, price, colour);
            	ship(propertyName, price);
            	building(propertyName, price);
                     		sector(propertyName, price)
	
predicates
    owns(surName, property)
    owns(surName, name, price)
                count_sum(surName, price)

   phonebook (surName, phone, adress)
   invests(surName, bank,  symbol account, value)
	
clauses
    owns("Person1", car("Volvo", 123123123, "Black")).
    owns("Person1", ship("Ship", 45645645)).
    owns("Person1", building("House", 98765432)).
    owns("Person2", sector("Area", 876345765)).
    owns("Person3", car("BMW", 321321321, "Pink")).
    
    phonebook("Person1", "0-000-000-00-00",
 adress("London", "Baker", 14, 128)).
    phonebook("Person1", "0-000-000-00-00", 
adress("London", "Bakery", 1, 10)).
    phonebook("Person1", "1-111-111-11-11", 
adress("Samara", "superskaya", 14, 128)).
    phonebook("Person2", "2-222-222-22-22", 
adress("Moscow", "woy-street", 12, 153)).
    phonebook("Person3", "3-333-333-33-33", 
adress("Moscow", "superskaya", 1, 10)).
    phonebook("Person3", "4-444-444-44-44", 
adress("Samara", "Bakery", 1, 10)).
    invests("Person1", "Sberbank", "1111 1111 1111 1111 1111", 1500000).
    invests("Person1", "MoscowBank", "2222 2222 2222 2222 2222", 30000).
    invests("Person3", "Tinkoff", "3333 3333 3333 3333 3333", 4500000).
    invests("Person3", "VTB","4444 4444 4444 4444 4444", 10000).
    invests("Person4", "Sberbank", "5555 5555 5555 5555 5555", 400000).
    
    owns(SurName, Name, Price):- owns(SurName, car(Name, Price, _)).
    owns(SurName, Name, Price):- owns(SurName, ship(Name, Price)).
    owns(SurName, Name, Price):- owns(SurName, building(Name, Price)).
    owns(SurName, Name, Price):- owns(SurName, sector(Name, Price)).
 
    
    count_sum(SurName, Count_sum):- owns(SurName, Name, Price), 
                owns(SurName, Name1, Price1), 
                Name<>Name1,
                owns(SurName, Name2, Price2),
                Name<>Name2, 
                Name1<>Name2,
                owns(SurName, Name3, Price3),
                Name<>Name3, Name1<>Name3, Name2<>Name3,
                Count_sum=Price+Price1+Price2+Price3,!.
    
    count_sum(SurName, Count_sum):- owns(SurName, Name, Price), 
                owns(SurName, Name1, Price1), 
                Name<>Name1,
                owns(SurName, Name2, Price2),
                Name<>Name2, Name1<>Name2,
                Count_sum=Price+Price1+Price2,!.
    
    count_sum(SurName, Count_sum):- owns(SurName, Name, Price), 
                owns(SurName, Name1, Price1), 
                Name<>Name1,
                Count_sum=Price+Price1, !.
                
           count_sum(SurName, Count_sum):- owns(SurName, _, Price), Count_sum = Price, !.

goal
	owns(person("Name1", "SurName1"), Name, Price).
	%owns(«Person1», Name, _).

