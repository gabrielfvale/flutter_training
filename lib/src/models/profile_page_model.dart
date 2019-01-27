import './profile_model.dart';

class ProfileImageModel {
  int page;
  int per_page;
  int total_pages;
  List data;

  ProfileImageModel({this.page, this.per_page, this.total_pages, this.data});
  factory ProfileImageModel.fromJson(Map<String, dynamic> json) {
    return ProfileImageModel(
      page: json['page'],
      per_page: json['per_page'],
      total_pages: json['total_pages'],
      data: json['data']
    );
  }
}
