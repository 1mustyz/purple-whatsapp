// ignore_for_file: public_member_api_docs, sort_constructors_first
class ContactModel {
  String name;
  String status;
  bool select = false;
  ContactModel({required this.name, required this.status, this.select = false});
}
