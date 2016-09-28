/*Assignment 3 - prolog
 * Krishna Bakka 
 */


female(kamala).
female(vasu).
female(chaitu).
female(rukku).
female(ponni).
female(chinni).
female(keerthi).
female(tanu).
female(rukku).
female(chilaka).

mother_of(chilaka,santosh).
mother_of(rukku,palgun).
mother_of(rukku,krish).
mother_of(kamala,utham).
mother_of(kamala,ravi).
mother_of(kamala,raghu).
mother_of(chaitu,keerthi).
mother_of(chaitu,tanu).
mother_of(vasu,chinni).
mother_of(vasu,ponni).
sister_of(X,Y):-mother_of(Z,X),mother_of(Z,Y),female(X),not(X==Y).
brother_of(X,Y):- mother_of(Z,X),mother_of(Z,Y),not(X==Y),not(female(X)).

uncle_of(X,Y):-father_of(Z,Y),brother_of(Z,X).

wife_of(vasu,raghu).
wife_of(chaitu,ravi).
wife_of(rukku,utham).
wife_of(chilaka,krish).
wife_of(kamala,pandu).

father_of(X,Y):-mother_of(Z,Y),wife_of(Z,X).
aunt_of(X,Y):- wife_of(X,Z),brother_of(Z,A),father_of(A,Y).
nephew_of(X,Y):-brother_of(Y,A),father_of(A,X),not(female(X)).
nephew_of(X,Y):- wife_of(Y,A),brother_of(A,Z),father_of(Z,X),not(female(X)).

niece_of(X,Y):-brother_of(Y,A),father_of(A,X),female(X).
niece_of(X,Y):- wife_of(Y,A),brother_of(A,Z),father_of(Z,X),female(X).

grandmother_of(X,Y):-father_of(A,Y),mother_of(X,A).
grandfather_of(X,Y):-father_of(A,Y),father_of(X,A).









