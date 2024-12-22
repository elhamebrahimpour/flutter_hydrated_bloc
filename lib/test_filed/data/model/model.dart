class Model {
  final int? id;
  final String? title;

  Model({
    this.id,
    this.title,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}
