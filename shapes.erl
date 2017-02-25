% Define a function perimeter/1 which takes a shape and returns the perimeter of 
% shape.
% Choose a suitable representation of triangles, and augment area/1 and 
% perimeter/1 to handle this case too.
% Define a function enclose/1 that takes a shape and returns the smallest 
% enclosing rectangle of the shape.

-module(shapes).
-export([perimeter/1,area/1,enclose/1]).
-include_lib("eunit/include/eunit.hrl").

perimeter({rectangle, {_,_}, H, W}) ->
    H*2+W*2;
perimeter({circle, {_,_}, R}) ->
    2*math:pi()*R;    % circumference
perimeter({triangle, {_,_}, A, B, C}) ->
    A+B+C.


area({rectangle, {_,_}, H, W}) ->
    H*W;
area({circle, {_,_}, R}) ->
    math:pi()*R*R;
area({triangle, {_,_}, A, B, C}) ->
    S=(A+B+C)/2,
    math:sqrt(S*(S-A)*(S-B)*(S-C)).    % Heron's formula


enclose({rectangle, {X,Y}, H, W}) ->
    {rectangle, {X,Y}, H, W};
enclose({circle, {X,Y}, R}) ->
    D=R*2,
    {rectangle, {X,Y}, D, D};
enclose({triangle, {X,Y}, A, B, C}) ->
    H=area({triangle, {X,Y}, A, B, C})*2/B,
    {rectangle, {X,Y}, H, B}.


% execute unit-tests from erl shell with: 'shapes:test().'
perimeter_test_() ->
    [?_assertEqual(perimeter({rectangle, {0,0}, 1, 1}), 4),
     ?_assertEqual(perimeter({rectangle, {0,0}, 3, 4}), 14),
     ?_assert(fuzzy_match(perimeter({circle, {0,0}, 0.5}), 3.14159)),
     ?_assert(fuzzy_match(perimeter({circle, {0,0}, 2}), 12.56637)),
     ?_assertEqual(perimeter({triangle, {0,0}, 1, 1, 1}), 3),
     ?_assertEqual(perimeter({triangle, {0,0}, 2, 1, 2}), 5),
     ?_assertEqual(perimeter({triangle, {0,0}, 3, 4, 5}), 12)].

area_test_() ->
    [?_assertEqual(area({rectangle, {0,0}, 1, 1}), 1),
     ?_assertEqual(area({rectangle, {0,0}, 3, 4}), 12),
     ?_assert(fuzzy_match(area({circle, {0,0}, 1}), 3.14159)),
     ?_assert(fuzzy_match(area({circle, {0,0}, 6}), 113.09734)),
     ?_assert(fuzzy_match(area({triangle, {0,0}, 1, 1, 1}), 0.43301)),
     ?_assert(fuzzy_match(area({triangle, {0,0}, 2, 1, 2}), 0.96825)),
     ?_assertEqual(area({triangle, {0,0}, 3, 4, 5}), 6.0)].

enclose_test_() ->
    [?_assertEqual(enclose({rectangle, {0,0}, 3, 4}), {rectangle, {0,0}, 3, 4}),
     ?_assertEqual(enclose({circle, {0,0}, 1}), {rectangle, {0,0}, 2, 2}),
     ?_assertEqual(enclose({triangle, {0,0}, 3, 4, 5}), {rectangle, {0,0}, 3.0, 4})].

fuzzy_match(A,B) ->
    fuzzy_match(A,B,3).

% see http://www2.erlangcentral.org/wiki/?title=Floating_Point_Compare
fuzzy_match(A,B,L) ->
    <<AT:L/binary, _/binary>> = <<A/float>>,
    <<BT:L/binary, _/binary>> = <<B/float>>,
    AT == BT.
