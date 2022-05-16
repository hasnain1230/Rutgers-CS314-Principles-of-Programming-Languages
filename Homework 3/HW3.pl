echo([X], [X, X]). % Base Case

echo([X | Y], [X, X | Z]) :-   
    echo(Y, Z).


nthElem([ELEM | _], ELEM, 0). 

nthElem([_ | LST], ELEM, IND) :-
    nthElem(LST, ELEM, BASEIND), % Searches for the an IND2 to make it true, but IND2 will be zero until we pop up the stack frame
    IND is BASEIND + 1. % Hence, we continuosly add 1.

echomore([X],[X, X],1). % Base case

echomore([X],[X | LST1], NUM) :-
    echomore([X], LST1, NUM1),
    NUM is NUM1 + 1.

filterevens([X | _], [X]) :- % base case gets hit if second list only has one element
    mod(X, 2) =:= 0.

filterevens([X | Y], [X | Z]) :- % If the first and second number match
    mod(X, 2) =:= 0,
    filterevens(Y, Z). 

filterevens([_ | Y], [Z | T]) :- % Otherwise, do this
    filterevens(Y, [Z | T]).  % The first list will always be as long or longer than the second list, so keep using the tail of the first list. 
