class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;

  CharacterModel(
      this.id,
      this.name,
      this.status,
      this.species,
      this.gender,
      this.image,
      );

  CharacterModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        status = json['status'],
        species = json['species'],
        gender = json['gender'],
        image = json['image'];
}

class ListCharacterModel {
  final List<CharacterModel> listCharacterModel;

  ListCharacterModel(this.listCharacterModel);

  ListCharacterModel.fromJson(Map<String, dynamic> json)
      : listCharacterModel = (json['results'] as List)
      .map((item) => CharacterModel.fromJson(item))
      .toList();
}


