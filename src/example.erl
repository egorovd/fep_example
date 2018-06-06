%%%-------------------------------------------------------------------
%%% @author denis
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. Июнь 2018 14:24
%%%-------------------------------------------------------------------
-module(example).
-author("denis").

%% API
-export([run/0]).


run() ->
  io:format("[example] 1 Crete pool.~n"),
  {ok, Ref} = fep:create_pool({fep_example, 1}),
  io:format("[example] 2 Start worker.~n"),
  {ok, Pid} = supervisor:start_child(worker_sup, [Ref]),
  io:format("[example] 3 Worker Pid: ~p ~n", [Pid]),

  {ok, Pid} = fep:pop(Ref),
  io:format("[example] 4 Pop worker from Pool. Pid: ~p ~n", [Pid]),
  io:format("[example] 5 Send Msg to worker. ~n"),
  worker:run(Pid),

  io:format("[example] 6 Stop worker. ~n"),
  worker:stop(Pid),
  timer:sleep(100),

  io:format("[example] 7 Try pop worker if alive. Worker is alive ?  ~p~n", [fep:pop_if_alive(Ref)]),
  fep:delete_pool(Ref).