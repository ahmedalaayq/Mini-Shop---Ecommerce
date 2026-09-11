// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:mini_shop/core/helpers/init_core_functions.dart';
import 'package:mini_shop/core/helpers/preference_manager.dart';
import 'package:mini_shop/features/home/data/data_sources/home_local_data_source.dart';
import 'package:mini_shop/features/home/data/models/product_model.dart';
import 'package:mini_shop/mini_shop.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await PreferenceManager.init();
    await PreferenceManager.clear();
  });

  testWidgets('shows the login screen when there is no session', (
    WidgetTester tester,
  ) async {
    await initCoreFunctions();
    await tester.pumpWidget(const MiniShop(hasSession: false));
    await tester.pumpAndSettle();

    expect(find.text('Login to your account'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
  });

  test('persists favorite state in the local home cache', () async {
    final dataSource = HomeLocalDataSource();
    final products = [
      ProductModel(
        id: 1,
        title: 'Test product',
        price: 10,
        description: 'test',
        category: ProductCategoryEnum.electronics,
        image: 'test_image',
        rating: RatingModel(rate: 4.5, count: 10),
      ).copyWith(isFavorite: true),
    ];

    await dataSource.saveProducts(products);
    final savedProducts = await dataSource.getAllProducts();

    expect(savedProducts, hasLength(1));
    expect(savedProducts.first.isFavorite, isTrue);
  });
}
