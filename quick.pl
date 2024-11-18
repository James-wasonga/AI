go :- hypothesize(LivingThing),
      write('I guess that the book is: '),
      write(LivingThing),
      nl,
      undo.

hypothesize(novel):- novel,!.
hypothesize(journal):- journal,!.
hypothesize(fiction):- fiction,!.
hypothesize(nonfiction):- nonfiction,!.
hypothesize(unknown).

novel:-
        verify(less_pages),
        verify(use_for_eduction),
        verify(life_story).
        
journal:- 
        verify(medium_pages),
        verify(use_for_research),
        verify(succes_story).

fiction:-
        vefrify(more_than_medium),
        verify(normal_checks),
        verify(fiction_story).

nonfiction:-
        verify(many_pages),
        verify(base_check),
        verify(nonfiction_story).

ask(Question) :-
    write('Does the book have the following properties: '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail).

:- dynamic yes/1,no/1.

/* How to verify something */
verify(S) :-
   (yes(S) 
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(S))).
     

/* undo all yes/no assertions */
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail.
undo.


