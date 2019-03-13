-module(pangram).
-export([is_pangram/1]).
-import(string,[to_lower/1]).

is_pangram(Word) ->
	Alphabet = "abcdefghijklmnopqrstuvwxyz",
	is_pangram(string:to_lower(Word),Alphabet).
is_pangram(_,[]) ->
	true;
is_pangram([],_) ->
	false;
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