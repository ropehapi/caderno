# Manipulação de arquivos
## Criando um arquivo
    func main(){
        f, err := os.Create("arquivo.txt")
        if err != nil {
            panic(err)
        }
        f.Close()
    }

## Gravando dados em um arquivo
    func main(){
        f, err := os.Create("arquivo.txt")
        if err != nil {
            panic(err)
        }

        tamanho, err := f.WriteString("Escrevendo texto no arquivo")
        ou
        tamanho, err := f.Write([]byte("Escrevendo dados no arquivo"))

        if err != nil {
            panic(err)
        }
        fmt.Printf("Arquivo criado com sucesso! Tamanho: %d bytes", tamanho)

        f.Close()
    }

## Lendo dados de um arquivo
    func main(){
        //Leitura
        arquivo, err := os.ReadFile("arquivo.txt")
        if err != nil{
            panic(err)
        }

        fmt.Println(string(arquivo))

        //Leitura de pouco em pouco
        arquivo, err := os.Open("arquivo.txt")
        if err != nil {
            panic(err)
        }
        reader := bufio.NewReader(arquivo)
        buffer := make([]byte, 10)
        for {
            n, err := reader.Read(buffer)
            if err != nil {
                break
            }
            fmt.Println(string(buffer[:n]))
        }
    }

## Removendo um arquivo
    func main(){
        err = os,Remove("arquivo.txt")
        if err != nil {
            panic(err)
        }
    }