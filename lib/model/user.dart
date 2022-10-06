class User {
  int? userId;
  int? id;
  String? title;
  String? body;

  User({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}
