class Book {
  String? title;
  String? id;
  String? imagePath;
  String? info;
  Book(this.title, this.id, this.info, this.imagePath);
}

final book1 = Book("1", "2", "3", "4");

class Account {
  String? name;
  String? info;
  String? imagePath;
  bool? lightMode = false;
  int? bankPay = 0;
  bool? isExclusiveAccount = false;
  String? password;
  String? email;
  Account(
      {this.name,
      this.info,
      this.imagePath,
      this.bankPay,
      this.lightMode,
      this.isExclusiveAccount,
      this.password,
      this.email});
}

// Account perons1=new Account();
