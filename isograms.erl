-module(isograms).
-export([is_isogram/1]).

is_isogram(Word) ->
	 is_isogram(Word, []).
is_isogram([], _) ->
	true;
is_isogram([H|T], Letters) ->
	DoesOccur = occurs(H, Letters),
	if
		DoesOccur ->
			false;
		true ->
			is_isogram(T, [H|Letters])
	end.



occurs(X, []) ->
	false;
occurs(X, [X|T]) ->
	true;
occurs(X, [_|T]) ->
	occurs(X, T).

string_to_char_array(Word) ->
	string_to_char_array(Word, []).
string_to_char_array(Word, CharArray) ->
	if
			
CharArray;
	string_to_char_array(
