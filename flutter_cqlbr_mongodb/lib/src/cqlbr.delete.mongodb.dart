import 'package:flutter/foundation.dart';
import 'package:flutter_cqlbr_core/flutter_cqlbr_core.dart';

class CQLDeleteMongoDB extends CQLSection implements ICQLDelete {
  @protected
  late final ICQLNames _tableNames;

  CQLDeleteMongoDB() : super(name: 'Delete') {
    _tableNames = CQLNames();
  }

  @override
  String serialize() {
    return isEmpty()
        ? ''
        : Utils.instance.concat([
            _tableNames.serialize(),
          ]);
  }

  @override
  bool isEmpty() => _tableNames.isEmpty();

  @override
  void clear() {
    _tableNames.clear();
  }

  @override
  ICQLNames get tableNames => _tableNames;
}
