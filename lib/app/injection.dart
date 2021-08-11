import 'package:get_it/get_it.dart';
import 'package:teus_controle_lite/app/database/firestore/product_dao_firestore.dart';
import 'package:teus_controle_lite/app/domain/interfaces/i_product_dao.dart';
import 'package:teus_controle_lite/app/domain/interfaces/i_product_service.dart';
import 'package:teus_controle_lite/app/domain/services/product_service.dart';

configInjection() async{
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<IProductDAO>(ProductDaoFirestore());
  getIt.registerSingleton<IProductService>(ProductService());
}