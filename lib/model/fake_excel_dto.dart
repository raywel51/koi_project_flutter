class FakeExcelDto {
  final dynamic title; // Using dynamic to handle both int and string
  final String band;
  final int release;
  final String label;

  FakeExcelDto({
    required this.title,
    required this.band,
    required this.release,
    required this.label,
  });

  factory FakeExcelDto.fromJson(Map<String, dynamic> json) {
    return FakeExcelDto(
      title: json['title'] ?? '', // Handle null case or set a default value
      band: json['band'] ?? '',
      release: json['release'] ?? 0,
      label: json['label'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'band': band,
      'release': release,
      'label': label,
    };
  }
}
