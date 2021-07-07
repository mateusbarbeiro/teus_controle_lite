import 'package:get_it/get_it.dart';
import 'package:teus_controle_lite/app/database/sqlite/product_dao.dart';
import 'package:teus_controle_lite/app/domain/interfaces/i_product_dao.dart';
import 'package:teus_controle_lite/app/domain/interfaces/i_product_service.dart';
import 'package:teus_controle_lite/app/domain/services/product_service.dart';

configInjection() {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<IProductDAO>(ProductDao());
  getIt.registerSingleton<IProductService>(ProductService());
}