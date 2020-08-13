# Producer and Consumer problem using Erlang
## About
The chosen problem that was implemented using the programming language Erlang was:
There are X task that are represented as Producer(Produtores), these Producers produce a string for a determined period of time, simulating a "heavy" execution, this string will be send to Producers in the future.
Besides the Producer, there are also the Consumer(Consumidores), that are responsible for consuming a string that was built originally by a Producer.
All the strings built by the Producers, are sent to third process, performed by a Taskmanager(Gerenciador de tarefas), that will receive these strings and send them to the Consumer that has the least messages on its queue in that specific moment. As it can be observed in the image below.

## How to run
In Erlang shell, go to directory that contains 4 files(.erl) of the programme:
![Erro ao carregar](https://i.ibb.co/MhtqKyR/Screenshot-2019-12-31-at-18-32-07.png)

After that, compile the 4 files(.erl) with the following command:
![Erro ao carregar](https://i.ibb.co/7v7d0Xj/Screenshot-2019-12-31-at-18-32-24.png)

To run, use the following command:
![Erro ao carregar](https://i.ibb.co/3C6LJ9x/Screenshot-2019-12-31-at-18-32-42.png)
