class Channel {
  final String id;
  final String name;
  final String url;
  final String? logo;
  final String? group;

  Channel({
    required this.id,
    required this.name,
    required this.url,
    this.logo,
    this.group,
  });

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      id: json['id'] ?? '',
      name: json['name'] ?? '未知频道',
      url: json['url'] ?? '',
      logo: json['logo'],
      group: json['group'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'logo': logo,
      'group': group,
    };
  }
}
