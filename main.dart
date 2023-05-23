// Importação das bibliotecas necessárias
import 'dart:convert';
import 'package:http/http.dart' as http;

// URL base do ViaCEP
final String viaCepUrl = 'https://viacep.com.br/ws';

// Chave de API do MapQuest
final String mapquestApiKey = '97gvLJKTwM7TmxZ72MFtSPoxrpseFAA9';

// Função que obtém o endereço com base no CEP
Future<String> getAddress(String cep) async {
  final String viaCepUrl = 'https://viacep.com.br/ws/$cep/json/';
  final response = await http.get(Uri.parse(viaCepUrl));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);

    if (data.containsKey('erro')) {
      throw Exception('CEP não encontrado');
    }

    final String address = '${data['logradouro']},${data['complemento']}, ${data['bairro']}, ${data['localidade']}, ${data['uf']}';

    return address;
  } else {
    throw Exception('Erro ao consultar o CEP $cep');
  }
}

// Função que calcula a distância entre dois endereços
Future<double> calculateDistance(String address1, String address2) async {
  try {
    final String directionsUrl =
        'http://www.mapquestapi.com/directions/v2/route?key=$mapquestApiKey&from=$address1&to=$address2&routeType=fastestRoute';

    final responseDirections = await http.get(Uri.parse(directionsUrl));
    final dataDirections = json.decode(responseDirections.body);

    final double distance = dataDirections['route']['distance'];

    return distance;
  } catch (error) {
    print('Erro: $error');
    throw error;
  }
}

// Exemplo de uso
void main() async {
  final String cep = '01489-900';
  final String address1 = 'Rua Piúva, 33 - Parque Guarani, São Paulo - SP, 08235-540';

  try {
    final String address2 = await getAddress(cep);
    print('Endereço encontrado:' + address2);
    final double distanceInMiles = await calculateDistance(address1, address2);
    final double distanceInKm = distanceInMiles * 1.60934;
    print('A distância entre o CEP $cep e $address1 é de $distanceInKm km.');
  } catch (error, stackTrace) {
    print('Erro: $error');
    print('Rastreamento de pilha: $stackTrace');
    throw error;
  }
}
