class ProfileModel {
  ProfileData? data;
  bool? status;

  ProfileModel({this.data, this.status});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new ProfileData.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class ProfileData {
  int? id;
  String? name;
  String? email;
  String? createdAt;
  String? updatedAt;

  ProfileData({this.id, this.name, this.email, this.createdAt, this.updatedAt});

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
