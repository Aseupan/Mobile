class Address {
  String name;
  String phone;
  String fullAddress;
  bool isPrimary = false;

  Address({
    required this.name,
    required this.phone,
    required this.fullAddress,
    this.isPrimary = false,
  });
}
