class Tag {
  Tag({
    required this.name,
    required this.description,
  });
  final String name;
  final String description;

  @override
  bool operator ==(covariant Tag other) {
    if (identical(this, other)) return true;

    return other.name == name && other.description == description;
  }

  @override
  int get hashCode => name.hashCode ^ description.hashCode;

  @override
  String toString() => 'Tag(name: $name, description: $description)';
}
