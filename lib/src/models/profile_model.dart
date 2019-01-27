class ProfileModel {
  int id;
  String first_name;
  String last_name;
  String avatar;

  ProfileModel({this.id, this.first_name, this.last_name, this.avatar});
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      avatar: json['avatar'],
    );
  }
}
