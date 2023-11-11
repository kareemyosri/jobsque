class NotificationSettingsModel {
  final String label;
    bool mode;

  NotificationSettingsModel({required this.label, required this.mode});
}

List<NotificationSettingsModel> notificationettings = [
  NotificationSettingsModel(label: 'Your Job Search Alert', mode: true),
  NotificationSettingsModel(label: 'Job Application Update', mode: true),
  NotificationSettingsModel(label: 'Job Application Reminders', mode: false),
  NotificationSettingsModel(label: 'Jobs You May Be Interested In', mode: true),
  NotificationSettingsModel(label: 'Job Seeker Updates', mode: false),
];

List<NotificationSettingsModel> otherNotificationettings = [
  NotificationSettingsModel(label: 'Show Profile', mode: true),
  NotificationSettingsModel(label: 'All Message', mode: true),
  NotificationSettingsModel(label: 'Message Nudges', mode: true),
];
