
class transaction{
  final String? name, discount;
  int price,project_id,id;
  transaction({
    required this.project_id, required this.price,
    required this.id,this.name,this.discount
});


}
List transaction_list_item = [
  transaction(
      id:0,name: "معاملة تثبيت ملكية", discount: "50%",project_id: 0, price: 50
  ),
];
