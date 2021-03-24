import 'package:dro/domain/bag/bag.dart';
import 'package:dro/infrastructure/bag/repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRepository extends Mock implements BagRespositoryImpl {
  @override
  List<BagEntity> bags = [];
}

// @override
//   bool? eatFood(String? food, {bool? hungry}) {
//     print('Fake eat $food');
//     return true;
void main() {
  // BagEntity _bagEntity;
  // BagEntity _bagEntity2;
  // ProductEntity productEntity;
  // ProductEntity productEntity2;
  // late MockBagRepoeitory mockBagRepoeitory;
  late MockRepository mockRepository;
  late BagRespositoryImpl respositoryImpl;

  //  when(mockEvaluation.calculateExpression(case2)).thenReturn(actual2);

  //     // arrange
  //     final result = evaluation.calculateExpression(case2);

  //     //assert
  //     expect(actual2, result);

  setUp(() {
    // _bagEntity = bagEntity;
    // _bagEntity2 = bagEntity1;
    respositoryImpl = BagRespositoryImpl();

    // mockBagRepoeitory = MockBagRepoeitory();
    mockRepository = MockRepository();
  });

  group("description", () {
    test("description", () {
      final List<BagEntity> bags = [];
      final data = respositoryImpl.getBagList();
      when(mockRepository.getBagList()).thenReturn(bags);
      expect(data, data);
    });
  });
}
