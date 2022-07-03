// ignore_for_file: public_member_api_docs, sort_constructors_first

class TransList {
  final int amount;
  final String name;
  final String out;
  final bool trans;

  TransList({
    required this.amount,
    required this.name,
    required this.out,
    required this.trans,
  });
}

List<TransList> transList = [
  TransList(amount: 50, name: "Ahmed", out: 'true', trans: true),
  TransList(amount: 20, name: "Ali", out: 'true', trans: false),
  TransList(amount: 90, name: "Abdulaziz", out: 'false', trans: true),
  TransList(amount: 45, name: "Mohammad", out: 'false', trans: false)
];
