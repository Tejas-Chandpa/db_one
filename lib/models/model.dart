class UserModel{
  late final  int? id;
    late final String name,email,pass;
    late final int mob;


    UserModel();

    UserModel.map(dynamic obj)
    {
      name = obj ['name'];
      email = obj ['email'];
      pass = obj['pass'];
      mob = obj ['mob'];
    }
    Map<String,dynamic> toMap()
    {
      var map = <String,dynamic>{};
      map['email']=email;
      map['name']=name;
      map['pass']=pass;
      map['mob']=mob;
      return map;
    }

    // UserModel({this.id,required this.pass,required this.name,required this.email,required this.mob});

    // Map<String,dynamic> toMap()
    // {
    //     return{
    //          'id':id,'name':name, 'email':email, 'mob':mob,'pass':pass
    //     };
    // }

    // UserModel.fromMap(Map<String,dynamic>map, this.id, this.name, this.email, this.mob)
    // {
    //   id=map['id'];
    //   name=map['name'];
    //   email=map['email'];
    //   mob=map['mob'];
    // }

   //  @override
   // String toString()
   //  {
   //      return 'UserModel{id:$id,name:$name,email:$email,mob:$mob,pass:$pass}';
   //  }
}


