class PortfolioModel {
  bool? status;
  Data? data;

  PortfolioModel({this.status, this.data});

  PortfolioModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Portfolio>? portfolio;
  Profile? profile;

  Data({this.portfolio, this.profile});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['portfolio'] != null) {
      portfolio = <Portfolio>[];
      json['portfolio'].forEach((v) {
        portfolio!.add(new Portfolio.fromJson(v));
      });
    }
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.portfolio != null) {
      data['portfolio'] = this.portfolio!.map((v) => v.toJson()).toList();
    }
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class Portfolio {
  int? id;
  String? cvFile;
  String? name;
  String? image;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Portfolio(
      {this.id,
        this.cvFile,
        this.name,
        this.image,
        this.userId,
        this.createdAt,
        this.updatedAt});

  Portfolio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cvFile = json['cv_file'];
    name = json['name'];
    image = json['image'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cv_file'] = this.cvFile;
    data['name'] = this.name;
    data['image'] = this.image;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Profile {
  int? id;
  int? userId;
  String? name;
  String? email;
  String? mobile;
  String? address;
  String? language;
  String? interestedWork;
  String? offlinePlace;
  String? remotePlace;
  String? bio;
  String? education;
  String? experience;
  String? personalDetailed;
  String? createdAt;
  String? updatedAt;

  Profile(
      {this.id,
        this.userId,
        this.name,
        this.email,
        this.mobile,
        this.address,
        this.language,
        this.interestedWork,
        this.offlinePlace,
        this.remotePlace,
        this.bio,
        this.education,
        this.experience,
        this.personalDetailed,
        this.createdAt,
        this.updatedAt});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
    language = json['language'];
    interestedWork = json['interested_work'];
    offlinePlace = json['offline_place'];
    remotePlace = json['remote_place'];
    bio = json['bio'];
    education = json['education'];
    experience = json['experience'];
    personalDetailed = json['personal_detailed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['language'] = this.language;
    data['interested_work'] = this.interestedWork;
    data['offline_place'] = this.offlinePlace;
    data['remote_place'] = this.remotePlace;
    data['bio'] = this.bio;
    data['education'] = this.education;
    data['experience'] = this.experience;
    data['personal_detailed'] = this.personalDetailed;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
