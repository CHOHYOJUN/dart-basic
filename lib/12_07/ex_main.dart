void main() {
  Book book1 = Book(
    title: '백년허리',
    publishDate: DateTime(2023, 1, 2),
    commet: '허리건강',
  );

  print('book1 ${book1.hashCode} : ${book1}'); // Book{title: 백년허리, publishDate: 2023-01-01 00:00:00.000, commet: 허리건강}

  Book book2 = Book(
    title: '백년허리',
    publishDate: DateTime(2023, 1, 3),
    commet: '허리건강',
  );
  print('book2 ${book2.hashCode} : ${book2}'); // Book{title: 백년목, publishDate: 2023-01-01 00:00:00.000, commet: 목건강}

  Book book3 = Book(
    title: '백년허리',
    publishDate: DateTime(2023, 1, 2),
    commet: '허리건강',
  );
  print('book3 ${book3.hashCode} : ${book3}'); // Book{title: 백년허리, publishDate: 2023-01-01 00:00:00.000, commet: 허리건강}


  Book book4 = Book(
    title: '백년목',
    publishDate: DateTime(2023, 1, 1),
    commet: '목건강',
  );
  print('book4 ${book4.hashCode} : ${book4}'); // Book{title: 백년목, publishDate: 2023-01-01 00:00:00.000, commet: 목건강}


  print('');

  //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

  List<Book> books =  <Book>[book1, book2, book3, book4];


 // [1-1] 제목과 출간일이 같으면 같은 책으로 판단 한다.
  print('book1 == book2 -> ${book1 == book2} - 날짜가 다름'); // 날짜가 다름
  print('book1 == book3 -> ${book1 == book3} - 제목과 날짜가 같음'); // 제목과 날짜가 같음
  print('book2 == book3 -> ${book2 == book3} - 날짜가 다름'); // 날짜가 다름
  print('book3 == book4 -> ${book3 == book4} - 제목이 다름'); // 제목이 다름


  // [1-2] Set에 넣으면 동일 객체로 판단한다.
  Set<Book> bookSet = Set<Book>.from(books);
  print('bookSet.length : ${bookSet.length}');
  print('');

  // [2] Book인스턴스를 담고 있는 컬렉션에 대해 soet() 출간일 오래된 순서로 정렬하시오.
  print('- 변경 전 -');

  print('List');
  books.forEach((e) => print(e));
  print('');
  print('Set');
  bookSet.forEach((e) => print(e));
  print('');

  print('- 변경 후 -');

  print('List');
  List<Book> sortedBooks = List.from(books)
    ..sort((a, b) => a.publishDate.compareTo(b.publishDate));
  sortedBooks.forEach((e) => print(e));

  print('');

  print('Set');
  Set<Book> sortedSet = Set<Book>.from(
      List.from(books)..sort((a, b) => a.publishDate.compareTo(b.publishDate)));
  sortedSet.forEach((e) => print(e));

}

class Book {
  String title;
  DateTime publishDate = DateTime.now();
  String commet;

  Book({
    required this.title,
    required this.publishDate,
    required this.commet,
  });


  // --
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          publishDate == other.publishDate;

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

  @override
  String toString() {
    return 'Book{title: $title, publishDate: $publishDate, commet: $commet}';
  }


  // 깊은 복사
  Book copyWith({
    String? title,
    DateTime? publishDate,
  }) {
    return Book(
      title: title ?? this.title,
      publishDate: publishDate ?? this.publishDate,
      commet: '',
    );
  }
}
