-module(quick_sort).
-export([pivot_list/2,quick_sort/1]).
                   

quick_sort([]) ->
	[];
quick_sort([H|T]) ->
	{Smaller,Bigger} = pivot_list(H,T),
	quick_sort(Smaller) ++ [H|quick_sort(Bigger)].


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






