class OnboardingModel {
  String image;
  String title;
  String body;

  OnboardingModel(this.image, this.title, this.body);

  static List<OnboardingModel> boardingData=[
    OnboardingModel("assets/images/onboarding/Background.svg"  , "Find a job, and start building your career from now on", "Explore over 25,924 available job roles and upgrade your operator now."),
    OnboardingModel("assets/images/onboarding/Background22.svg", "Hundreds of jobs are waiting for you to join together", "Immediately join us and start applying for the job you are interested in."),
    OnboardingModel("assets/images/onboarding/Background (2).svg", "Get the best choice for the job you've always dreamed of", "The better the skills you have, the greater the good job opportunities for you."),

  ];
}