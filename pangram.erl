-module(pangram).
-export([is_pangram/1,remove_from_list/2]).

is_pangram(Word) ->
	Alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"],
	is_pangram(Word,Alphabet).
is_pangram(_,[]) ->
	true;
is_pangram([],X) ->
	{false,X};
is_pangram([H|T],Alphabet) ->
	is_pangram(T,remove_from_list(H,Alphabet)).

remove_from_list(X,List) ->
	remove_from_list(X,List,[]).
remove_from_list(_,[],List) ->
	List;
remove_from_list(X,[X|T],List) ->
	T++List;
remove_from_list(X,[H|T],List) ->
	remove_from_list(X,T,[H|List]).

