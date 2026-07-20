const double vatRate = 0.07;

double calcTotal({required int price,required int qty,double discount = 0}){
  return (price * qty - discount) * (1 + vatRate);
}

void main(){
  final String shopName = "Dart Cafe";
  print("ร้าน: $shopName");
  print("อัตราภาษี (vatRate): $vatRate");
  print("---");

  List<String> categories = ["เครื่องดื่ม","อาหาร","ขนม"];
  Map<String,int> menu = {
    "มัจฉะ" : 65,
    "ผัดมาม่า" : 45,
    "ชามะนาว" : 50,
    "ชีสเค้ก" : 95,
  };
  print("หมวดเมนู: $categories");
  print("จำนวนเมนูทั้งหมด: ${menu.length} รายการ");
  print("ราคามัจฉะ: ${menu["มัจฉะ"]} บาท");
  print("---");

  print("เมนูราคาตั้งแต่ 50 บาทขั้นไป");
  for (var i in menu.entries){
    if (i.value >= 50){
      print("${i.key} - ${i.value} บาท");
    }
  }
  print("---");

  double noDiscount = calcTotal(price: 55, qty: 2);
  double yesDiscount = calcTotal(price: 55, qty: 2,discount: 10);
  print("ยอดสุทธิ (ไม่มีส่วนลด): $noDiscount บาท");
  print("ยอดสุทธิ (ส่วนลด 10 บาท): $yesDiscount บาท");
  print("---");

  String? coupon;
  print("ความยาวคูปอง: ${coupon?.length??0}");
  coupon??="NO-COUPON";
  print("คูปองหลังกำหนดค่า: $coupon");
}