class Casedairylist {
  int id;
  String courtName;
  String caseNo;
  String clientName;
  String dara;
  String step;
  String notes;
  String selfDate;
  String adminDate;
  String lastDate;

  Casedairylist({
    required this.id,
    required this.courtName,
    required this.caseNo,
    required this.clientName,
    required this.dara,
    required this.step,
    required this.notes,
    required this.selfDate,
    required this.adminDate,
    required this.lastDate,
  });

  factory Casedairylist.fromJSON(Map map) {
    return Casedairylist(
      id: map['id'],
      courtName: map['court_name'],
      caseNo: map['case_no'],
      clientName: map['client_name'],
      dara: map['dara'],
      step: map['step'],
      notes: map['notes'],
      selfDate: map['self_date'],
      adminDate: map['admin_date'],
      lastDate: map['last_date'],
    );
  }

  // factory NewsModel.fromJson(Map<String, dynamic> json) {
  //   return NewsModel(name: json['name']);
  // }
}
