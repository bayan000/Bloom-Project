/*"id": 1,
            "project_id": 7,
            "investor_id": 2,
            "status": 0,
            "created_at": "2024-05-12T19:52:48.000000Z",
            "updated_at": "2024-05-12T19:52:48.000000Z"*/
class communicationRequest{
  final String? created_at,updated_at;
  int id,project_id,investor_id,status;

  communicationRequest({ this.created_at, this.updated_at, required this.project_id,required this.id,required this.investor_id,required this.status});

}
List communicationRequest_list_item = [
  communicationRequest(status: 0, project_id: 0, id: 0, investor_id: 0,

  ),
];
