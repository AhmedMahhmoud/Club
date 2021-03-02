class NotificationMessage {
  String title;
  String message;
  String dateTime;
  String category;
  int id;
  int messageSeen = 0;
  NotificationMessage(
      {this.dateTime,
      this.message,
      this.title,
      this.messageSeen,
      this.id,
      this.category});
}
