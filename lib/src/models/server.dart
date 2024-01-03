class Server {
  Server({
    required this.url,
    this.description,
  });

  final String url;
  final String? description;

  @override
  bool operator ==(covariant Server other) {
    if (identical(this, other)) return true;

    return other.url == url && other.description == description;
  }

  @override
  int get hashCode => url.hashCode ^ description.hashCode;

  @override
  String toString() => 'Server(url: $url, description: $description)';
}
