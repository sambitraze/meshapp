class ChatModel {
  var name;
  var image;
  var id;
  var message;
  var time;
  bool? isOnline;
  var status;

  ChatModel(
      {this.id,
      this.image,
      this.isOnline,
      this.message,
      this.name,
      this.status,
      this.time});
}
