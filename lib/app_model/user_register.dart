class UserModel {
  dynamic id;
  final String? token;

  UserModel({
    this.id,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        token = json['token'] as String?;

  Map<String, dynamic> toJson() => {'id': id, 'token': token};
}
