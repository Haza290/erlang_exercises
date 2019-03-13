-module(bubble_sort).
-export([sort/1]).
-include_lib("eunit/include/eunit.hrl").

sort([H|T]) ->
	sort(H,T,[],[]).
sort(X,[],[],Sorted) ->
	[X|Sorted];
sort(X,[],[H|T],Sorted) ->
	sort(H,reverse(T),[],[X|Sorted]);
sort(X,[H|T],Unsorted,Sorted) ->
	if
		X>H ->
			sort(X,T,[H|Unsorted],Sorted);
		true ->
			sort(H,T,[X|Unsorted],Sorted)
	end.

reverse(List) ->
	reverse(List,[]).
reverse([],List) ->
	List;
reverse([H|T],List) ->
	reverse(T,[H|List]).

sort_random_test() -> [-92,-44,-20,12,21,26,48,51,80,86] = sort([48,12,86,26,-20,21,80,-92,51,-44]).
sort_sorted_test() -> [-92,-44,-20,12,21,26,48,51,80,86] = sort([-92,-44,-20,12,21,26,48,51,80,86]).
sort_reverse_test() -> [-92,-44,-20,12,21,26,48,51,80,86] = sort([86,80,51,48,26,21,12,-20,-44,-92]).