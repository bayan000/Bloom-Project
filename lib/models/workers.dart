
/*id": 6,
            "first_name": "bayan",
            "last_name": "khd",
            "user_type": "user",
            "email": "bayan.khaddir00@gmail.com",
            "verified": 1,
            "otp": "8529",
            "phone": "0967290891",
            "location": "دمشق",
            "iD_card": null,
            "personal_photo": null,
            "property_deed": null,
            "clean_record": null,
            "created_at": "2024-05-19T07:37:10.000000Z",
            "updated_at": "2024-05-19T07:38:37.000000Z"*/
class user2{
  final String? first_name,otp,last_name,user_type,email,property_deed,clean_record,location,iD_card,personal_photo,created_at,updated_at,phone;
  int verified;
  user2({this.property_deed, this.clean_record,
    this.created_at,this.updated_at,
    this.location,this.phone,this.first_name,this.email,this.last_name,
    this.iD_card,required this.otp,this.personal_photo,this.user_type,required this.verified
  });
}
List user2_list_item = [
  user2(
    verified: 1,
    otp: "0000",
    location: "دمشق",
    phone: "0987654321",
    first_name: "فلان",
    last_name: "الفلاني",
    email: "user@gmail.com",
    personal_photo: "photo",
    user_type: "investor",

  ),
];
