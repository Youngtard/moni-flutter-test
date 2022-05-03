class LoanStatus {
  LoanStatus({
    this.id,
    this.name,
    this.label,
    this.description,
    this.createdAt,
    this.modifiedAt,
  });

  int? id;
  String? name;
  String? label;
  String? description;
  DateTime? createdAt;
  DateTime? modifiedAt;

  factory LoanStatus.fromJson(Map<String, dynamic> json) => LoanStatus(
    id: json["id"],
    name: json["name"],
    label: json["label"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    modifiedAt: DateTime.parse(json["modified_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "label": label,
    "description": description,
    "created_at": createdAt!.toIso8601String(),
    "modified_at": modifiedAt!.toIso8601String(),
  };
}
