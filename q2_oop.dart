abstract class MenuItem{
  final String name;
  final double baseprice;

  static int itemCount = 0;

  MenuItem(this.name,this.baseprice){
    itemCount++;
  }

  double price();

  void show(){
    print("$name - ${price()} บาท");
  }
}

class Drink extends MenuItem{
  int toppings;

  Drink(String name,double baseprice,this.toppings) : super(name,baseprice);

  @override
  double price() {
    return baseprice * (10*toppings);
  }
}

class Food extends MenuItem{
  String size;

  Food(String name,double baseprice,this.size) : super(name,baseprice);

  @override
  double price() {
    switch(size){
      case 's':
      return baseprice * 1.0;
      case 'm':
      return baseprice * 1.2;
      case 'l':
      return baseprice * 1.5;
      default:
      return baseprice;
    }
  }
}

class Wallet{
  double _balance = 0;

  double get balance => _balance;

  set balance(double amount){
    if (amount >= 0){
      _balance = amount;
    } else{
      print("ยอกเงินติดลบไม่ได้");
    }
  }

  bool pay(double amount){
    if (_balance>=amount){
      _balance-=amount;
      print("ชำระเงินสำเร็จ");
      return true;
    } else{
      print("ยอดเงินไม่พอ");
      return false;
    }
  }
}

enum OrderStatus {pending,paid,cancelled}

void showStatus(OrderStatus status){
  switch(status){
    case OrderStatus.pending:
    print("สถานะ: รอชำระเงิน");
    case OrderStatus.paid:
    print("สถานะ: ชำระเงินแล้ว");
    case OrderStatus.cancelled:
    print("สถานะ: ยกเลิกคำสั้งซื้อ");
  }
}

void main(){
  List<MenuItem> order = [
    Drink("ลาเต้", 65, 1),
    Food("ข้าวผัด", 60, 'l'),
    Drink("อเมริกาโน่", 45, 0)
  ];

  double sum = 0;
  for (var i in order){
    i.show();
    sum+=i.price();
  }
  print("ยอดรวมทั้งสิ้น: $sum บาท");
  print("---");

  Wallet wallet = Wallet();
  wallet.balance = 300;
  wallet.balance = -300;
  wallet.pay(200);
  showStatus(OrderStatus.paid);
  print("ยอดคงเหลือ: ${wallet.balance} บาท");
  wallet.pay(200);
  showStatus(OrderStatus.pending);
  print("ยอดคงเหลือ: ${wallet.balance} บาท");
  print("---");  

  print("จำนวนรายการที่ถูกสร้าง: ${MenuItem.itemCount}");
}