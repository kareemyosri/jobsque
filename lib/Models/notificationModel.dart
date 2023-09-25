class NotificationModel {
  final String img;
  final String company;
  final String subtitle;
  final String datetime;
  final bool status;

  NotificationModel({
    required this.company,
    required this.img,
    required this.subtitle,
    required this.datetime,
    required this.status,
  });
}

List<NotificationModel> notifications = [
  NotificationModel(
    company: 'Dana',
    img:
    'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTc7JDOG8MO0FUyZdhgbwPbDgVff2AzQeAY2Sjd96snS5mcJGLm',
    subtitle: 'Posted new design jobs',
    datetime: '10.00AM',
    status: false,
  ),
  NotificationModel(
    company: 'Shoope',
    img:
    'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTlpvuEUiDglno6-RRq3yS21pjWaHiCllp5DfgG3rqrGK2y1gUL',
    subtitle: 'Posted new design jobs',
    datetime: '10.00AM',
    status: true,
  ),
  NotificationModel(
    company: 'Slack',
    img:
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5OLpOAHVsss-Ygb0L4xKB72sVfmy34pC1OMMhdgeTCiCUDUmh',
    subtitle: 'Posted new design jobs',
    datetime: '10.00AM',
    status: false,
  ),
  NotificationModel(
    company: 'Facebook',
    img:
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR82yd3z3FYgoKtPhHd8sdgXjHgxAn58OgblVy53FqgohTRHRKF',
    subtitle: 'Posted new design jobs',
    datetime: '10.00AM',
    status: false,
  ),
];

List<NotificationModel> yesterdayNotifications = [
  NotificationModel(
    company: 'Email setup successful',
    img:
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKoDW0Vrgi_Iuxlfytz4nSR9OZQzyS7mB3sA&usqp=CAU',
    subtitle:
    'Your email setup was successful with the following details: Your new email is rafifdianganz@gmail.com.',
    datetime: '10.00AM',
    status: false,
  ),
  NotificationModel(
    company: 'Welcome to Jobsque',
    img:
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfBX_LSwaArfKtnzSouf0REDz2OeWg9_XYgQ&usqp=CAU',
    subtitle:
    'Hello Rafif Dian Axelingga, thank you for registering Jobsque. Enjoy the various features that....',
    datetime: '08.00AM',
    status: true,
  ),
];