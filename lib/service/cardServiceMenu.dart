import 'dart:io';
import 'package:aula_10_exercicio_game_cards/entities/card.dart';
import 'package:aula_10_exercicio_game_cards/interface/menu.dart';
import 'package:aula_10_exercicio_game_cards/service/cardService.dart';

class CardServiceMenu {
  CardService receive = CardService();
  Future<void> menuTakeAll() async {
    var count = 1;
    while (count != 0) {
      await receive.takeAll();
      print('===========================\n'
          'Deseja listar novamente 1 ou sair menu principal 0!, lembre de usar numeros!\n'
          '===========================');
      count = int.tryParse(stdin.readLineSync()) ?? 0;
    }
    menuReturn();
  }

  Future<void> menuTake() async {
    var count = 1;
    while (count != 0) {
      print('Digite um id valido!');
      var id = int.tryParse(stdin.readLineSync()) ?? 0;
      await receive.takeId(id);
      print('===========================\n'
          'Deseja listar novamente 1 ou sair menu principal 0 , lembre de usar numeros!\n'
          '===========================');
      count = int.tryParse(stdin.readLineSync()) ?? 0;
    }
    menuReturn();
  }

  Future<void> menuSave() async {
    var count = 1;
    while (count != 0) {
      print('Digite um nome para a carta!');
      var title = stdin.readLineSync();
      print('Digite uma descrição para a carta!');
      var content = stdin.readLineSync();
      var newCard = Card(title: title, content: content);
      newCard = await receive.save(newCard);
      print('===========================\n'
          'Deseja cadastrar novamente 1 ou sair menu principal 0 , lembre de usar numeros!\n'
          '===========================');
      count = int.tryParse(stdin.readLineSync()) ?? 0;
    }
    menuReturn();
  }

  Future<void> menuUpdate() async {
    var count = 1;
    while (count != 0) {
      print('Digite um id valido para o update!');
      var id = int.tryParse(stdin.readLineSync()) ?? 0;
      print('Digite um nome para a carta!');
      var title = stdin.readLineSync();
      print('Digite uma descrição para a carta!');
      var content = stdin.readLineSync();
      var newCard = Card(id: id, title: title, content: content);
      newCard = await receive.update(newCard);
      print('===========================\n'
          'Deseja modificar novamente 1 ou sair menu principal 0 , lembre de usar numeros!\n'
          '===========================');
      count = int.tryParse(stdin.readLineSync()) ?? 0;
    }
    menuReturn();
  }

  Future<void> menuDelete() async {
    var count = 1;
    while (count != 0) {
      print('Digite um id valido para ser deletado!');
      var id = int.tryParse(stdin.readLineSync()) ?? 0;
      await receive.delete(id);
      print('===========================\n'
          'Deseja deletar novamente 1 ou sair menu principal 0 , lembre de usar numeros!\n'
          '===========================');
      count = int.tryParse(stdin.readLineSync()) ?? 0;
    }
    menuReturn();
  }

  Menu menuReturn() {
    Menu menuManager = Menu();
    menuManager.menuManager();
    return menuManager;
  }
}
