class project {
  final String? description, location, amount, feasibilitystudy;
  int id;

  project({ this.description, this.location, this.amount,this.feasibilitystudy,required this.id});
}

List project_list_item = [
  project(
    id:0,
    description: "مشروع حياكة",
    location: "دمشق",
    amount: "3000000",
  ),
];
