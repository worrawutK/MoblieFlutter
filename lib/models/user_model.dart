class UserModel{
  //field
  String id,resultCode,name,surName;

  //Constructor
  UserModel(this.id,this.resultCode,this.surName);

  UserModel.fromJSON(Map<String,dynamic> map){
    print(map['id']);
    print(map['ResultCode']);
     print(map['Name']);
      print(map['Surname']);
    id = map['id'];
    resultCode = map['ResultCode'];
    name = map['Name'];
    surName = map['Surname'];
  }
}