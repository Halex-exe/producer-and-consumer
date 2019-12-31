# Problema do produtor e consumidor usando Erlang
O problema escolhido que foi implementado na linguagem de programação Erlang, foi o seguinte:
Existem X processos que são representados como os Producer (Produtores), esses produtores produzem por um determinado tempo uma string, simulando uma execução “pesada”, essa string vai ser enviada futuramente para os consumidores.
Além dos produtores, existem também os Consumer (Consumidores) que são responsáveis por consumir a string que foi gerada anteriormente por um produtor.
Todas as strings geradas pelos produtores, são enviadas para um terceiro processo, representado pelo TaskManager (Gerenciador de tarefas), que irá receber essas strings e enviar para o consumidor que possui menor quantidade de mensagens em sua fila naquele determinado instante. Como pode ser observado na imagem abaixo.

## Como executar:
No Shell do Erlang, vá até o diretório que contém os 4 módulos(.erl) do programa: 
![Erro ao carregar](https://i.ibb.co/MhtqKyR/Screenshot-2019-12-31-at-18-32-07.png)

Após isto, compile os 4 arquivos(.erl) com o seguinte comando:
![Erro ao carregar](https://i.ibb.co/7v7d0Xj/Screenshot-2019-12-31-at-18-32-24.png)

Para executar, utilize o seguinte comando:
![Erro ao carregar](https://i.ibb.co/3C6LJ9x/Screenshot-2019-12-31-at-18-32-42.png)
