



go:- hypothesize(LivingThing),
    write("The living thing is : "),
    write(LivingThing),
    nl,
    undo.

hypothesize(human)  :-human,!.
hypothesize(dog)    :-dog,!.
hypothesize(cat)    :-cat,!.
hypothesize(eagle)  :-eagle,!.
hypothesize(salmon) :-salmon,!.
hypothesize(cow)    :-cow,!.
hypothesize(snake)  :-snake,!.
hypothesize(frog)   :-frog,!.
hypothesize(rose)   :-rose,!.
hypothesize(sunflower)  :-sunflower,!.
hypothesize(fern)   :-fern,!.
hypothesize(cactus) :-cactus,!.
hypothesize(moss)   :-moss,!.
hypothesize(maize)  :-maize,!.
hypothesize(bean)   :-bean,!.
hypothesize(unknown).

human :-
        animal,
        verify(walks_upright),
        verify(speaks),
        verify(thinks).

dog :-
        animal,
        verify(furs),
        verify(four_limbs),
        verify(barks),
        verify(is_domesticated).

cat :-
        animal,
        verify(furs),
        verify(four_limbs),
        verify(meows),
        verify(is_domesticated).

eagle :-
        animal,
            verify(feathers),
            verify(sharp_beak),
            verify(flies).

cow :-
        animal,
        verify(four_limbs),
        verify(produces_milk),
        verify(horns).
    
salmon  :-
        animal,
            verify(is_fish),
            verify(scales),
            verify(lives_in_water).

snake  :-
        animal,
        verify(scales),
        verify(is_reptile),
        verify(crawls).

frog  :-
        animal,
        verify(lives_in_water),
        verify(jumps),
        verify(croaks),
        verify(is_amphibian).

rose  :-
        plant,
        verify(produce_flowers),
        verify(thorns).

sunflower :-
           plant,
            verify(produce_oil),
            verify(large_flowers).

fern :-
        plant,
        verify(non_flowering),
        verify(reproduces_by_spores).

cactus :-
        plant,
        verify(thorns),
        verify(grows_in_desert),
        verify(stores_water).

moss   :-
        plant,
        verify(small_size),
        verify(lacks_roots),
        verify(grows_in_shady_places).

maize :-
        plant,
        verify(produces_corns),
        verify(prop_roots).

beans :-plant,
        verify(has_flowers),
        verify(produces_bean_seed),
        verify(tap_root).


# common properties

animal :- 
          verify(is_multicellular),
          verify(is_heterotrophic),
          verify(has_movement).

plant :- 
         verify(is_autotrophic),
         verify(is_multicellular),
         verify(does_not_move).

ask(Question) :-
    write('Does the living thing has the following characteristics: '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ((Response == yes ; Response == y) 
    -> 
      assert(yes(Question)) ;
      assert(no(Question)), fail).

:- dynamic yes/1, no/1.

verify(S) :-
    (yes(S)
    ->true;
    (no(S)
    ->fail ;
    ask(S))).
    
undo :- retract(yes(_)), fail.
undo :- retract(no(_)), fail.
undo.