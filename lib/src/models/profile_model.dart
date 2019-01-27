class ProfileModel {
  int id;
  String first_name;
  String last_name;
  String avatar;

  ProfileModel(this.id, this.first_name, this.last_name, this.avatar);
  ProfileModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    first_name = parsedJson['first_name'];
    last_name = parsedJson['last_name'];
    avatar = parsedJson['avatar'];
  }
}
