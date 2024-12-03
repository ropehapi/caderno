# Mensageria
Mensageria é um conceito que define que sistemas distribuídos possam se comunicar por meio de troca de mensagens (evento) de maneira assíncrona, sendo estas mensagens "gerenciadas" por um Message Broker (Servidor/Módulo de mensagens, como o Kafka ou RabbitMQ)

Ex: Minha aplicação durante uma contratação deve fazer o envio de emails, mas eu não necessariamente preciso aguardar que esse email seja enviado pra continuar a execução da minha tarefa e devolver a minha response. Dessa maneira, eu jogo o evento do disparo de email para um message broker, e volto para a execução da minha tarefa, de forma que eu apenas serei notificado sobre o sucesso do envio desse email depois.

## O padrão pub/sub
![O padrão pub/sub](/src/img/pub_sub.png)

Nesse padrão nós temos dois papéis, o de publisher, que é o responsável por publicar eventos em um message broker (Kafka, RabbitMQ, Amazon SQS, Google Pubsub etc), e o de subscriber, que é aquele que vai receber os eventos dos quais ele estiver inscrito para receber. Esse conceito é muito importante e fundamental para a compreensão da arquitetura de microsserviços e comunicação assíncrona.