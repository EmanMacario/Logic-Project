
/* game-of-thrones-2.pl */

/* usage for parent/2: */
/* parent(X,Y) means child X has parent Y, or a parent of X is Y. */

grandparent(X,Y) 	:- parent(X,Z), parent(Z,Y).
mother(X,Y)			:- parent(X,Y), female(Y).
son(X,Y)			:- parent(X,Y), male(X).         /* Swapped X and Y, now different to original version */
daughter(X,Y)		:- parent(X,Y), female(X).       /* Did same thing for daughter predicate */
ancestor(X,Y)		:- parent(X,Y).
ancestor(X,Y)		:- parent(X,Z), ancestor(Z,Y).

/* Assignment Questions */
/* Question */
/* Part 1 */
is_a_mother(X)      :- female(X), parent(_,X).

/* Part 2 */
grandfather(X, Y)   :- parent(X,Z), parent(Z,Y), male(Y).

/* Part 3 */
sisters(X,Y)        :- female(X), female(Y), parent(X,Z), 
                       parent(Y,Z), X\=Y.

/* Part 4 */
/* Alo's answer: 
brother(X,Y)		:- male(Y), parent(X, Z), parent(Y, Z), Y\=X.
uncle(X, Y)         :- parent(X, Z),brother(Z, Y).
*/

/* Eman's answer: */
uncle(X,Y)          :- male(Y), parent(X,Z), parent(Z,W), parent(Y,W),
    				   Y\=Z.

/* Part 5 */
/* Alo's answer: 
paternal_great_uncle(X,Y)	:- grandfather(X,Z), brother(Z,Y), Z\=Y.
*/

/* Eman's answer: */
paternal_great_uncle(X,Y)   :- parent(X,Z), male(Z), parent(Z,W),
    						   male(W), uncle(Z,Y), Y\=W.

/* Part 6 - 
 * 
 * This one is wrong 
male_descendant(X,Y)        :- male(X), male(Y), X\=Y, son(Y,X).
male_descendant(X,Y)        :- son(Z,X), male_descendant(Z,Y).
*/

/* Not sure if this one is right */
male_descendant(X,Y) :- male(X), X\=Y, son(Y,X).
male_descendant(X,Y) :- male(X), X\=Y, son(Z,X), male_descendant(Z,Y). 


/* Question 2 */
/* Part 1 
    uncle(A1, benjen_stark), uncle(A2, benjen_stark), A1\=A2.
 * Part 2
  	son(red_walder_frey, P), son(A1, P), son(A2, P), son(A3, P),
    A1\=A2, A1\=A3, A2\=A3.
 * Part 3
    paternal_great_uncle(A1, kevan_lannister).
 * Part 4
    female(A1), ancestor(A1, tywin_lannister).
 */

/* facts from the family tree of the Stark family */
parent(rickard_stark,		edwyle_stark).
parent(brandon_stark_snr,	rickard_stark).
parent(ned_stark,		rickard_stark).		/* ned = eddard */ 
parent(benjen_stark,		rickard_stark).
parent(lyanna_stark,		rickard_stark).
parent(jon_snow,		ned_stark).
parent(rob_stark,		ned_stark).
parent(sansa_stark,		ned_stark).
parent(arya_stark,		ned_stark).
parent(bran_stark,		ned_stark).		/* bran = brandon jnr */ 
parent(rickon_stark,		ned_stark).		
parent(rob_stark,		catelyn_tully).
parent(sansa_stark,		catelyn_tully).
parent(arya_stark,		catelyn_tully).
parent(bran_stark,		catelyn_tully).
parent(rickon_stark,		catelyn_tully).

/* facts from the family tree of the Lannister family */
parent(tywin_lannister,		tytos_lannister).
parent(kevan_lannister,		tytos_lannister).
parent(tygett_lannister,	tytos_lannister).
parent(gerion_lannister,	tytos_lannister).
parent(genna_lannister,		tytos_lannister).
parent(cersei_lannister,	tywin_lannister).
parent(jaime_lannister,		tywin_lannister).
parent(tyrion_lannister,	tywin_lannister).
parent(cersei_lannister,	joanna_lannister).
parent(jaime_lannister,		joanna_lannister).
parent(tyrion_lannister,	joanna_lannister).
parent(joffrey_baratheon,	cersei_lannister).
parent(myrcella_baratheon,	cersei_lannister).
parent(tommen_baratheon,	cersei_lannister).
parent(joffrey_baratheon,	jaime_lannister).
parent(myrcella_baratheon,	jaime_lannister).
parent(tommen_baratheon,	jaime_lannister).
parent(lancel_lannister,	kevan_lannister).
parent(willem_lannister,	kevan_lannister).
parent(martyn_lannister,	kevan_lannister).
parent(janei_lannister,		kevan_lannister).
parent(lancel_lannister,	dorna_swift).
parent(willem_lannister,	dorna_swift).
parent(martyn_lannister,	dorna_swift).
parent(janei_lannister,		dorna_swift).
parent(tyrek_lannister,		tygett_lannister).
parent(tyrek_lannister,		darlessa_marbrand).
parent(joy_hill,		gerion_lannister).
parent(cleos_frey,		genna_lannister).
parent(lyonel_frey,		genna_lannister).
parent(tion_frey,		genna_lannister).
parent(red_walder_frey,		genna_lannister).
parent(cleos_frey,		emmon_frey).
parent(lyonel_frey,		emmon_frey).
parent(tion_frey,		emmon_frey).
parent(red_walder_frey,		emmon_frey).
parent(tywin_frey,		cleos_frey).
parent(willem_frey,		cleos_frey).
parent(tywin_frey,		jeyne_darry).
parent(willem_frey,		jeyne_darry).

/* females among Stark family */
female(lyanna_stark).
female(catelyn_tully).
female(sansa_stark).
female(arya_stark).

/* females among Lannister family */
female(joanna_lannister).
female(gerion_lannister).
female(genna_lannister).
female(cersei_lannister).
female(myrcella_baratheon).
female(dorna_swift).
female(janei_lannister).
female(darlessa_marbrand).
female(joy_hill).
female(jeyne_darry).

/* males among Stark family */
male(edwyle_stark).
male(rickard_stark).
male(brandon_stark_snr).
male(ned_stark).
male(benjen_stark).
male(jon_snow).
male(rob_stark).
male(bran_stark).
male(rickon_stark).

/* males among Lannister family */
male(tytos_lannister).
male(tywin_lannister).
male(kevan_lannister).
male(tygett_lannister).
male(jaime_lannister).
male(tyrion_lannister).
male(joffrey_baratheon).
male(tommen_baratheon).
male(lancel_lannister).
male(willem_lannister).
male(martyn_lannister).
male(tyrek_lannister).
male(emmon_frey).
male(cleos_frey).
male(lyonel_frey).
male(tion_frey).
male(red_walder_frey).
male(tywin_frey).
male(willem_frey).
