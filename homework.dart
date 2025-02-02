import 'dart:io';

class Product {
  String name = '';
  int price = 0;

  Product();
}

class ShoppingMall extends Product {

  List<Product> Product_list = [];
  List<Product> cartList = [];

  int totalPrice = 0;

  //객체를 리스트에 넣기
  void addProduct(Product product){
    Product_list.add(product);
  }

  //판매하는 상품 목록 보기
  void showProducts(){
    for (var product in Product_list) {
      print('${product.name} / ${product.price}원');
    }
  }

  //구매자가 구매하고 싶은 상품들을 장바구니에 담기
  void addToCart(){
    int inputError = 0;
    print('상품 이름을 입력해 주세요!');
    String? inputItem = stdin.readLineSync();
    print('상품 개수를 입력해 주세요!');
    String? inputnum = stdin.readLineSync();

    for(var product in Product_list){
      if(inputItem==product.name){
        for(int i=0;i<int.parse(inputnum!);i++){
          cartList.add(product);
          inputError++;
        }
        print('장바구니에 상품이 담겼어요');
      }
    }
    if(inputError == 0){
      print('입력값이 잘못 되었습니다!');
    }
  }

  //장바구니에 담은 상품들의 총 가격 보기 
  void showTotal(){
    totalPrice = 0;
    List<String> inCartList = [];
    List<String> showCartList = [];

    for(var product in cartList){
      totalPrice += product.price;
      inCartList.add(product.name);
    }
    showCartList = inCartList.toSet().toList();
    if (totalPrice != 0){
      print('장바구니에 $showCartList 가 담겨있네요. 총 $totalPrice 원 입니다!');

    }else{
      print('장바구니에 담긴 상품이 없습니다!');
    }
  }

}

void printProgram(){
  print('------------------------------------------------------------------------------------------------------');
  print('[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료');
  print('------------------------------------------------------------------------------------------------------');
  
}

void main() {
  printProgram();
  
  ShoppingMall shoppingMall = ShoppingMall();

  //객체 생성
  Product shirt =Product();
  shirt.name = '셔츠';
  shirt.price = 45000;
  shoppingMall.addProduct(shirt);

  Product onePiece =Product();
  onePiece.name = '원피스';
  onePiece.price = 30000;
  shoppingMall.addProduct(onePiece);

  Product shortT =Product();
  shortT.name = '반팔티';
  shortT.price = 35000;
  shoppingMall.addProduct(shortT);

  Product shortPants =Product();
  shortPants.name = '반바지';
  shortPants.price = 35000;
  shoppingMall.addProduct(shortPants);

  Product socks =Product();
  socks.name = '양말';
  socks.price = 5000;
  shoppingMall.addProduct(socks);

  shoppingMall.showProducts();

  int num = 0;

  while(num != 4){

    String? input = stdin.readLineSync();
    num = int.parse(input!);

    switch(num) {
      case 1:
        shoppingMall.showProducts();
        printProgram();
      case 2:
        shoppingMall.addToCart();
        printProgram();
      case 3:
        shoppingMall.showTotal();
        printProgram();
      case 4:
        print('정말 종료하시겠습니까? 5를 입력하면 프로그램이 종료됩니다.');
        String? input = stdin.readLineSync();
        num = int.parse(input!);
        if(num==5){
          num=4;
          print('이용해주셔서 감사합니다!');
        }else{
          printProgram();
        }
      case 6:
        shoppingMall.cartList.clear();
        print('장바구니가 초기화 되었습니다.');
      default:
        print('지원하지 않는 기능입니다. 다시 시도해주세요');
        printProgram();
      }
    }
}