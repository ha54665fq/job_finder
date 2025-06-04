class Policy {
  final int id;
  final String title;
  final String content;

  Policy({
    required this.id,
    required this.title,
    required this.content,
  });

  factory Policy.fromJson(Map<String, dynamic> json) {
    return Policy(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
    );
  }
} 