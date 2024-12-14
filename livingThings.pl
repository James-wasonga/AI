go:- 
    hypothesize(LivingThing),
    write("The living thing is: "),
    write(LivingThing),
    nl,
    undo.


hypothesize(human)  :- human, !.
hypothesize(dog)    :- dog, !.
hypothesize(cat)    :- cat, !.
hypothesize(rabbit) :- rabbit, !.
hypothesize(eagle)  :- eagle, !.
hypothesize(shark)  :-shark, !.
hypothesize(salmon) :- salmon, !.
hypothesize(cow)    :- cow, !.
hypothesize(pig)   :- pig, !.
hypothesize(snake)  :- snake, !.
hypothesize(frog)   :- frog, !.
hypothesize(rose)   :- rose, !.
hypothesize(sunflower) :- sunflower, !.
hypothesize(fern)   :- fern, !.
hypothesize(cactus) :- cactus, !.
hypothesize(moss)   :- moss, !.
hypothesize(maize)  :- maize, !.
hypothesize(bean)   :- bean, !.
hypothesize(rice)   :- rice, !.
hypothesize(jacaranda)  :-jacaranda, !.
hypothesize(unknown).  


human :- 
    animal,
    verify(walks_upright),
    verify(speaks),
    verify(high_think_capacity).

dog :- 
    animal,
    verify(has_furs),
    verify(four_limbs),
    verify(barks),
    verify(is_domesticated).

cat :- 
    animal,
    verify(has_furs),
    verify(four_limbs),
    verify(meows),
    verify(is_domesticated).

rabbit :-
        animal,
        verify(has_furs),
        verify(short_tail), 
        verify(long_ears),
        verify(four_limbs),
        verify(two_peg_teeths).


eagle :- 
    animal,
    verify(feathers),
    verify(sharp_beak),
    verify(flies).

cow :- 
    animal,
    verify(has_furs)
    verify(four_limbs),
    verify(produces_milk),
    verify(horns).

pig :-
    animal,
    verify(has_furs),
    verify(four_limbs),
    verify(no_skin).

shark :-
        animal,
        verify(is_fish),
        verify(good_eyesight),
        verify(has_no_bone).

salmon :- 
    animal,
    verify(is_fish),
    verify(scales),
    verify(lives_in_water).

snake :- 
    animal,
    verify(scales),
    verify(is_reptile),
    verify(crawls).

frog :- 
    animal,
    verify(lives_in_water),
    verify(jumps),
    verify(croaks),
    verify(is_amphibian).


rose :- 
    plant,
    verify(produces_flowers),
    verify(thorns).
    verify(network_leaf_veins).

sunflower :- 
    plant,
    verify(has_flowers).
    verify(produces_oil),
    verify(network_leaf_veins).

fern :- 
    plant,
    verify(non_flowering),
    verify(reproduces_by_spores).
    verify(network_leaf_veins).

cactus :- 
    plant,
    verify(thorns),
    verify(grows_in_desert),
    verify(stores_water).
    verify(waxy_leaves).

moss :- 
    plant,
    verify(small_size),
    verify(lacks_roots),
    verify(grows_in_shady_places).

maize :- 
    plant,
    verify(has_flowers),
    verify(produces_corns),
    verify(prop_roots).
    verify(parallel_leaf_veins).

bean :- 
    plant,
    verify(has_flowers),
    verify(produces_bean_seed),
    verify(network_leaf_veins).
    verify(tap_root).

jacaranda :-
    plant,
    verify(has_flowers),
    verify(green),
    verify(network_leaf_veins).

rice :-
    plant,
    verify(green),
    verify(parallel_leaf_veins),
    verify(loves_floddy).

animal :- 
    verify(is_multicellular),
    verify(is_heterotrophic),
    verify(has_movement).

plant :- 
    verify(is_autotrophic),
    verify(is_multicellular),
    verify(does_not_move).


ask(Question) :- 
    write('Does the living thing have the following characteristic: '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ((Response == yes ; Response == y) 
    -> assert(yes(Question)) ;
       assert(no(Question)), fail).

:- dynamic yes/1, no/1.


verify(S) :- 
    (yes(S) 
    -> true ; 
    (no(S) 
    -> fail ; 
    ask(S))).


undo :- retract(yes(_)), fail.
undo :- retract(no(_)), fail.
undo.