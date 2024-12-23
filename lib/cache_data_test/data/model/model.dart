class FormModelParams {
  final int? id;
  String? title;
  String? description;

  FormModelParams({
    this.id,
    this.title,
    this.description,
  });

  factory FormModelParams.fromJson(Map<String, dynamic> json) {
    return FormModelParams(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}
