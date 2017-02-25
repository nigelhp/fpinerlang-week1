% Define a function perimeter/1 which takes a shape and returns the perimeter of 
% shape.
% Choose a suitable representation of triangles, and augment area/1 and 
% perimeter/1 to handle this case too.
% Define a function enclose/1 that takes a shape and returns the smallest 
% enclosing rectangle of the shape.

-module(shapes).
-export([perimeter/1,area/1,enclose/1]).

perimeter({rectangle, {_,_}, H, W}) ->
    H*2+W*2;
perimeter({circle, {_,_}, R}) ->
    2*math:pi()*R;    % circumference
perimeter({triangle, {_,_}, A, B, C}) ->
    A+B+C.

% examples:
% shapes:perimeter({rectangle, {0,0}, 1, 1}). == 4
% shapes:perimeter({rectangle, {0,0}, 3, 4}). == 14
% shapes:perimeter({circle, {0,0}, 0.5}). ~ 3.14159
% shapes:perimeter({circle, {0,0}, 2}). ~ 12.56637
% shapes:perimeter({triangle, {0,0}, 1, 1, 1}). == 3
% shapes:perimeter({triangle, {0,0}, 2, 1, 2}). == 5
% shapes:perimeter({triangle, {0,0}, 3, 4, 5}). == 12


area({rectangle, {_,_}, H, W}) ->
    H*W;
area({circle, {_,_}, R}) ->
    math:pi()*R*R;
area({triangle, {_,_}, A, B, C}) ->
    S=(A+B+C)/2,
    math:sqrt(S*(S-A)*(S-B)*(S-C)).    % Heron's formula

% examples:
% shapes:area({rectangle, {0,0}, 1, 1}). == 1
% shapes:area({rectangle, {0,0}, 3, 4}). == 12
% shapes:area({circle, {0,0}, 1}). ~ 3.14159
% shapes:area({circle, {0,0}, 6}). ~ 113.09734
% shapes:area({triangle, {0,0}, 1, 1, 1}). ~ 0.43301
% shapes:area({triangle, {0,0}, 2, 1, 2}). ~ 0.96825
% shapes:area({triangle, {0,0}, 3, 4, 5}). == 6.0 


enclose({rectangle, {X,Y}, H, W}) ->
    {rectangle, {X,Y}, H, W};
enclose({circle, {X,Y}, R}) ->
    D=R*2,
    {rectangle, {X,Y}, D, D};
enclose({triangle, {X,Y}, A, B, C}) ->
    H=area({triangle, {X,Y}, A, B, C})*2/B,
    {rectangle, {X,Y}, H, B}.

% examples:
% shapes:enclose({rectangle, {0,0}, 3, 4}). == {rectangle, {0,0}, 3, 4}
% shapes:enclose({circle, {0,0}, 1}). == {rectangle, {0,0}, 2, 2}
% shapes:enclose({triangle, {0,0}, 3, 4, 5}). == {rectangle, {0,0}, 3.0, 4}
