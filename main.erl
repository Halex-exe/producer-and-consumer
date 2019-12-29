-module(main).
-export([start/2, stop/0]).

start({producer, ProducerWorkers, ProducerInterval},
	  {consumer, ConsumerWorkers, ConsumerInterval}) ->

  register(main, self()),
  ConsumerPids = consumer:start(ConsumerWorkers, ConsumerInterval),
  TaskmanagerPid = taskmanager:start(ConsumerPids),
  producer:start(ProducerWorkers, ProducerInterval, TaskmanagerPid),
  ok.

stop() ->
  % Termina o processo principal e seus links (producers, consumers e taskmanager)
  exit(whereis(main), stop).
