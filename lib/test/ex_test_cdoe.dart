import 'dart:io';

import 'package:test/test.dart';

import 'dart:math';
import 'dart:core';

import '../12_18/ex_post.dart';
import '../12_18/ex_post_manager.dart';
import '../12_18/ex_post_repository.dart';

void main() {
  // 연습문제 2
  test('짝수면 true를 반환해야 한다.', () {
    // given
    int number = 4;

    // when
    bool result = isEven(number: number);

    // then
    expect(result, true);
  });

  // 연습문제 3
  test('가장 큰 수를 반환해야 한다.', () {
    // given
    List<int> numbers = [2, 5, 1, 9, 3];

    // when
    int result = findMax(numbers: numbers);

    // then
    expect(result, 9);
  });

  // 연습문제 4
  test('문자열을 반대로 정렬해야 한다.', () {
    // given
    String inputString = 'Hello';

    // when
    String result = reverseString(inString: inputString);

    // then
    expect(result, 'olleH');
  });

  // 연습문제 5
  group('PostManager', () {

    late PostManager pm;
    List<Post> postList;
    late Post post1;
    late Post post2;
    late Post post3;

    setUp(() {
      pm = PostManager(repository: MockPostMemoryRepositoryImpl());
      postList = [];
      post1 = Post(id: 1, title: '제목1', contents: '내용1');
      post2 = Post(id: 2, title: '제목2', contents: '내용2');
      post3 = Post(id: 3, title: '제목3', contents: '내용3');
    });

    test('저장, 검색 기능', () async {
      // given
      await pm.addPost(post1);
      await pm.addPost(post2);
      await pm.addPost(post3);

      // when
      postList = await pm.getPosts();

      // then
      expect(postList.length, 3);
      expect(postList[0], post1);
      expect(postList[1], post2);
      expect(postList[2], post3);
    });

    test('삭제 기능', () async {
      // given
      await pm.addPost(post1);
      await pm.addPost(post2);
      await pm.addPost(post3);

      // when
      await pm.deletePost(post1);
      postList = await pm.getPosts();

      // then
      expect(postList.length, 2);
      expect(postList[0], post2);
      expect(postList[1], post3);
    });

    test('수정 기능', () async {
      // given
      await pm.addPost(post1);
      await pm.addPost(post2);
      await pm.addPost(post3);

      // when
      post3.title = 'post3 title';
      post3.contents = 'post3 content';
      await pm.updatePost(post3);
      postList = await pm.getPosts();

      // then
      expect(postList[2].id, 3);
      expect(postList[2].title, 'post3 title');
      expect(postList[2].contents, 'post3 content');
    });

  }); // group() - end
}  // main() - end

// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

/// 연습문제 2,3,4
bool isEven({required int number}) => number.isEven;

int findMax({required List<int> numbers}) => numbers.reduce(max); // dart:math

// split('')으로 각각 분할 -> 문자열 순서 뒤깁기 -> 문자열 함치기
String reverseString({required String inString}) => inString.split('').reversed.join(); // dart:core

// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

/// 연습문제 5
/// 메모리 저장
class MockPostMemoryRepositoryImpl implements PostRepository {
  List<Post> posts = [];

  @override
  Future<List<Post>> getPosts() async => posts.toList();

  @override
  Future<void> addPost(Post post) async => posts.add(post);

  @override
  Future<void> deletePost(Post post) async => posts.remove(post);

  @override
  Future<void> updatePost(Post post) async => posts.map((e) => e.id == post.id ? post : e ).toList();
}

// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

/// 파일 저장
class PostFileRepositoryImpl implements PostRepository {
  File file = File('lib/12_18/assets/postSave.txt');

  @override
  Future<void> addPost(Post post) async => file.writeAsString(post.toString());

  @override
  Future<void> deletePost(Post post) {
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getPosts() {
    throw UnimplementedError();
  }

  @override
  Future<void> updatePost(Post post) {
    throw UnimplementedError();
  }
}