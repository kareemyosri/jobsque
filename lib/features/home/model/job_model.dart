// class JobModel {
//   bool? status;
//   List<JobData>? data;
//
//   JobModel({this.status, this.data});
//
//   JobModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['data'] != null) {
//       data = <JobData>[];
//       json['data'].forEach((v) {
//         data!.add(new JobData.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class JobData {
//   int? id;
//   String? name;
//   String? image;
//   String? jobTimeType;
//   String? jobType;
//   //String? jobLevel;
//   String? jobDescription;
//   String? jobSkill;
//   String? compName;
//   String? compEmail;
//   String? compWebsite;
//   String? aboutComp;
//   String? location;
//   String? salary;
// //  int? favorites;
//   int? expired;
//   String? createdAt;
//   String? updatedAt;
//
//   JobData(
//       {this.id,
//         this.name,
//         this.image,
//         this.jobTimeType,
//         this.jobType,
//       //  this.jobLevel,
//         this.jobDescription,
//         this.jobSkill,
//         this.compName,
//         this.compEmail,
//         this.compWebsite,
//         this.aboutComp,
//         this.location,
//         this.salary,
//      //   this.favorites,
//         this.expired,
//         this.createdAt,
//         this.updatedAt});
//
//   JobData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     image = json['image'];
//     jobTimeType = json['job_time_type'];
//     jobType = json['job_type'];
//    // jobLevel = json['job_level'];
//     jobDescription = json['job_description'];
//     jobSkill = json['job_skill'];
//     compName = json['comp_name'];
//     compEmail = json['comp_email'];
//     compWebsite = json['comp_website'];
//     aboutComp = json['about_comp'];
//     location = json['location'];
//     salary = json['salary'];
//   //  favorites = json['favorites'];
//     expired = json['expired'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['image'] = this.image;
//     data['job_time_type'] = this.jobTimeType;
//     data['job_type'] = this.jobType;
//   //  data['job_level'] = this.jobLevel;
//     data['job_description'] = this.jobDescription;
//     data['job_skill'] = this.jobSkill;
//     data['comp_name'] = this.compName;
//     data['comp_email'] = this.compEmail;
//     data['comp_website'] = this.compWebsite;
//     data['about_comp'] = this.aboutComp;
//     data['location'] = this.location;
//     data['salary'] = this.salary;
//   //  data['favorites'] = this.favorites;
//     data['expired'] = this.expired;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
