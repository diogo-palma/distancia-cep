# Consulta de Endereço e Cálculo de Distância

Este é um exemplo de código em Dart que demonstra como fazer uma consulta de endereço com base em um CEP usando a API do ViaCEP e, em seguida, calcular a distância entre dois endereços usando a API do MapQuest.

## Pré-requisitos

Tenha uma conta em https://developer.mapquest.com/ e obtenha a key 
## Instalação


2. Abra o terminal ou prompt de comando e navegue até o diretório do projeto.

3. Execute o seguinte comando para instalar as dependências:

    ```shell
    dart pub get
    ```

## Uso

1. Abra o arquivo `main.dart` no seu editor de texto ou IDE.

2. Substituia `mapquestApiKey` pela sua key gerada em 
https://developer.mapquest.com/

3. No método `main()`, você pode modificar as variáveis `cep` e `address1` para os valores desejados. O `cep` é o CEP para o qual você deseja consultar o endereço, e `address1` é o endereço inicial para o cálculo da distância.

4. Execute o código usando o seguinte comando no terminal ou prompt de comando:

   ```shell
   dart main.dart
   ```
5. O programa irá exibir o endereço consultado com base no CEP e a distância entre o CEP e o endereço inicial especificado.
