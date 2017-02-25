% Define a function bits/1 that takes a positive integer N and returns the sum 
% of the bits in the binary representation.  For example bits(7) is 3 and 
% bits(8) is 1.
% See whether you can make both a direct recursive and a tail recursive 
% definition.
% Which do you think is better?  Why?

-module(bits).
-export([bits/1,trbits/1]).
-include_lib("eunit/include/eunit.hrl").

% direct recursive
bits(0) ->
    0;
bits(N) when N>0 ->
    N band 1 + bits(N bsr 1).


% tail recursive
trbits(N) ->
    trbits(N,0).

trbits(0,S) ->
    S;
trbits(N,S) when N>0 ->
    trbits(N bsr 1,S+(N band 1)).


% execute unit-tests from erl shell with: 'bits:test().'
bits_test_() ->
    [?_assertEqual(bits(0), 0),
     ?_assertEqual(bits(1), 1),
     ?_assertEqual(bits(2), 1),
     ?_assertEqual(bits(3), 2),
     ?_assertEqual(bits(4), 1),
     ?_assertEqual(bits(5), 2),
     ?_assertEqual(bits(6), 2),
     ?_assertEqual(bits(7), 3),
     ?_assertEqual(bits(8), 1)].

trbits_test_() ->
    [?_assertEqual(trbits(0), 0),
     ?_assertEqual(trbits(1), 1),
     ?_assertEqual(trbits(2), 1),
     ?_assertEqual(trbits(3), 2),
     ?_assertEqual(trbits(4), 1),
     ?_assertEqual(trbits(5), 2),
     ?_assertEqual(trbits(6), 2),
     ?_assertEqual(trbits(7), 3),
     ?_assertEqual(trbits(8), 1)].
