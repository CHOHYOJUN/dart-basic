class Post {
  int id;
  String title;
  String contents;

  Post({
    required this.id,
    required this.title,
    required this.contents,
  });

  @override
  String toString() {
    return 'Post{id: $id, title: $title, contents: $contents}';
  }
}
