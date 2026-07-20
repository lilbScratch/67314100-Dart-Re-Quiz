Future<Map<String,dynamic>> fetchOrder(int orderid) async{
  await Future.delayed(Duration(seconds: 2));
  if (orderid <= 0) {
    throw Exception("รหัสคำสั่งซื้อไม่ถูกต้อง");
  }

  return {
    "id" : orderid,
    "menu" : "ลาเต้",
    "total" : 65.0,
  };
}

Stream<String> trackOrder() async*{
  await Future.delayed(Duration(seconds: 1));
  yield "รับออเดอร์แล้ว";
  await Future.delayed(Duration(seconds: 1));
  yield "กำลังจัดทำ";
  await Future.delayed(Duration(seconds: 1));
  yield "จัดส่งเรียบร้อย";
}

void main() async {
  print("เริ่มโหลดข้อมูล");

  try{
    var order = await fetchOrder(7);
    print("ได้ข้อมูลออเดอร์: $order");
  } catch (e) {
    print("เกิดข้อผิดพลาด $e");
  } finally {
    print("จบรายการ");
  }
  print("---");
  try{
    var order = await fetchOrder(0);
    print("ได้ข้อมูลออเดอร์: $order");
  } catch (e) {
    print("เกิดข้อผิดพลาด $e");
  } finally {
    print("จบรายการ");
  }
  print("---");

  await for (var i in trackOrder()){
    print("สถานะ: $i");
  }
  print("ติดตามสถานะเสร็จสิ้น");
}