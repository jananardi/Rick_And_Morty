import '../models/character_model.dart';
import '../services/character_service.dart';
import 'package:get/get.dart';

class ListCharacterController extends GetxController {
  CharacterService characterService = CharacterService();

  var isLoading = false.obs;

  var listCharacterObs = <CharacterModel>[].obs;

  static ListCharacterController get listCharacter => Get.find();

  Future<dynamic> listCharacterAsync() async {
    isLoading.value = true;
    var list = await characterService.fetchListCharacterModel();
    listCharacterObs.value = list.listCharacterModel;
    isLoading.value = false;
    return listCharacterObs;
  }
}
