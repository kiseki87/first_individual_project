
import 'dart:math';

// * import 'dart:math'; 를 void main(){ 앞에 입력하여, dart:math 라이브러리의 Random().nextint(int number)을 사용할수 있도록 합니다.
// 도전 과제 관련 필요한 변수와 함수들을 Main 함수 바깥에 입려학여 적용 시킵니다.
// 발급한 복권 번호 저장 Set
Set<int> LottoNumbers = {};    // 발급한 복권 번호 저장 set을 int를 사용하여 중복값 없이 LottoNumbers로 등록합니다.
final Set<int> LottoWinningNumbers = {9, 19, 29, 35, 37, 38};  // 로또 당첨 번호를 변경되지 않도록 final로 고정하여 LottoWinningNumbers로 등록합니다.

// 1. 로또 번호 발급 기능
List<int> generateLottoNumbers() {
  LottoNumbers.clear();                         //출력 된 로또 번호를 초기화 하도록 추가 합니다.
  final Random random = Random();               // random 변수를 final 로 고정하여 입력합니다.
  while (LottoNumbers.length < 6) {             // 반복 문법인 while을 사용하여, 주어진 값이 true일때 계속 반복해서 로또 번호가 6개의 로또 번호를 출력 하게 합니다.
    int randomNumber = random.nextInt(45) + 1;   // 숫자 45개를 기준으로 잡아야하는데 0부터 시작하기 때문에 +1을 하여 1부터 45까지 숫자가 기준이 되도록 합니다.
    LottoNumbers.add(randomNumber);
  }
  List<int> issuedLottoNumbers = LottoNumbers.toList()..sort(); // 리스트로 변환 하여 순서대로 로또 번호가 출력 되도록 합니다.
  return issuedLottoNumbers;          // 발급한 로또 번호에 issuedLottoNumbers가 출력 되도록 지정합니다.
}

// 2. 로또 당첨 여부 확인 기능
String checkLottoResult() {
  int matchCount = 0;
  for (int myNumber in LottoNumbers) {
    if (LottoWinningNumbers.contains(myNumber)) {
      matchCount++;
    }
  }

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
  return resultMessage;
}

// 3. 로또 번호 초기화 기능
void resetLottoNumbers() {
  LottoNumbers.clear();
}

void main() {
  // [Dart 기초] 개인 과제
  // 필수 문제 1번
  // 1. 점수에 맞는 등급 출력하기
  // [설명] 
  // * 제시된 예시 점수에 해당하는 등급을 알맞게 줄력하세요!
  // [조건]
  // * 점수에 따른 등급 기준
  //    - 90점 ~ 100점 : A등급
  //    - 80점 ~ 89점 : B등급
  //    - 80점 이하는 C등급
  // * 예시 점수 : 84점
  // * 출력 형태 : 이 학생의 점수는 [점수]이며, 등급은 [등급]입니다!

  int number = 84; // 예시 점수 84를 number로 등록.
  String name = '- 필수 문제 1번.'; // 문제 제목을 name으로 등록.
  String? name2; // 등급 결과 값을 name2로 등록하고 결과 값이 변경 될 수 있기 때문에 null값을 가질 수 있어서 ?를 추가.

  if (number > 90) {            // 만일 예시 점수가 90보다 클때에는
    name2 = 'A';                // 등록한 등급이 A 로 출력. 
    } else if (number > 80) {   // 또한 만일 예시 점수가 80보다 클때에는
      name2 = 'B';              // 등록한 등급이 B 로 출력.
    } else if (number < 80) {   // 또한 만일 예시 점수가 80보다 작을때에는
      name2 = 'C';              // 등록한 등급이 C 로 출력.
    } 
  print('------------------------------------------------');
  print(' ');
  print(name);
  print(' ');
  print('이 학생의 점수는 $number 점이며, 등급은 $name2 등급이다.');
  print(' ');
  print('------------------------------------------------');


  // [Dart 기초] 개인 과제
  // 필수 문제 2번
  // 1. 구매자가 장바구니에 담은 상품 목록을 볼 수 있는 기능
  // [설명]
  // * 구매자의 장바구니에 담겨 있는 물품들의 전체 금액을 계산합니다.
  // [조건]
  // * 현재 가게에서 판매하고 있는 상품들과 각각의 가격은 다음과 같습니다.
  //    - 티셔츠 : 10,000원
  //    - 바지 : 8,000원
  //    - 모자 : 4,000원
  // * 구매자의 장바구니 품목들이 아래 리스트와 같다면, 물품의 전체 금액을 계산하여 출력하세요!
  List<String> cart = ['티셔츠', '바지', '모자', '티셔츠','바지'];
  // * 출력 형태 : 장바구니에 35,000원 어치를 담으셨네요!

  // 2. 전체 구매 예정 금액에 따른 할인 여부를 확인하는 기능
  // [설명]
  // * 1번에서 구한 상품들의 총 가격에 따라 할인 여부를 계산하여 출력합니다.
  // [조건]
  // * 상품들의 총 가격이 2만원이 넘은 경우
  //  - 할인 금액 : [1번에서 구한 가격의 10%]원 을 출력합니다.
  // * 상품들의 총 가격이 2만원이 넘지 않은 경우
  //  - 해당 경우에는 따로 관련 내용을 출력 하지 않습니다.
  // * 출력 형태 : 할인 금액 : 4,000원

  // 3. 구매자가 결제해야 될 최종 금액을 확인하는 기능
  // [설명]
  // * 1번과 2번 과정을 통해 계산된 최종 결제 금액을 계산하여 출력합니다.
  // * 할인이 적용된 경우, 할인 금액이 차감 된 최종 금액을 출력해야 합나다.
  // [조건]
  // * 출력 형태 : 최종 결제 금액은 25,000원 입니다.

String name3 = '- 필수 문제 2번.';   // 두번째 문제 메족을 name3 으로 등록.
 Map<String, int> itemcost = {    // 삼품 이름과 가격을 매핑하여 상품이름과 가격이 연동 되도록 itemcost로 등록.
  '티셔츠' : 10000,
  '바지' : 8000,
  '모자' : 4000
 };

int totalcost = 0;                // 제품의 총 합계 가격의 변수를 0으로 등록하여, 카트 내의 상품의 가격 합계를 totalcost로 나오도록 하였습니다.

for (String item in cart ) {           // cart에 등록된 제품들로 합계 가격을 구합니다.
  if(item == '티셔츠') {                //  만일 티셔츠라는 아이템이 있다면
    totalcost += itemcost['티셔츠']!;   //  totalcost에 티셔츠 가격을 더하고
  }else if(item == '바지') {           //  만일 바지라는 아이테임이 있다면
    totalcost += itemcost['바지']!;    // totalcost에 바지 가격을 더하고
  }else if(item == '모자') {           // 만일 모자라는 아이템이 있다면
    totalcost += itemcost['모자']!;    // totalcost에 모자 가격을 더합니다.
  }
}

double finalcost = totalcost.toDouble();     // 최종 결제 금액으로 나온 finalcost를 totalcost를 실수로 변경하여 등록하고.
int discountcost = 0;                        // 할인 금액을 0으로 등록하고
if(totalcost > 20000) {                              // 만일 totalcost가 2만원을 넘을 경우
  discountcost = (totalcost * 0.1).round();          // totalcost의 10%의 가격이 할인 금액으로 나오도록 하고 소수점 금액을 반올림 하도록 .round를 추가하여
  finalcost = (totalcost - discountcost.toDouble()); // 최종 결제 금액은 totalcost에서 할인금액을 뺀 가격이 나오도록 하였습니다.
}
print(' ');
print(name3);
print(' ');
print('장바구니에 $totalcost 원 어치를 담으셨네요.');
print(' ');
print('할인 금액 : $discountcost 원.');
print(' ');
print('최종 결제 금액은 $finalcost 원 입니다!');
print(' ');
print('------------------------------------------------');


// [Dart 기초] 개인 과제
// 도전 문제.
// 1. 중복 없이 번호를 추첨하여 복권을 발급하는 기능.
// [설명]
// * 1~45사이의 숫자들 중 6개의 숫자를 중복 없이 뽑아 하나의 복권(리스트)로 만듭니다.
// [조건]
// * 출력 형태 : 발급한 로또 번호 : [로또 번호 목록 전체]

// 2. 발급한 복권의 번호와 당첨 번호 비교 기능.
// [설명]
// * 앞서 발급한 복권 번호를 지정된 당첨 번호와 비교하여, 일치하는 번호의 개수를 세고 담청 등수를 판정합니다.
// [조건]
// - 당천번호 : [9, 19, 29, 35, 37, 38]
// - 1등 : 5개 이상 일치
// - 2등 : 4개 일치
// - 3등 : 3개 일치
// - 실패 : 2개 이하 일치
// * 출력 형태 : 
// - 당첨이 되었을 경우 : 당첨 여부 [당첨 등수] 를 출력.
// - 단, 당첨에 실패한 경우 : 당첨 여부 : 당첨 실패! 를 출력.

// 3. 발급한 로또를 초기화 할 수 있는 기능
// [설명]
// * 당첨 번호 조회 이후, 다음 당첨 여부 조회를 위해 복권 번호를 초기화
// [조건]
// * 추후에 당첨 여부를 다시 확인할 수 있도록 복권 번호를 초기 상태로 되돌린 뒤, 현재 상태를 출력
// * 출력 형태 : 현재 발금한 로또 번호 : [ ]

  print(' ');
  print('- 도전 문제.');
  print(' ');
  
  List<int> myNumber = generateLottoNumbers();  //랜덤으로 로또 번호를 발급합니다.
  print('발급한 로또 번호 : $myNumber');
  print(' ');

  String resultMessage = checkLottoResult(); // 당첨번호와 발급된 번호를 대조하여 당첨 여부를 확인 하고 메세지를 출력합니다.
  print('당첨 여부 : $resultMessage');
  print(' ');

  resetLottoNumbers();                       // 발급된 로또 번호를 초기화 합니다.
  print('현재 발급한 로또 번호 : ${LottoNumbers.toList()}');
  print(' ');
  print('------------------------------------------------');
}

