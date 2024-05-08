import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoService extends GetxService {
  PackageInfoService({required PackageInfo initInfo}) : _packageInfo = initInfo;

  final PackageInfo _packageInfo;
  PackageInfo get packageInfo => _packageInfo;
}
