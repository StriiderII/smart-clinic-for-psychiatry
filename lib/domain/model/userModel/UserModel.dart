class MyUser {
  static const String collectionName = 'users';
  String? id;
  String? name;
  String? email;
  String? role;
  String? phone;

  MyUser({required this.name, required this.email, required this.id,
    required this.role, required this.phone});

  MyUser.fromFireStore (Map<String,dynamic>? data):this(
      name : data?['name'],
      email: data?['email'],
      id: data?['id'], // Assign UID to the id field
      role: data?['role'],
      phone: data?['phone']
  );

  Map <String, dynamic> toFireStore(){
    return {
      'id' : id,
      'name' : name,
      'email' : email,
      'role' : role,
      'phone' : phone
    };
  }
}
