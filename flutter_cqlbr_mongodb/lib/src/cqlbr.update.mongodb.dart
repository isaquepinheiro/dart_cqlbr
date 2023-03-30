import 'package:flutter/foundation.dart';
import 'package:flutter_cqlbr_core/flutter_cqlbr_core.dart';

class CQLUpdateMongoDB extends CQLSection implements ICQLUpdate {
  @protected
  late String _tableName;
  @protected
  late final ICQLNameValuePairs _values;

  CQLUpdateMongoDB() : super(name: 'Update') {
    _tableName = '';
    _values = CQLNameValuePairs();
  }

  @override
  String get tableName => _tableName;
  @override
  set tableName(String value) => _tableName = value;

  @override
  String serialize() {
    if (!isEmpty()) {
      return Utils.instance.concat([
        'UPDATE',
        _tableName,
        'SET',
        _serializeNameValuePairsForUpdate(_values),
      ]);
    }

    return '';
  }

  @override
  ICQLNameValuePairs values() {
    return _values;
  }

  @override
  bool isEmpty() {
    return _tableName.isEmpty;
  }

  @override
  void clear() {
    _tableName = '';
    _values.clear();
  }

  @protected
  String _serializeNameValuePairsForUpdate(ICQLNameValuePairs pairs) {
    String result = '';

    for (int i = 0; i < pairs.count(); i++) {
      result = Utils.instance.concat(
        [
          result,
          Utils.instance.concat([pairs.item(i).name, '=', pairs.item(i).value])
        ],
        delimiter: ', ',
      );
    }

    return result;
  }
}
