import 'dart:math';

// 전역 변수: 로또 번호와 당첨 번호를 저장할 Set
Set<int> LottoNumbers = {};
Set<int> LottoWinningNumbers = {};

// 1. 내 로또 번호 생성 함수
List<int> generateLottoNumbers() {
  LottoNumbers.clear();
  final Random random = Random();
  while (LottoNumbers.length < 6) {
    int randomNumber = random.nextInt(45) + 1;
    LottoNumbers.add(randomNumber);
  }
  List<int> issuedLottoNumbers = LottoNumbers.toList()..sort();
  return issuedLottoNumbers;
}

// 2. 당첨 번호 생성 함수
List<int> generateLottoWinningNumbers() {
  LottoWinningNumbers.clear();
  final Random random = Random();
  while (LottoWinningNumbers.length < 6) {
    int randomNumber = random.nextInt(45) + 1;
    LottoWinningNumbers.add(randomNumber);
  }
  List<int> issuedWinningNumbers = LottoWinningNumbers.toList()..sort();
  return issuedWinningNumbers;
}

// 3. 당첨 여부 확인 기능 (반환 타입을 Map으로 변경!)
Map<String, dynamic> checkLottoResult() {
  // intersection으로 일치하는 번호를 아주 쉽게 찾을 수 있습니다.
  Set<int> matchedNumbersSet = LottoNumbers.intersection(LottoWinningNumbers);
  int matchCount = matchedNumbersSet.length;

  String resultMessage;
  if (matchCount >= 5) {
    resultMessage = "1등";
  } else if (matchCount == 4) {
    resultMessage = "2등";
  } else if (matchCount == 3) {
    resultMessage = "3등";
  } else {
    resultMessage = "당첨 실패";
  }

  // 결과 메시지, 맞은 개수, 맞은 번호 목록을 Map에 담아 반환합니다.
  return {
    'rank': resultMessage,
    'count': matchCount,
    'matches': matchedNumbersSet.toList()..sort(), // 보기 좋게 정렬
  };
}

// 4. 초기화 함수
void resetLottoNumbers() {
  LottoNumbers.clear();
}
void resetLottoWinningNumbers() {
  LottoWinningNumbers.clear();
}

// ===== 프로그램 실행 =====
void main() {
  // 당첨 번호 생성 및 출력
  List<int> winningNumbers = generateLottoWinningNumbers();
  print('로또 당첨 번호 : $winningNumbers');
  print(' ');

  // 내 로또 번호 생성 및 출력
  List<int> myNumber = generateLottoNumbers();
  print('발급한 로또 번호 : $myNumber');
  print(' ');

  // 결과 확인 (이제 Map으로 결과를 받습니다)
  Map<String, dynamic> result = checkLottoResult();

  // Map에서 각 정보를 꺼내서 변수에 저장
  String resultMessage = result['rank'];
  int matchCount = result['count'];
  List<int> matchedNumbers = result['matches'];

  // 요청하신 대로 맞은 개수와 번호를 추가로 출력합니다!
  print('맞은 개수 : $matchCount 개');
  // 맞은 번호는 1개 이상일 때만 보여주는 것이 더 깔끔합니다.
  if (matchCount > 0) {
    print('맞은 숫자 : $matchedNumbers');
  }
  print('당첨 여부 : $resultMessage');
  print(' ');

}
