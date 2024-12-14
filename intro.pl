male(amakalu).
male(muthungu).
male(mino).
male(oruko).
male(levi).
male(osama).
male(sang).
male(mike).
male(john).
male(samwel).
male(victor).
male(erick).
male(felix).

female(faith).
female(volka).
female(mercy).
female(joan).
female(fridah).
female(vivian).
female(samantha).
female(annette).
female(linet).
female(ruth).
female(jael).
female(nicol).
female(peres).

# father(sang,mino).
# father(sang,oruko).
# father(sang,osama).
# father(mino,muthungu).
# father(levi,annette). # the father to annette
# father(levi,osama). # the father to osama
# father(levi,mercy). # the father to mercy
# father(sang,samantha). # the father to samantha
# father(john,samwel).
# father(samwel,victor).
# father(victor,erick).
# father(erick,mike).
# father(muthungu,felix). 

# mother(faith,mino).
# mother(faith,oruko).
# mother(faith,osama).
# mother(annette,muthungu).
# mother(volka,annette). # the mother to annettte
# mother(volka,osama). # the mother to osama
# mother(volka,mercy). # the mother to mercy
# mother(faith, samantha). # the mother to samantha 
# mother(linet,samwel). 
# mother(ruth,victor). 
# mother(jael,erick). 
# mother(nicol,mike). 
# mother(peres,felix). 


parent(sang,mino).
parent(sang,oruko).
parent(sang,osama).
parent(mino,muthungu).
parent(levi,annette). # the father to annette
parent(levi,osama). # the father to osama
parent(levi,mercy). # the father to mercy
parent(sang,samantha). # the father to samantha
parent(john,samwel).
parent(samwel,victor).
parent(victor,erick).
parent(erick,mike).
parent(muthungu,felix). 

parent(faith,mino).
parent(faith,oruko).
parent(faith,osama).
parent(annette,muthungu).
parent(volka,annette). # the mother to annettte
parent(volka,osama). # the mother to osama
parent(volka,mercy). # the mother to mercy
parent(faith, samantha). # the mother to samantha 
parent(linet,samwel). 
parent(ruth,victor). 
parent(jael,erick). 
parent(nicol,mike). 
parent(peres,felix). 

brother(X,Y):-parent(Z,X),parent(Z,Y).
granddad(X,Y):- parent(X,Z), parent(Z,Y).
uncle(X,Y):-brother(X,Z), parent(Z,Y).
auntie(X,Y):-sister(X,Z), parent(Z,Y).
maternalgrandfather(X,Y):- parent(X,Z), parent(Z,Y).
maternalgrandmother(X,Y):- parent(X,Z), parent(Z,Y).
paternalgrandfather(X,Y):- parent(X,Z), parent(Z,Y).
paternalgrandmother(X,Y):- parent(X,Z), parent(Z,Y).
greatgrandfather(X,Y):- parent(X,Z), parent(Z,W), parent(W,Y).
greatgrandmother(X,Y):- parent(X,Z), parent(Z,W), parent(W,Y).
maternaluncle(X,Y):- brother(X,Z), parent(Z,Y).
paternaluncle(X,Y):- brother(X,Z), parent(Z,Y).
maternalauntie(X,Y):- sister(X,Z), parent(Z,Y).
paternalauntie(X,Y):- sister(X,Z), parent(Z,Y). 



create(Row,Column):-
Row >=0,
Row =< 7,
Column >= 0,
Column =< 7.  

attack((Row1,Column1),(Row2,Column2)):-
Row1 =:= Row2;
Column1 =:= Column2.
