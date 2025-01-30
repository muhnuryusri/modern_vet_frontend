class FeedbackEntity {
  FeedbackEntity({
    required this.id,
    required this.name,
    required this.petName,
    required this.rating,
    this.comments,
  });

  int id;
  String name;
  String petName;
  int rating;
  String? comments;
}
