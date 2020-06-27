
class Card {
  int id;
  String title;
  String content;

  Card({this.id,  this.title, this.content});

  Card.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    content = map['content'];
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'content': content};
  }

  @override
  String toString() {
    return ' id: $id, titulo: $title, conteudo: $content';
  }
}