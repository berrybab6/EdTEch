class Comment {
  final int id;
  final String comment;
  final int like;
  final int dislike;
  final DateTime created_on;
  final int user;

  Comment(
      {this.id,
      this.comment,
      this.like,
      this.dislike,
      this.created_on,
      this.user});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
        id: json['id'],
        comment: json['comment'],
        like: json['like'],
        dislike: json['dislike'],
        created_on: json['created_on'],
        user: json['user']);
  }
}
