
go :- hypothesize(Disease),
      write('I guess that the disease is: '),
      write(Disease),
      nl,
      undo.

hypothesize(malaria)	:-malaria,!.
hypothesize(cholera)	:-cholera,!.
hypothesize(bilharzia)	:-bilharzia,!.
hypothesize(typhoid)	:-typhoid,!.
hypothesize(corona)		:-corona,!.
hypothesize(tuberculosis)	:-tuberculosis,!.
hypothesize(dengue)     :-dengue,!.
hypothesize(hepatitis)  :-hepatitis,!.
hypothesize(measles)    :-measles,!.
hypothesize(ebola)      :-ebola,!.
hypothesize(rabies)     :-rabies,!.
hypothesize(asthma)     :-asthma,!.
hypothesize(appendicitis) :-appendicitis,!.
hypothesize(meningitis)  :-meningitis,!.
hypothesize(zika_virus) :- zika_virus,!.
hypothesize(scarlet_fever) :-scarlet_fever,!.
hypothesize(lyme_disease)  :-lyme_disease,!.
hypothesize(bronchitis)    :-bronchitis,!.
hypothesize(diabetes)      :-diabetes,!.
hypothesize(pneumonia)     :-pneumonia,!.
hypothesize(unknown).

malaria :-flu,
        cold,
        verify(fatigue),
		verify(rapid_breathing),
		verify(rapid_heart_rate),
		verify(general_feeling_of_discomfort),
		verify(headache),
		verify(nausea_and_vomiting), 
		verify(diarrhea),
		verify(abdominal_pain), 
		verify(muscle_or_joint).   		
			
cholera	:- 	verify(diarrhea),
		verify(nausea_and_vomiting),
		verify(dehydration).
			
			
bilharzia:-	verify(nausea_and_vomiting),
		verify(diarrhea),
		verify(abdominal_pain),
		verify(muscle_or_joint_pain),
		verify(rapid_heart_rate).

typhoid:-	verify(fever_that_starts_low_and_increases_daily),
		verify(headache),
		verify(weakness_and_fatigue),
		verify(muscle_aches),
		verify(sweating),
		verify(dry_cough),
		verify(loss_of_appetite_and_weight_loss),
		verify(stomach_pain),
		verify(diarrhea_or_constipation),
		verify(rash),
		verify(extremely_swollen_stomach).

tuberculosis:-	verify(coughing_for_three_or_more_weeks),
		verify(coughing_up_blood_or_mucus),
		verify(chest_pain_or_pain_with_breathing_or_coughing),
		verify(unintentional_weight_loss),
		verify(fatigue),
		verify(fever),
		verify(night_sweats),
		verify(chills),
		verify(loss_of_appetite).
        
corona :-	flu,
        cold,
		verify(tiredness),
		verify(shortness_of_breath_or_difficulty_breathing),
		verify(muscle_aches),
		verify(do_you_have_chills),
		verify(runny_nose),
		verify(headache),
		verify(chest_pain),
		verify(pink_eye_conjunctivitis),   
		verify(nausea_and_Vomiting),
		verify(diarrhea),
		verify(rash).

dengue :- verify(high_fever),
        verify(severe_headache),
        verify(pain_behind_eye),
        verify(muscle_or_joint_pain),
        verify(fatigue),
        verify(skin_rash),
        verify(mild_bleeding).

hepatitis :- verify(fatigue),
            verify(nausea),
            verify(fever),
            verify(dark_urine),
            verify(jaundice).

measles :- verify(fever),
            verify(cough),
            verify(runny_nose),
            verify(skin_rash).
    
ebola   :- verify(fever),
            verify(severe_headache),
            verify(muscle_pain),
            verify(weakness),
            verify(fatigue),
            verify(abdominal_pain).

rabies  :- verify(fever),
            verify(headache),
            verify(excess_salivation),
            verify(muscle_spasms),
            verify(paralysis),
            verify(menatal_confusion).

lyme_disease  :- verify(rash),
                  verify(fever),
                  verify(fatigue),
                  verify(headache),
                  verify(joint_pain).

scarlet_fever :- verify(sore_throat),
                  verify(rash),
                  verify(headache),
                  verify(flushed_face).

zika_virus  :- verify(fever),
                verify(rash),
                verify(joint_pain),
                verify(red_eyes).

meningitis  :- verify(fever),
                verify(stiff_neck),
                verify(nausea),
                verify(vomiting),
                verify(headache),
                verify(sensitivity_to_light).

appendicitis :- verify(abdominal_pain),
                verify(loss_of_appetite),
                verify(nausea_and_vomiting),
                verify(fever).

asthma  :- verify(shortness_of_breath),
            verify(chest_tightness),
            verify(coughing),
            verify(wheeling).

bronchitis  :- verify(cough),
                verify(muscles_production),
                verify(fatigue),
                verify(shortness_of_breath).


diabetes    :- verify(increased_thirst),
                verify(blurred_vision),
                verify(frequent_urination),
                verify(unexpected_weighloss).

pneumonia   :- verify(chest_pain),
                verify(fever),
                verify(fatigue),
                verify(shortnes_of_breathe_breath).
		   	   
flu:-	verify(sore_throat),
		verify(cough),
		verify(fever),
		verify(headache),
		verify(shortnes_of_breathe).


cold:-     verify(cough),
		   verify(sneezing).




/* how to ask questions */
ask(Question) :-
    write('Do you have the following signs and symptoms: '),
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
