%Saves a list inside an archive
% Receives a list of content in an archive called out.txt
% example:
% save([a,b,c,d]).
save(List):-
    open("out.txt",write, Stream),
    ( write(Stream, List), fail ; true),
    close(Stream).


%Verify if an element belongs to a List (passed by second param).
%If its True, than return 1, else 0
find(_, [], 0).
find(Element, [Element|_], 1).
find(Element, [_|T], X):-
	find(Element, T, R),
	X = R.

% Return the number of items from first list that appears in the second
% one.
howMany([], _, 0).
howMany([H|T], List, Result):-
	find(H, List, Result2),
        howMany(T, List, Result3),
	Result is Result2 + Result3.

%Return a length of a list.
size([], 0).
size([_|[]], 1).
size([_|T], Result):-
    size(T, Result2),
    Result is 1 + Result2.


%Return a sum of all list itens
sum([],0).
sum([H|T],S):-
    sum(T,ST),
    S is ST+H.






