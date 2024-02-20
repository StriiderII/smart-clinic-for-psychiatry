class MyUser{
  static const String collectionName = 'users';
  String? id;
  String? name;
  String? email;
  String? role;
  String? token;
  String? phone;

  MyUser({required this.name, required this.email, required this.id,
  required this.role, required this.token, required this.phone});

  MyUser.fromFireStore (Map<String,dynamic>?data):this(
    name : data?['name'],
    email: data?['email'],
    id: data?['id'],
    role: data?['role'],
    token: data?['token'],
    phone: data?['phone']


  );
  Map <String, dynamic> toFireStore(){
    return {
      'id' :id,
      'name' : name,
      'email' : email,
      'role' : role,
      'token' : token,
      'phone' : phone
    };
  }
}


