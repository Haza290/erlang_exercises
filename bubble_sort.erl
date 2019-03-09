-module(bubble_sort).
-export([sort/1]).

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
