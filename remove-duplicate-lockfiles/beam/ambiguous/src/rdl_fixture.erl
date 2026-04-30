%% Placeholder Erlang source so linguist counts Erlang bytes for this fixture.
-module(rdl_fixture).
-export([greeting/0, main/0]).

greeting() ->
    "hello from rdl-fixtures BEAM (Erlang) scenario".

main() ->
    io:format("~s~n", [greeting()]).
