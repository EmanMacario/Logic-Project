/* game-of-thrones-0.pl */

/* general family relationships */
/* usage: parent(X,Y) means child X has parent Y, or a parent of X is Y. */

mother(X,Y) 		:- parent(X,Y), female(Y). 
father(X,Y) 		:- parent(X,Y), male(Y). 
siblings(X,Y) 		:- parent(X,Z), parent(Y,Z), X \= Y.
brother_of(X,Y) 	:- siblings(X,Y), male(Y).
sister_of(X,Y) 	:- siblings(X,Y), female(Y).
grandparent(X,Y) 	:- parent(X,Z), parent(Z,Y).
grandmother(X,Y) 	:- grandparent(X,Y), female(Y). 
grandfather(X,Y) 	:- grandparent(X,Y), male(Y). 
ancestor(X,Y) 	:- parent(X,Y).
ancestor(X,Y) 	:- parent(X,Z), ancestor(Z,Y). 

/* facts from the family tree of the Stark family */
parent(rickard_stark,		edwyle_stark).
parent(ned_stark,		rickard_stark).		/* ned = eddard */ 
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

/* females among Stark family */
female(catelyn_tully).
female(sansa_stark).
female(arya_stark).

/* males among Stark family */
male(edwyle_stark).
male(rickard_stark).
male(ned_stark).
male(jon_snow).
male(rob_stark).
male(brandon_stark).
male(rickon_stark).
