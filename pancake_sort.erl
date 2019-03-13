-module(pancake_sort).
-export([sort/1]).
-import(lists,[reverse/1]).
-include_lib("eunit/include/eunit.hrl").

% Maybe add a grafic to this at somepoint in the furture

sort(Stack) ->
    io:format("Stack: ~p\n", [Stack]),
    sort(Stack, []).
sort([], Sorted) ->
    io:format("Stack: ~p\n", [Sorted]),
    Sorted;
sort(Unsorted, Sorted) ->
    [Largest|T] = flip_at_largest(Unsorted),
    io:format("Stack: ~p\n", [[Largest|T] ++ Sorted]),
    Reverse_T = lists:reverse(T),
    io:format("Stack: ~p\n", [Reverse_T ++ [Largest|Sorted]]),
    sort(Reverse_T, [Largest|Sorted]).


flip_at_largest(List) ->
    flip_at_largest(List, find_largest(List), []).
flip_at_largest([Largest|T], Largest, List) ->
    [Largest|List] ++ T;
flip_at_largest([H|T], Largest, List) ->
    flip_at_largest(T, Largest, [H|List]).


find_largest([H|T]) ->
    find_largest(T, H).
find_largest([], Largest) ->
    Largest;
find_largest([H|T], Largest) ->
    if
        Largest > H ->
            find_largest(T, Largest);
        true ->
            find_largest(T, H)
    end.

sort_random_test() -> [-92,-44,-20,12,21,26,48,51,80,86] = sort([48,12,86,26,-20,21,80,-92,51,-44]).
sort_sorted_test() -> [-92,-44,-20,12,21,26,48,51,80,86] = sort([-92,-44,-20,12,21,26,48,51,80,86]).
sort_reverse_test() -> [-92,-44,-20,12,21,26,48,51,80,86] = sort([86,80,51,48,26,21,12,-20,-44,-92]).

flip_at_largest_random_test() -> [86,12,48,26,-20,21,80,-92,51,-44] = flip_at_largest([48,12,86,26,-20,21,80,-92,51,-44]).
flip_at_largest_sorted_test() -> [86,80,51,48,26,21,12,-20,-44,-92] = flip_at_largest([-92,-44,-20,12,21,26,48,51,80,86]).
flip_at_largest_reverse_test() -> [86,80,51,48,26,21,12,-20,-44,-92] = flip_at_largest([86,80,51,48,26,21,12,-20,-44,-92]).

find_largest_random_test() -> 86 = find_largest([48,12,86,26,-20,21,80,-92,51,-44]).
find_largest_sorted_test() -> 86 = find_largest([-92,-44,-20,12,21,26,48,51,80,86]).
find_largest_reverse_test() -> 86 = find_largest([86,80,51,48,26,21,12,-20,-44,-92]).