import 'package:ht_new_movpresenter/utils/shared_preferences.dart/ht_user_store.dart';
import 'package:json_annotation/json_annotation.dart';

part 'family_account_bean.g.dart';

@JsonSerializable(explicitToJson: true)
class FamilyAccountBean {
  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'msg')
  String? msg;

  @JsonKey(name: 'data')
  List<Data>? data;

  @JsonKey(name: 'cur_cnts')
  int? curCnts;

  @JsonKey(name: 'remain')
  int? remain;

  FamilyAccountBean();

  static FamilyAccountBean fromJson(Map<String, dynamic> srcJson) =>
      _$FamilyAccountBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FamilyAccountBeanToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
  @JsonKey(name: 'uid')
  int? uid;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'face')
  String? face;

  @JsonKey(name: 'mail')
  String? mail;

  @JsonKey(name: 'master')
  int? master;

  @JsonKey(name: 'signup')
  int? signup;

  ///是否是自己的账号
  bool isOwnAccount() {
    if (HTUserStore.userBean?.email == mail) {
      return true;
    }
    return false;
  }
  ///当前登录账号是否是主账号
  bool isPrimaryAccount() {
    if (HTUserStore.userBean?.master == '1') {
      return true;
    }
    return false;
  }

  Data();

  static Data fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
