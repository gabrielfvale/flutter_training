import './profile_model.dart';

class ProfileImageModel {
  int page;
  int per_page;
  int total_pages;
  List<ProfileModel> data;

  ProfileImageModel(this.page, this.per_page, this.total_pages, this.data);
  ProfileImageModel.fromJson(Map<String, dynamic> parsedJson) {
    page = parsedJson['page'];
    per_page = parsedJson['per_page'];
    total_pages = parsedJson['total_pages'];
    for(int i = 0; i < per_page; i++) {
      var profile = parsedJson['data'][i];
      data.add(
        ProfileModel(
          profile['id'], 
          profile['first_name'], 
          profile['last_name'], 
          profile['avatar']
      ));
    }
  }
}
