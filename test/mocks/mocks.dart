import 'package:connect_fake_store/controller/category_controller.dart';
import 'package:connect_fake_store/controller/product_controller.dart';
import 'package:mockito/annotations.dart';
import 'package:connect_fake_store/connect_fake_store.dart';

@GenerateMocks([ConnectFakeStore, ProductController, CategoryController])
void main() {}
