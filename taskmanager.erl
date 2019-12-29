-module(taskmanager).
-export([start/1, accept/1]).

start(Consumers) ->
  Pid = spawn_link(taskmanager, accept, [Consumers]),
  register(task_manager, Pid),
  Pid.

%% Recebe mensagens dos produtores, e envia para o consumidor
%% com menos mensagens na mailbox
accept(Consumers) ->
  receive
    Val ->
      balance(Consumers) ! Val,
      accept(Consumers)
  end.

%% Dado uma lista de Pids, retorna aquele com menos mensagens
%% na sua mailbox.
balance(Consumers) ->
  [H | ConsumersReduced] = Consumers,
  Len = process_info(H, message_queue_len),
  balance(ConsumersReduced, H, Len).

balance(Consumers, Consumer, _) when length(Consumers) == 0 ->
  Consumer;

balance(Consumers, Consumer, MinLen) ->
  [H | ConsumersReduced] = Consumers,
  Len = process_info(H, message_queue_len),
  if
    Len < MinLen ->
      balance(ConsumersReduced, H, Len);
    true ->
      balance(ConsumersReduced, Consumer, MinLen)
  end.