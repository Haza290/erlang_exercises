-module(quick_sort).
-export([sort/1]).
-include_lib("eunit/include/eunit.hrl").

sort([]) ->
	[];
sort([H|T]) ->
	{Smaller,Bigger} = pivot_list(H,T),
	sort(Smaller) ++ [H|sort(Bigger)].


pivot_list(X,List) ->
	pivot_list(X,List,[],[]).
pivot_list(_,[],Smaller,Bigger) ->
	{Smaller,Bigger};
pivot_list(X,[H|T],Smaller,Bigger) ->
	if
		X>H ->
			pivot_list(X,T,[H|Smaller],Bigger);
		true ->
			pivot_list(X,T,Smaller,[H|Bigger])
	end.

sort_random_test() -> [-92,-44,-20,12,21,26,48,51,80,86] = sort([48,12,86,26,-20,21,80,-92,51,-44]).
sort_sorted_test() -> [-92,-44,-20,12,21,26,48,51,80,86] = sort([-92,-44,-20,12,21,26,48,51,80,86]).
sort_reverse_test() -> [-92,-44,-20,12,21,26,48,51,80,86] = sort([86,80,51,48,26,21,12,-20,-44,-92]).