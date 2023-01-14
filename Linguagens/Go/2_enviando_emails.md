# **Enviando emails com Go**
Para enviarmos emails através do Golang, podemos usar a biblioteca [Gomail](https://github.com/go-gomail/gomail), que pode ser instalada através do seguinte comando:

> go get -u gopkg.in/mail.v2

Abaixo, temos um exemplo da implementação do código para o envio do email.

    package main

    import (
        "crypto/tls"
        "fmt"
        gomail "gopkg.in/mail.v2"
    )

    func main() {
        m := gomail.NewMessage()

        m.SetHeader("From", "remetente@gmail.com")
        m.SetHeader("To", "destinatario@gmail.com")

        m.SetHeader("Subject", "Assunto do email aqui")

        // Set the email body. You can set plain text or html with text/html
        m.SetBody("text/plain", "Corpo do email")

        // Settings for SMTP server
        d := gomail.NewDialer("smtp.gmail.com", 587, "email@gmail.com", "senha_gerada_para_o_app")

        // This is only needed when the SSL/TLS certificate is not valid on the server.
        // In production this should be set to false.
        d.TLSConfig = &tls.Config{InsecureSkipVerify: true}

        if err := d.DialAndSend(m); err != nil {
            fmt.Println(err)
            panic(err)
        }
    }