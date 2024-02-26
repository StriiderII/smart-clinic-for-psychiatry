/*
class MyUser{
  static const String collectionName = 'users';
  String? id;
  String? name;
  String? email;
  String? role;

  MyUser({required this.name, required this.email, required this.id, required this.role});

  MyUser.fromFireStore (Map<String,dynamic>?data):this(
      name : data?['name'],
      email: data?['email'],
      id: data?['id'],
      role: data?['role']


  );
  Map <String, dynamic> toFireStore(){
    return {
      'id' :id,
      'name' : name,
      'email' : email,
      'role' : role
    };
  }
}


*/
