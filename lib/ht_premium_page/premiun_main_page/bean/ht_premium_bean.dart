import 'package:json_annotation/json_annotation.dart';

part 'ht_premium_bean.g.dart';

@JsonSerializable(explicitToJson: true)
class HTPremiumBean {
  @JsonKey(name: 'trial')
  Trial? trial;

  @JsonKey(name: 'week')
  Week? week;

  @JsonKey(name: 'month')
  Month? month;

  @JsonKey(name: 'year')
  Year? year;

  @JsonKey(name: 'data1')
  Data1? data1;

  @JsonKey(name: 'k1')
  String? k1;

  @JsonKey(name: 'k2')
  List<int>? k2;

  @JsonKey(name: 'k3')
  List<String>? k3;

  @JsonKey(name: 'k4')
  String? k4;

  @JsonKey(name: 'k5')
  String? k5;

  @JsonKey(name: 'k6')
  String? k6;

  @JsonKey(name: 'k12')
  String? k12;

  @JsonKey(name: 'k13')
  String? k13;

  @JsonKey(name: 'k14')
  K14? k14;

  @JsonKey(name: 'k15')
  K15? k15;

  @JsonKey(name: 'k16')
  List<String>? k16;

  @JsonKey(name: 'family')
  int? family;

  @JsonKey(name: 'link')
  String? link;

  @JsonKey(name: 'f1')
  F1? f1;

  @JsonKey(name: 'data2')
  Data2? data2;

  @JsonKey(name: 'p1')
  P1? p1;

  @JsonKey(name: 'p2')
  P2? p2;

  @JsonKey(name: 'h1')
  List<String>? h1;

  @JsonKey(name: 'i1')
  List<String>? i1;

  @JsonKey(name: 'i2')
  List<String>? i2;

  @JsonKey(name: 'i3')
  String? i3;

  @JsonKey(name: 'p3')
  List<dynamic>? p3;

  @JsonKey(name: 'p4')
  List<String>? p4;

  @JsonKey(name: 'p5')
  List<String>? p5;

  ///是否走工具包
  bool isK12() {
    if (k12 == '1') {
      return true;
    }
    return false;
  }

  ///个人可订阅产品
  List personDataList() {
    var result = [];
    result.add(data2?.week);
    result.add(data2?.month);
    result.add(data2?.year);
    return result;
  }

  ///家庭可订阅产品
  List familyDataList() {
    var result = [];
    result.add(data2?.fw);
    result.add(data2?.fm);
    result.add(data2?.fy);
    return result;
  }

  ///是否是优惠的产品
  bool discountProduct(dynamic model) {
    if (k3?[0] == '1' && model.runtimeType.toString().toLowerCase() == k3?[2]) {
      model?.h1 = data2?.trial?.h1;
      model?.h2 = data2?.trial?.h2;
      model?.y1 = data2?.trial?.y1;
      model?.t1 = data2?.trial?.t1;
      return true;
    }
    return false;
  }

  ///优惠的类型(开启情况下)
  String? discountType() {
    if (k3?[0] == '1') {
      return k3?[2];
    }
    return null;
  }

  HTPremiumBean();

  static HTPremiumBean fromJson(Map<String, dynamic> srcJson) =>
      _$HTPremiumBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HTPremiumBeanToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Trial {
  @JsonKey(name: 'cnt')
  String? cnt;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'show')
  String? show;

  @JsonKey(name: 'c1')
  String? c1;

  @JsonKey(name: 'd1')
  String? d1;

  @JsonKey(name: 'h1')
  String? h1;

  @JsonKey(name: 'h2')
  String? h2;

  @JsonKey(name: 'y1')
  String? y1;

  @JsonKey(name: 't1')
  String? t1;

  Trial();

  static Trial fromJson(Map<String, dynamic> srcJson) =>
      _$TrialFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TrialToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Week {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'price')
  String? price;

  @JsonKey(name: 'c1')
  String? c1;

  @JsonKey(name: 'd1')
  String? d1;

  @JsonKey(name: 'h1')
  String? h1;

  @JsonKey(name: 'h2')
  String? h2;

  @JsonKey(name: 'y1')
  String? y1;

  @JsonKey(name: 't1')
  String? t1;

  Week();

  static Week fromJson(Map<String, dynamic> srcJson) => _$WeekFromJson(srcJson);

  Map<String, dynamic> toJson() => _$WeekToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Month {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'price')
  String? price;

  @JsonKey(name: 'c1')
  String? c1;

  @JsonKey(name: 'd1')
  String? d1;

  @JsonKey(name: 'h1')
  String? h1;

  @JsonKey(name: 'h2')
  String? h2;

  @JsonKey(name: 'y1')
  String? y1;

  @JsonKey(name: 't1')
  String? t1;

  Month();

  static Month fromJson(Map<String, dynamic> srcJson) =>
      _$MonthFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MonthToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Year {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'price')
  String? price;

  @JsonKey(name: 'c1')
  String? c1;

  @JsonKey(name: 'd1')
  String? d1;

  @JsonKey(name: 'h1')
  String? h1;

  @JsonKey(name: 'h2')
  String? h2;

  @JsonKey(name: 'y1')
  String? y1;

  @JsonKey(name: 't1')
  String? t1;

  Year();

  static Year fromJson(Map<String, dynamic> srcJson) => _$YearFromJson(srcJson);

  Map<String, dynamic> toJson() => _$YearToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data1 {
  @JsonKey(name: 'person')
  Person? person;

  @JsonKey(name: 'family')
  Family? family;

  Data1();

  static Data1 fromJson(Map<String, dynamic> srcJson) =>
      _$Data1FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Data1ToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Person {
  @JsonKey(name: 'week')
  Week? week;

  @JsonKey(name: 'month')
  Month? month;

  @JsonKey(name: 'year')
  Year? year;

  Person();

  static Person fromJson(Map<String, dynamic> srcJson) =>
      _$PersonFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Family {
  @JsonKey(name: 'week')
  Week? week;

  @JsonKey(name: 'month')
  Month? month;

  @JsonKey(name: 'year')
  Year? year;

  Family();

  static Family fromJson(Map<String, dynamic> srcJson) =>
      _$FamilyFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FamilyToJson(this);
}

@JsonSerializable(explicitToJson: true)
class K14 {
  @JsonKey(name: 'k1')
  String? k1;

  @JsonKey(name: 'k2')
  String? k2;

  @JsonKey(name: 'p1')
  String? p1;

  @JsonKey(name: 'p2')
  String? p2;

  @JsonKey(name: 'i1')
  String? i1;

  @JsonKey(name: 'i2')
  String? i2;

  @JsonKey(name: 'i3')
  String? i3;

  @JsonKey(name: 'i4')
  String? i4;

  K14();

  static K14 fromJson(Map<String, dynamic> srcJson) => _$K14FromJson(srcJson);

  Map<String, dynamic> toJson() => _$K14ToJson(this);
}

@JsonSerializable(explicitToJson: true)
class K15 {
  @JsonKey(name: 'k1')
  String? k1;

  @JsonKey(name: 't1')
  String? t1;

  @JsonKey(name: 'i1')
  String? i1;

  @JsonKey(name: 'n1')
  String? n1;

  @JsonKey(name: 'i2')
  String? i2;

  K15();

  static K15 fromJson(Map<String, dynamic> srcJson) => _$K15FromJson(srcJson);

  Map<String, dynamic> toJson() => _$K15ToJson(this);
}

@JsonSerializable(explicitToJson: true)
class F1 {
  @JsonKey(name: 'c1')
  String? c1;

  @JsonKey(name: 'd1')
  String? d1;

  @JsonKey(name: 'h1')
  String? h1;

  @JsonKey(name: 'h2')
  String? h2;

  @JsonKey(name: 'y1')
  String? y1;

  @JsonKey(name: 't1')
  String? t1;

  F1();

  static F1 fromJson(Map<String, dynamic> srcJson) => _$F1FromJson(srcJson);

  Map<String, dynamic> toJson() => _$F1ToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data2 {
  @JsonKey(name: 'k1')
  String? k1;

  @JsonKey(name: 'trial')
  Trial? trial;

  @JsonKey(name: 'week')
  Week? week;

  @JsonKey(name: 'month')
  Month? month;

  @JsonKey(name: 'month1')
  Month1? month1;

  @JsonKey(name: 'year')
  Year? year;

  @JsonKey(name: 'fw')
  Fw? fw;

  @JsonKey(name: 'fm')
  Fm? fm;

  @JsonKey(name: 'fy')
  Fy? fy;

  Data2();

  static Data2 fromJson(Map<String, dynamic> srcJson) =>
      _$Data2FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Data2ToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Month1 {
  @JsonKey(name: 'c1')
  String? c1;

  @JsonKey(name: 'd1')
  String? d1;

  @JsonKey(name: 'h1')
  String? h1;

  @JsonKey(name: 'h2')
  String? h2;

  @JsonKey(name: 'y1')
  String? y1;

  @JsonKey(name: 't1')
  String? t1;

  Month1();

  static Month1 fromJson(Map<String, dynamic> srcJson) =>
      _$Month1FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Month1ToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Fw {
  @JsonKey(name: 'c1')
  String? c1;

  @JsonKey(name: 'd1')
  String? d1;

  @JsonKey(name: 'h1')
  String? h1;

  @JsonKey(name: 'h2')
  String? h2;

  @JsonKey(name: 'y1')
  String? y1;

  @JsonKey(name: 't1')
  String? t1;

  Fw();

  static Fw fromJson(Map<String, dynamic> srcJson) => _$FwFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FwToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Fm {
  @JsonKey(name: 'c1')
  String? c1;

  @JsonKey(name: 'd1')
  String? d1;

  @JsonKey(name: 'h1')
  String? h1;

  @JsonKey(name: 'h2')
  String? h2;

  @JsonKey(name: 'y1')
  String? y1;

  @JsonKey(name: 't1')
  String? t1;

  Fm();

  static Fm fromJson(Map<String, dynamic> srcJson) => _$FmFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FmToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Fy {
  @JsonKey(name: 'c1')
  String? c1;

  @JsonKey(name: 'd1')
  String? d1;

  @JsonKey(name: 'h1')
  String? h1;

  @JsonKey(name: 'h2')
  String? h2;

  @JsonKey(name: 'y1')
  String? y1;

  @JsonKey(name: 't1')
  String? t1;

  Fy();

  static Fy fromJson(Map<String, dynamic> srcJson) => _$FyFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FyToJson(this);
}

@JsonSerializable(explicitToJson: true)
class P1 {
  @JsonKey(name: 't5')
  String? t5;

  @JsonKey(name: 't6')
  String? t6;

  @JsonKey(name: 't7')
  List<String>? t7;

  @JsonKey(name: 't3')
  String? t3;

  @JsonKey(name: 't4')
  String? t4;

  @JsonKey(name: 't1')
  String? t1;

  @JsonKey(name: 't2')
  String? t2;

  @JsonKey(name: 'gif')
  String? gif;

  P1();

  static P1 fromJson(Map<String, dynamic> srcJson) => _$P1FromJson(srcJson);

  Map<String, dynamic> toJson() => _$P1ToJson(this);
}

@JsonSerializable(explicitToJson: true)
class P2 {
  @JsonKey(name: 't1')
  String? t1;

  @JsonKey(name: 't2')
  String? t2;

  @JsonKey(name: 'gif')
  List<String>? gif;

  P2();

  static P2 fromJson(Map<String, dynamic> srcJson) => _$P2FromJson(srcJson);

  Map<String, dynamic> toJson() => _$P2ToJson(this);
}
