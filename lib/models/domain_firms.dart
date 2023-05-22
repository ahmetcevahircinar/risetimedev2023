class DomainFirms {
  final String? id;
  final String? name;
  final String? loginname;
  final String? loginpassword;
  final String? web;

  DomainFirms(
      {this.id, this.name, this.loginname, this.loginpassword, this.web});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'loginname': loginname,
      'loginpassword': loginpassword,
      'web': web
    };
  }

  DomainFirms.fromFirestore(Map<String, dynamic> firestore)
      : id = firestore['id'],
        name = firestore['name'],
        loginname = firestore['loginname'],
        loginpassword = firestore['loginpassword'],
        web = firestore['web'];
}
