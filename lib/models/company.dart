class Company {
  final int id;
  final String name;
  final String logoUrl; // Assuming logo URL will be provided

  Company({
    required this.id,
    required this.name,
    required this.logoUrl,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      logoUrl: json['logo_url'] as String? ?? '',
    );
  }
} 