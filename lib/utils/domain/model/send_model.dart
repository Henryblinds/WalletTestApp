import 'package:dart_mappable/dart_mappable.dart';
import 'package:walletexamapp/utils/domain/model/send_entity.dart';
part 'send_model.mapper.dart';

@MappableClass()
class SendModel extends SendEntity
    with SendModelMappable {
  SendModel({
    @MappableField(key: 'amount') super.amount,
    @MappableField(key: 'created') super.created,
    @MappableField(key: 'userId') super.userId,
    @MappableField(key: 'id') super.id,
  });
}