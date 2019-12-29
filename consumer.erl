-module(consumer).
-export([start/2, consume/1]).

start(Workers, Interval) ->
  start(Workers, Interval, []).

start(Workers, _, Pids) when Workers =< 0 ->
  Pids;

%% Cria N processos recursivamente e armazena o Pid na lista Pids(append),
%% a list Pids será retornada quando todos os N processos forem criados.
start(Workers, Interval, Pids) ->
  Pid = spawn_link(consumer, consume, [Interval]),
  start(Workers - 1, Interval, [Pid | Pids]).

%% Recebe e processa mensagens recursivamente.
consume(Interval) ->
  receive
    Val ->
      timer:sleep(Interval),
      io:format("~s -> ~p Consumiu~n", [Val,self()])
  end,
  consume(Interval).