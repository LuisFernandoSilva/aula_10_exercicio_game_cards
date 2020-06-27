import 'dart:io';
import 'package:aula_10_exercicio_game_cards/service/cardServiceMenu.dart';

class Menu {
  CardServiceMenu receive = CardServiceMenu();
  void menuManager() {
    print('===========================================\n'
        'Bem vindo ao sistemas de Cards o/\n'
        '1 - Buscar todos os cards\n'
        '2 - Buscar card pelo ID\n'
        '3 - Criar card\n'
        '4 - Atualizar card\n'
        '5 - Deletar card\n'
        '6 - Sair\n'
        '===========================================');
    var option = int.tryParse(stdin.readLineSync() ?? 0);
    switch (option) {
      case 1:
        receive.menuTakeAll();
        break;
      case 2:
        receive.menuTake();
        break;
      case 3:
        receive.menuSave();
        break;
      case 4:
        receive.menuUpdate();
        break;
      case 5:
        receive.menuDelete();
        break;
      case 6:
        print('===========================\n'
            'Saíndo do sistema....\n'
            'Valeu, falows /o\n'
            '===========================');
        break;
      default:
        print(
            'Digitou letras,algarismos ou deu enter sem ter digitado nada inves de numeros tente de novo');
        menuManager();
    }
  }
}
