class Complaint{
  final String? description, created_at,updated_at;
  int id,project_id,investor_id;
  Complaint({this.updated_at,this.description,this.created_at,required this.id,required this.investor_id,required this.project_id});


}
List complaint_list_item = [
  Complaint(
      id: 0, project_id: 0,investor_id: 0, description: "يوجد مشكلة في البيانات المقدمة", created_at: "7-9-2023",updated_at: "19-5-2024"
  ),
];