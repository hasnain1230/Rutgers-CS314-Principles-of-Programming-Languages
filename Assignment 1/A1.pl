% identity

bool(false,false).
bool(true,true).

% negation Logical Not
bool(not(A), true):- 
    bool(A, false).
bool(not(A), false):- 
    bool(A, true).

% conjunction Logical And
bool([A, ^, B], true):- 
    bool(A, true), bool(B, true),!.
bool([A, ^, B], false):- 
    bool(A, false),! ; bool(B, false),!.

% disjunction Logical Or
bool([A, v, B], false):- 
    bool(A, false), 
    bool(B, false),!.

bool([A, v, B], true):- 
    bool(A, true),! ; 
    bool(B, true),!.

% selection
%  dig that antecedent! logic go brrrr..
bool([A, x, B], C):- 
    bool([ [A, v, B], ^, [ not([A, ^, B]), ^, not([not(A), ^, not(B)])] ], C).

% ripple-carry-add
% fill in these "?": 
adder([DIG0, DIG1, CIN], DIGOUT, COUT ):- 
    bool([[DIG0, x, DIG1], x, CIN], DIGOUT),
    bool([[CIN, ^, DIG1], v, [DIG0, ^, DIG1]], COUT).

rca([], [], [], true):- write('OVR'),!.
rca([], [], [], false):- write('OK'),!.

rca([NUM0H | NUM0T], [NUM1H | NUM1T], [ANSH | ANST], CIN ) :- 
    adder( [NUM0H, NUM1H, CIN], ANSH, COUT ), 
    rca( NUM0T, NUM1T, ANST, COUT ).


