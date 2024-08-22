// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'send_model.dart';

class SendModelMapper extends ClassMapperBase<SendModel> {
  SendModelMapper._();

  static SendModelMapper? _instance;
  static SendModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SendModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SendModel';

  static String? _$amount(SendModel v) => v.amount;
  static const Field<SendModel, String> _f$amount = Field('amount', _$amount);
  static String? _$created(SendModel v) => v.created;
  static const Field<SendModel, String> _f$created =
      Field('created', _$created);
  static int? _$userId(SendModel v) => v.userId;
  static const Field<SendModel, int> _f$userId = Field('userId', _$userId);
  static int? _$id(SendModel v) => v.id;
  static const Field<SendModel, int> _f$id = Field('id', _$id);

  @override
  final MappableFields<SendModel> fields = const {
    #amount: _f$amount,
    #created: _f$created,
    #userId: _f$userId,
    #id: _f$id,
  };

  static SendModel _instantiate(DecodingData data) {
    return SendModel(
        amount: data.dec(_f$amount),
        created: data.dec(_f$created),
        userId: data.dec(_f$userId),
        id: data.dec(_f$id));
  }

  @override
  final Function instantiate = _instantiate;

  static SendModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SendModel>(map);
  }

  static SendModel fromJson(String json) {
    return ensureInitialized().decodeJson<SendModel>(json);
  }
}

mixin SendModelMappable {
  String toJson() {
    return SendModelMapper.ensureInitialized()
        .encodeJson<SendModel>(this as SendModel);
  }

  Map<String, dynamic> toMap() {
    return SendModelMapper.ensureInitialized()
        .encodeMap<SendModel>(this as SendModel);
  }

  SendModelCopyWith<SendModel, SendModel, SendModel> get copyWith =>
      _SendModelCopyWithImpl(this as SendModel, $identity, $identity);
  @override
  String toString() {
    return SendModelMapper.ensureInitialized()
        .stringifyValue(this as SendModel);
  }

  @override
  bool operator ==(Object other) {
    return SendModelMapper.ensureInitialized()
        .equalsValue(this as SendModel, other);
  }

  @override
  int get hashCode {
    return SendModelMapper.ensureInitialized().hashValue(this as SendModel);
  }
}

extension SendModelValueCopy<$R, $Out> on ObjectCopyWith<$R, SendModel, $Out> {
  SendModelCopyWith<$R, SendModel, $Out> get $asSendModel =>
      $base.as((v, t, t2) => _SendModelCopyWithImpl(v, t, t2));
}

abstract class SendModelCopyWith<$R, $In extends SendModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? amount, String? created, int? userId, int? id});
  SendModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SendModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SendModel, $Out>
    implements SendModelCopyWith<$R, SendModel, $Out> {
  _SendModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SendModel> $mapper =
      SendModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? amount = $none,
          Object? created = $none,
          Object? userId = $none,
          Object? id = $none}) =>
      $apply(FieldCopyWithData({
        if (amount != $none) #amount: amount,
        if (created != $none) #created: created,
        if (userId != $none) #userId: userId,
        if (id != $none) #id: id
      }));
  @override
  SendModel $make(CopyWithData data) => SendModel(
      amount: data.get(#amount, or: $value.amount),
      created: data.get(#created, or: $value.created),
      userId: data.get(#userId, or: $value.userId),
      id: data.get(#id, or: $value.id));

  @override
  SendModelCopyWith<$R2, SendModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SendModelCopyWithImpl($value, $cast, t);
}
