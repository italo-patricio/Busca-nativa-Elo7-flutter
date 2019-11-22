class Price {
  String current;
  String installment;
  String nonPromotional;

  Price({this.current, this.installment, this.nonPromotional});

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      current: json['current'],
      installment: json['installment'],
      nonPromotional: json['nonPromotional']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current'] = this.current;
    data['installment'] = this.installment;
    data['nonPromotional'] = this.nonPromotional;
    return data;
  }
}
