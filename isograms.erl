-module(isograms).
-export([is_isogram/1]).
-import(string,[to_lower/1]).
-include_lib("eunit/include/eunit.hrl").

is_isogram(Word) ->
	 is_isogram(string:to_lower(Word), []).
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

occurs(_, []) ->
	false;
occurs(X, [X|_]) ->
	true;
occurs(X, [_|T]) ->
	occurs(X, T).

occurs_possitive_test() -> true = occurs("d", ["d","o"]).
occurs_negative_test() -> false = occurs("do", ["T", "s"]).

is_isogram_possitive_test() -> true = is_isogram("yes").
is_isogram_negative_test() -> false = is_isogram("test").
is_isogram_case_test() -> false = is_isogram("Test").
