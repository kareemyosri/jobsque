class MessageModel {
  final String img;
  final String name;
  final String message;
  final String datetime;
  final bool status;

  MessageModel({
    required this.name,
    required this.img,
    required this.message,
    required this.datetime,
    required this.status,
  });
}

List<MessageModel> messages = [
  MessageModel(
    name: 'Dana',
    img:
    'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTc7JDOG8MO0FUyZdhgbwPbDgVff2AzQeAY2Sjd96snS5mcJGLm',
    message: 'Here is the link: http://zoom.com/abcdeefg',
    datetime: '10.00AM',
    status: false,
  ),
  MessageModel(
    name: 'Shoope',
    img:
    'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTlpvuEUiDglno6-RRq3yS21pjWaHiCllp5DfgG3rqrGK2y1gUL',
    message: 'Let’s keep in touch.',
    datetime: '10.00AM',
    status: false,
  ),
  MessageModel(
    name: 'Slack',
    img:
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5OLpOAHVsss-Ygb0L4xKB72sVfmy34pC1OMMhdgeTCiCUDUmh',
    message: 'Thank You David!',
    datetime: '09.45',
    status: true,
  ),
  MessageModel(
    name: 'Facebook',
    img:
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR82yd3z3FYgoKtPhHd8sdgXjHgxAn58OgblVy53FqgohTRHRKF',
    message: 'Thank you for your attention!',
    datetime: '10.00AM',
    status: false,
  ),
];

