% Define a function perimeter/1 which takes a shape and returns the perimeter of 
% shape.
% Choose a suitable representation of triangles, and augment area/1 and 
% perimeter/1 to handle this case too.
% Define a function enclose/1 that takes a shape and returns the smallest 
% enclosing rectangle of the shape.

-module(shapes).
-export([perimeter/1]).

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
