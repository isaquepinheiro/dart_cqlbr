import 'package:dart_cqlbr_core/dart_cqlbr_core.dart';
import 'package:dart_cqlbr_mysql/dart_cqlbr_mysql.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests -', () {
    CQLBr cqlbr = CQLBr(select: CQLSelectMySQL());

    test('TestDeleteMySQL', () {
      String result = cqlbr.delete$().from$('CLIENTES').asResult();

      expect(result, 'DELETE FROM CLIENTES');
    });

    test('TestDeleteWhereMySQL', () {
      String result =
          cqlbr.delete$().from$('CLIENTES').where$('ID_CLIENTE = 1').asResult();

      expect(result, 'DELETE FROM CLIENTES WHERE ID_CLIENTE = 1');
    });
  });
}
