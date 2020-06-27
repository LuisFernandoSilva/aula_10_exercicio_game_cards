import 'dart:convert';
import 'package:aula_10_exercicio_game_cards/entities/card.dart';
import 'package:dio/dio.dart';

class CardService {
  var dio =
      Dio(BaseOptions(baseUrl: 'https://api-cards-growdev.herokuapp.com'));
  //pega todas as cartas
  Future<List<Card>> takeAll({int id}) async {
    var response = await dio.get('/cards',
        queryParameters: id != null ? {'id': id} : null);
    var receive = List<Card>();
    if (response.statusCode >= 200 && response.statusCode < 300) {
      List list = response.data;
      list.forEach((element) {
        receive.add(Card.fromMap(element));
        print(element);
      });
    } else {
      print('Algo deu errado.');
    }
    return receive;
  }

  //escolhe uma carta pelo id
  Future<Card> takeId(int id) async {
    var response = await dio.get('/cards/$id');
    Card receive;
    try {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        receive = Card.fromMap(response.data);
        if (receive.id == null) {
          print(
              'Algo deu errado tenta novamente'); //retorno se nao existe o id passado
        } else {
          print(receive);
        }
      }
    } catch (e) {
      print('erro: $e');
    }
    if (response.statusCode >= 200 && response.statusCode < 300) {
    } else {
      print('Algo deu errado.');
    }
    return receive;
  }

  //salva uma carta
  Future<Card> save(Card card) async {
    var dataCard = jsonEncode(card.toMap());
    var response = await dio.post('/cards', data: dataCard);
    Card receive;
    try {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        receive = Card.fromMap(response.data);
        print('Salvo com sucesso'); //printa se o item foi salvo com sucesso
      }
    } catch (e) {
      print('Algo deu errado. $e'); //se der errado printa o erro
    }
    return receive;
  }

  //faz update
  Future<Card> update(Card card) async {
    var dataCard = jsonEncode(card.toMap());
    var response = await dio.put('/cards/${card.id}', data: dataCard);
    Card receive;
    try {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        receive = Card.fromMap(response.data);
        print(
            'Alterado com sucesso'); //printa quando o item foi alterado com sucesso
      }
    } catch (e) {
      print('Algo deu errado. $e');
    }
    return receive;
  }

  //faz delete
  Future<void> delete(int id) async {
    var response = await dio.delete('/cards/$id');
    if (response.statusCode >= 300 && response.statusCode < 200) {
      print('Algo deu errado tente novamente'); //se der algo errado
    } else {
      print('Deletado com sucesso'); //quando e deletado com sucesso
    }
  }
}
