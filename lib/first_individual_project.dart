import 'dart:math';


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
  
  Set<int> matchedNumbersSet = LottoNumbers.intersection(LottoWinningNumbers);// intersection으로 일치하는 번호 찾기
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

  
  return {
    'rank': resultMessage,
    'count': matchCount,
    'matches': matchedNumbersSet.toList()..sort(), 
  };
}


void resetLottoNumbers() {
  LottoNumbers.clear();
}
void resetLottoWinningNumbers() {
  LottoWinningNumbers.clear();
}


void main() {
  // 랜덤으로 당첨 번호 뽑아서 출력.
  List<int> winningNumbers = generateLottoWinningNumbers();
  print('로또 당첨 번호 : $winningNumbers');
  print(' ');

  // 내 로또 번호 랜덤으로 뽑아서 출력.
  List<int> myNumber = generateLottoNumbers();
  print('발급한 로또 번호 : $myNumber');
  print(' ');

  // 로또 당첨 결과 출력
  Map<String, dynamic> result = checkLottoResult();

  // Map에서 각 정보를 꺼내서 변수에 저장
  String resultMessage = result['rank'];
  int matchCount = result['count'];
  List<int> matchedNumbers = result['matches'];

  // 맞은 개수와 번호를 출력.
  print('맞은 개수 : $matchCount 개');
  // 맞은 번호가 1개 이상일때 출력 되도록 입력.
  if (matchCount > 0) {
    print('맞은 숫자 : $matchedNumbers');
  }
  print('당첨 여부 : $resultMessage');
  print(' ');

}
