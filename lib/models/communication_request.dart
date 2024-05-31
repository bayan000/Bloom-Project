
class communicationRequest{
  final String? created_at,updated_at;
  int id,project_id,investor_id,status;

  communicationRequest({ this.created_at, this.updated_at, required this.project_id,required this.id,required this.investor_id,required this.status});

}
List communicationRequest_list_item = [
  communicationRequest(status: 0, project_id: 0, id: 0, investor_id: 0,

  ),
];
