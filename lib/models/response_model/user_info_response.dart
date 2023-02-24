class UserInfo {
  final String? name;

  UserInfo({this.name});

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }

    return result;
  }

  factory UserInfo.fromJson(Map<String, dynamic> map) {
    return UserInfo(
      name: map['name'],
    );
  }
}
