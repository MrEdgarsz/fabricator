class SecurityRequirement {
  SecurityRequirement({
    required this.schemaName,
    this.isRequired = false,
  });

  final String schemaName;
  final bool isRequired;
}
