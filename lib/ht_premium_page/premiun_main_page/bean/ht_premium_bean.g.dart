// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'h_t_premium_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HTPremiumBean _$HTPremiumBeanFromJson(Map<String, dynamic> json) =>
    HTPremiumBean()
      ..trial = json['trial'] == null
          ? null
          : Trial.fromJson(json['trial'] as Map<String, dynamic>)
      ..week = json['week'] == null
          ? null
          : Week.fromJson(json['week'] as Map<String, dynamic>)
      ..month = json['month'] == null
          ? null
          : Month.fromJson(json['month'] as Map<String, dynamic>)
      ..year = json['year'] == null
          ? null
          : Year.fromJson(json['year'] as Map<String, dynamic>)
      ..data1 = json['data1'] == null
          ? null
          : Data1.fromJson(json['data1'] as Map<String, dynamic>)
      ..k1 = json['k1'] as String?
      ..k2 = (json['k2'] as List<dynamic>?)?.map((e) => e as int).toList()
      ..k3 = (json['k3'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..k4 = json['k4'] as String?
      ..k5 = json['k5'] as String?
      ..k6 = json['k6'] as String?
      ..k12 = json['k12'] as String?
      ..k13 = json['k13'] as String?
      ..k14 = json['k14'] == null
          ? null
          : K14.fromJson(json['k14'] as Map<String, dynamic>)
      ..k15 = json['k15'] == null
          ? null
          : K15.fromJson(json['k15'] as Map<String, dynamic>)
      ..k16 = (json['k16'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..family = json['family'] as int?
      ..link = json['link'] as String?
      ..f1 = json['f1'] == null
          ? null
          : F1.fromJson(json['f1'] as Map<String, dynamic>)
      ..data2 = json['data2'] == null
          ? null
          : Data2.fromJson(json['data2'] as Map<String, dynamic>)
      ..p1 = json['p1'] == null
          ? null
          : P1.fromJson(json['p1'] as Map<String, dynamic>)
      ..p2 = json['p2'] == null
          ? null
          : P2.fromJson(json['p2'] as Map<String, dynamic>)
      ..h1 = (json['h1'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..i1 = (json['i1'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..i2 = (json['i2'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..i3 = json['i3'] as String?
      ..p3 = json['p3'] as List<dynamic>?
      ..p4 = (json['p4'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..p5 = (json['p5'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$HTPremiumBeanToJson(HTPremiumBean instance) =>
    <String, dynamic>{
      'trial': instance.trial?.toJson(),
      'week': instance.week?.toJson(),
      'month': instance.month?.toJson(),
      'year': instance.year?.toJson(),
      'data1': instance.data1?.toJson(),
      'k1': instance.k1,
      'k2': instance.k2,
      'k3': instance.k3,
      'k4': instance.k4,
      'k5': instance.k5,
      'k6': instance.k6,
      'k12': instance.k12,
      'k13': instance.k13,
      'k14': instance.k14?.toJson(),
      'k15': instance.k15?.toJson(),
      'k16': instance.k16,
      'family': instance.family,
      'link': instance.link,
      'f1': instance.f1?.toJson(),
      'data2': instance.data2?.toJson(),
      'p1': instance.p1?.toJson(),
      'p2': instance.p2?.toJson(),
      'h1': instance.h1,
      'i1': instance.i1,
      'i2': instance.i2,
      'i3': instance.i3,
      'p3': instance.p3,
      'p4': instance.p4,
      'p5': instance.p5,
    };

Trial _$TrialFromJson(Map<String, dynamic> json) => Trial()
  ..cnt = json['cnt'] as String?
  ..name = json['name'] as String?
  ..show = json['show'] as String?
  ..c1 = json['c1'] as String?
  ..d1 = json['d1'] as String?
  ..h1 = json['h1'] as String?
  ..h2 = json['h2'] as String?
  ..y1 = json['y1'] as String?
  ..t1 = json['t1'] as String?;

Map<String, dynamic> _$TrialToJson(Trial instance) => <String, dynamic>{
      'cnt': instance.cnt,
      'name': instance.name,
      'show': instance.show,
      'c1': instance.c1,
      'd1': instance.d1,
      'h1': instance.h1,
      'h2': instance.h2,
      'y1': instance.y1,
      't1': instance.t1,
    };

Week _$WeekFromJson(Map<String, dynamic> json) => Week()
  ..id = json['id'] as String?
  ..price = json['price'] as String?
  ..c1 = json['c1'] as String?
  ..d1 = json['d1'] as String?
  ..h1 = json['h1'] as String?
  ..h2 = json['h2'] as String?
  ..y1 = json['y1'] as String?
  ..t1 = json['t1'] as String?;

Map<String, dynamic> _$WeekToJson(Week instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'c1': instance.c1,
      'd1': instance.d1,
      'h1': instance.h1,
      'h2': instance.h2,
      'y1': instance.y1,
      't1': instance.t1,
    };

Month _$MonthFromJson(Map<String, dynamic> json) => Month()
  ..id = json['id'] as String?
  ..price = json['price'] as String?
  ..c1 = json['c1'] as String?
  ..d1 = json['d1'] as String?
  ..h1 = json['h1'] as String?
  ..h2 = json['h2'] as String?
  ..y1 = json['y1'] as String?
  ..t1 = json['t1'] as String?;

Map<String, dynamic> _$MonthToJson(Month instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'c1': instance.c1,
      'd1': instance.d1,
      'h1': instance.h1,
      'h2': instance.h2,
      'y1': instance.y1,
      't1': instance.t1,
    };

Year _$YearFromJson(Map<String, dynamic> json) => Year()
  ..id = json['id'] as String?
  ..price = json['price'] as String?
  ..c1 = json['c1'] as String?
  ..d1 = json['d1'] as String?
  ..h1 = json['h1'] as String?
  ..h2 = json['h2'] as String?
  ..y1 = json['y1'] as String?
  ..t1 = json['t1'] as String?;

Map<String, dynamic> _$YearToJson(Year instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'c1': instance.c1,
      'd1': instance.d1,
      'h1': instance.h1,
      'h2': instance.h2,
      'y1': instance.y1,
      't1': instance.t1,
    };

Data1 _$Data1FromJson(Map<String, dynamic> json) => Data1()
  ..person = json['person'] == null
      ? null
      : Person.fromJson(json['person'] as Map<String, dynamic>)
  ..family = json['family'] == null
      ? null
      : Family.fromJson(json['family'] as Map<String, dynamic>);

Map<String, dynamic> _$Data1ToJson(Data1 instance) => <String, dynamic>{
      'person': instance.person?.toJson(),
      'family': instance.family?.toJson(),
    };

Person _$PersonFromJson(Map<String, dynamic> json) => Person()
  ..week = json['week'] == null
      ? null
      : Week.fromJson(json['week'] as Map<String, dynamic>)
  ..month = json['month'] == null
      ? null
      : Month.fromJson(json['month'] as Map<String, dynamic>)
  ..year = json['year'] == null
      ? null
      : Year.fromJson(json['year'] as Map<String, dynamic>);

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'week': instance.week?.toJson(),
      'month': instance.month?.toJson(),
      'year': instance.year?.toJson(),
    };

Family _$FamilyFromJson(Map<String, dynamic> json) => Family()
  ..week = json['week'] == null
      ? null
      : Week.fromJson(json['week'] as Map<String, dynamic>)
  ..month = json['month'] == null
      ? null
      : Month.fromJson(json['month'] as Map<String, dynamic>)
  ..year = json['year'] == null
      ? null
      : Year.fromJson(json['year'] as Map<String, dynamic>);

Map<String, dynamic> _$FamilyToJson(Family instance) => <String, dynamic>{
      'week': instance.week?.toJson(),
      'month': instance.month?.toJson(),
      'year': instance.year?.toJson(),
    };

K14 _$K14FromJson(Map<String, dynamic> json) => K14()
  ..k1 = json['k1'] as String?
  ..k2 = json['k2'] as String?
  ..p1 = json['p1'] as String?
  ..p2 = json['p2'] as String?
  ..i1 = json['i1'] as String?
  ..i2 = json['i2'] as String?
  ..i3 = json['i3'] as String?
  ..i4 = json['i4'] as String?;

Map<String, dynamic> _$K14ToJson(K14 instance) => <String, dynamic>{
      'k1': instance.k1,
      'k2': instance.k2,
      'p1': instance.p1,
      'p2': instance.p2,
      'i1': instance.i1,
      'i2': instance.i2,
      'i3': instance.i3,
      'i4': instance.i4,
    };

K15 _$K15FromJson(Map<String, dynamic> json) => K15()
  ..k1 = json['k1'] as String?
  ..t1 = json['t1'] as String?
  ..i1 = json['i1'] as String?
  ..n1 = json['n1'] as String?
  ..i2 = json['i2'] as String?;

Map<String, dynamic> _$K15ToJson(K15 instance) => <String, dynamic>{
      'k1': instance.k1,
      't1': instance.t1,
      'i1': instance.i1,
      'n1': instance.n1,
      'i2': instance.i2,
    };

F1 _$F1FromJson(Map<String, dynamic> json) => F1()
  ..c1 = json['c1'] as String?
  ..d1 = json['d1'] as String?
  ..h1 = json['h1'] as String?
  ..h2 = json['h2'] as String?
  ..y1 = json['y1'] as String?
  ..t1 = json['t1'] as String?;

Map<String, dynamic> _$F1ToJson(F1 instance) => <String, dynamic>{
      'c1': instance.c1,
      'd1': instance.d1,
      'h1': instance.h1,
      'h2': instance.h2,
      'y1': instance.y1,
      't1': instance.t1,
    };

Data2 _$Data2FromJson(Map<String, dynamic> json) => Data2()
  ..k1 = json['k1'] as String?
  ..trial = json['trial'] == null
      ? null
      : Trial.fromJson(json['trial'] as Map<String, dynamic>)
  ..week = json['week'] == null
      ? null
      : Week.fromJson(json['week'] as Map<String, dynamic>)
  ..month = json['month'] == null
      ? null
      : Month.fromJson(json['month'] as Map<String, dynamic>)
  ..month1 = json['month1'] == null
      ? null
      : Month1.fromJson(json['month1'] as Map<String, dynamic>)
  ..year = json['year'] == null
      ? null
      : Year.fromJson(json['year'] as Map<String, dynamic>)
  ..fw = json['fw'] == null
      ? null
      : Fw.fromJson(json['fw'] as Map<String, dynamic>)
  ..fm = json['fm'] == null
      ? null
      : Fm.fromJson(json['fm'] as Map<String, dynamic>)
  ..fy = json['fy'] == null
      ? null
      : Fy.fromJson(json['fy'] as Map<String, dynamic>);

Map<String, dynamic> _$Data2ToJson(Data2 instance) => <String, dynamic>{
      'k1': instance.k1,
      'trial': instance.trial?.toJson(),
      'week': instance.week?.toJson(),
      'month': instance.month?.toJson(),
      'month1': instance.month1?.toJson(),
      'year': instance.year?.toJson(),
      'fw': instance.fw?.toJson(),
      'fm': instance.fm?.toJson(),
      'fy': instance.fy?.toJson(),
    };

Month1 _$Month1FromJson(Map<String, dynamic> json) => Month1()
  ..c1 = json['c1'] as String?
  ..d1 = json['d1'] as String?
  ..h1 = json['h1'] as String?
  ..h2 = json['h2'] as String?
  ..y1 = json['y1'] as String?
  ..t1 = json['t1'] as String?;

Map<String, dynamic> _$Month1ToJson(Month1 instance) => <String, dynamic>{
      'c1': instance.c1,
      'd1': instance.d1,
      'h1': instance.h1,
      'h2': instance.h2,
      'y1': instance.y1,
      't1': instance.t1,
    };

Fw _$FwFromJson(Map<String, dynamic> json) => Fw()
  ..c1 = json['c1'] as String?
  ..d1 = json['d1'] as String?
  ..h1 = json['h1'] as String?
  ..h2 = json['h2'] as String?
  ..y1 = json['y1'] as String?
  ..t1 = json['t1'] as String?;

Map<String, dynamic> _$FwToJson(Fw instance) => <String, dynamic>{
      'c1': instance.c1,
      'd1': instance.d1,
      'h1': instance.h1,
      'h2': instance.h2,
      'y1': instance.y1,
      't1': instance.t1,
    };

Fm _$FmFromJson(Map<String, dynamic> json) => Fm()
  ..c1 = json['c1'] as String?
  ..d1 = json['d1'] as String?
  ..h1 = json['h1'] as String?
  ..h2 = json['h2'] as String?
  ..y1 = json['y1'] as String?
  ..t1 = json['t1'] as String?;

Map<String, dynamic> _$FmToJson(Fm instance) => <String, dynamic>{
      'c1': instance.c1,
      'd1': instance.d1,
      'h1': instance.h1,
      'h2': instance.h2,
      'y1': instance.y1,
      't1': instance.t1,
    };

Fy _$FyFromJson(Map<String, dynamic> json) => Fy()
  ..c1 = json['c1'] as String?
  ..d1 = json['d1'] as String?
  ..h1 = json['h1'] as String?
  ..h2 = json['h2'] as String?
  ..y1 = json['y1'] as String?
  ..t1 = json['t1'] as String?;

Map<String, dynamic> _$FyToJson(Fy instance) => <String, dynamic>{
      'c1': instance.c1,
      'd1': instance.d1,
      'h1': instance.h1,
      'h2': instance.h2,
      'y1': instance.y1,
      't1': instance.t1,
    };

P1 _$P1FromJson(Map<String, dynamic> json) => P1()
  ..t5 = json['t5'] as String?
  ..t6 = json['t6'] as String?
  ..t7 = (json['t7'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..t3 = json['t3'] as String?
  ..t4 = json['t4'] as String?
  ..t1 = json['t1'] as String?
  ..t2 = json['t2'] as String?
  ..gif = json['gif'] as String?;

Map<String, dynamic> _$P1ToJson(P1 instance) => <String, dynamic>{
      't5': instance.t5,
      't6': instance.t6,
      't7': instance.t7,
      't3': instance.t3,
      't4': instance.t4,
      't1': instance.t1,
      't2': instance.t2,
      'gif': instance.gif,
    };

P2 _$P2FromJson(Map<String, dynamic> json) => P2()
  ..t1 = json['t1'] as String?
  ..t2 = json['t2'] as String?
  ..gif = (json['gif'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$P2ToJson(P2 instance) => <String, dynamic>{
      't1': instance.t1,
      't2': instance.t2,
      'gif': instance.gif,
    };
