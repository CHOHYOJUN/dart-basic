void main() {
  ///  [실습1] i 번째 글자가 모음인지 알려주는 isVowel() 함수를 완성하시오
  ///  영어에서의 모음은 a, e, i, o, u 다섯가지이다

  String word = 'asldkfowkldklfadf';

  bool isVowel(int i) => ['a', 'e', 'i', 'o', 'u'].contains(word.substring(i, i + 1));

  print(isVowel(5));


}
