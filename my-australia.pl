/* my-australia.pl */
/******************************************************************************/
/* Assignment Questions */
/* Question 4 */
/* Part 1 */
bordering_cities(C1, C2) :- city_in(X,C1), city_in(Y,C2), X\=Y,
                            borders(X,Y).
/* Part 2 */
borders_three(S) :- borders(S,S1), borders(S,S2), S1\=S2.

/* Part 3 */
places_to_go(T) :- city_in(vic, T), T=melbourne.
places_to_go(T) :- city_in(S, T), borders(vic, S).

/* Part 4 - Below is the query
   city(M, yarra_river, _), city_in(V, M), borders(V, S), city_in(S, C).
*/
/******************************************************************************/

/* state(X) says that X is a state */

state(tas).	state(vic).	state(nsw).
state(sa).	state(act).	state(qld).
state(nt).	state(wa).

borders1(vic, nsw).	borders1(vic, sa).
borders1(nsw, qld).	borders1(nsw, sa).
borders1(qld, sa).	borders1(qld, nt).
borders1(act, nsw).	borders1(nt, wa).
borders1(sa, nt).	borders1(sa, wa).

/* borders(S1,S2) says that state S1 and state S2 share a border */

borders(S1, S2) :- borders1(S1, S2).
borders(S1, S2) :- borders1(S2, S1). 

/* city_in(X,Y) says that Y is a city in state X */

city_in(tas, hobart).
city_in(tas, launceston).	   
city_in(vic, melbourne).
city_in(vic, geelong).
city_in(nsw, sydney).
city_in(nsw, newcastle).
city_in(sa, adelaide).
city_in(sa, glenelg).
city_in(act, canberra).
city_in(qld, brisbane).
city_in(qld, cairns).
city_in(nt, darwin).
city_in(wa, fremantle).
city_in(wa, perth).

/* city(C,W,A) says that city C has one waterway W with attraction A */

city(hobart, derwent_river, museum_of_old_and_new_art).
city(melbourne, yarra_river, federation_square).
city(sydney, sydney_harbour, opera_house).
city(adelaide, torrens_river, art_gallery_of_south_aust).
city(canberra, lake_burley_griffin, national_gallery).
city(brisbane, brisbane_river, queensland_art_gallery).
city(darwin, darwin_harbour, skycity_casino).
city(perth, swan_river, art_gallery_of_western_aust). 