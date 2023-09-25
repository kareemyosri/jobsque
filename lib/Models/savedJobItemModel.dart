class SavedJobModel {
  final String jobDescription;
  final String img;
  final String company;
  final String hqLocation;
  final String date;
  final String status;

  SavedJobModel(this.jobDescription,
      this.img,
      this.company,
      this.hqLocation,
      this.date,
      this.status,);
}
  List<SavedJobModel> savedJobs = [
    SavedJobModel(
      'Senior UI Designer',
      'https://cdn-icons-png.flaticon.com/128/3536/3536424.png',
      'Twitter',
      'Jakarta, Indonesia',
      'Posted 2 days ago',
      'Be an early applicant',
    ),
    SavedJobModel(
      'UI Designer',
      'https://user-images.githubusercontent.com/7525670/32147678-675e7bb4-bceb-11e7-8896-cc6078f44047.png',
      'Spectrum',
      'Jakarta, Indonesia',
      'Posted 2 days ago',
      'Be an early applicant',
    ),
    SavedJobModel(
      'Senior UI Designer',
      'https://cdn-icons-png.flaticon.com/128/3536/3536582.png',
      'VK',
      'Yogyakarta, Indonesia',
      'Posted 2 days ago',
      'Be an early applicant',
    ),
    SavedJobModel(
      'Senior UX Designer',
      'https://cdn-icons-png.flaticon.com/128/2111/2111370.png',
      'Discord',
      'Jakarta, Indonesia',
      'Posted 2 days ago',
      'Be an early applicant',
    ),
    SavedJobModel(
      'Senior UI Designer',
      'https://cdn-icons-png.flaticon.com/128/5968/5968723.png',
      'Invision',
      'Jakarta, Indonesia',
      'Posted 2 days ago',
      'Be an early applicant',
    ),
  ];
