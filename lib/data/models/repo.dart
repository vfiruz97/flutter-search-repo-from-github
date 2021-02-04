class Repository {
  final String name;
  final String login;
  final String avatarUrl;
  final String updatedAt;
  final String stargazersCount;

  Repository({
    this.name,
    this.login,
    this.avatarUrl,
    this.updatedAt,
    this.stargazersCount,
  });

  Repository.fromJson(Map<String, dynamic> json)
      : name = json['name'].toString() ?? "Unknow",
        login = json['owner']['login'].toString() ?? "Unknow",
        avatarUrl = json['owner']['avatar_url'] ?? "Unknow",
        updatedAt = _changeDateFormat(json['updated_at'].toString()),
        stargazersCount = json['stargazers_count'].toString();
}

String _changeDateFormat(String date) {
  const List<String> months = [
    "января",
    "февраля",
    "марта",
    "апреля",
    "мая",
    "июня",
    "июля",
    "августа",
    "сентября",
    "октября",
    "ноября",
    "декабря"
  ];
  try {
    final dateTime = DateTime.parse(date);
    return "${dateTime.day} " + months[dateTime.month - 1];
  } catch (e) {
    return "Unknow";
  }
}
