% Define a function bits/1 that takes a positive integer N and returns the sum 
% of the bits in the binary representation.  For example bits(7) is 3 and 
% bits(8) is 1.
% See whether you can make both a direct recursive and a tail recursive 
% definition.
% Which do you think is better?  Why?

-module(bits).
-export([bits/1,trbits/1]).

bits(0) ->
    0;
bits(N) when N>0 ->
    N band 1 + bits(N bsr 1).

% examples:
% bits:bits(0). == 0
% bits:bits(1). == 1
% bits:bits(2). == 1
% bits:bits(3). == 2
% bits:bits(4). == 1
% bits:bits(5). == 2
% bits:bits(6). == 2
% bits:bits(7). == 3
% bits:bits(8). == 1

trbits(N) ->
    trbits(N,0).


trbits(0,S) ->
    S;
trbits(N,S) when N>0 ->
    trbits(N bsr 1,S+(N band 1)).

% examples:
% bits:trbits(0). == 0
% bits:trbits(1). == 1
% bits:trbits(2). == 1
% bits:trbits(3). == 2
% bits:trbits(4). == 1
% bits:trbits(5). == 2
% bits:trbits(6). == 2
% bits:trbits(7). == 3
% bits:trbits(8). == 1
