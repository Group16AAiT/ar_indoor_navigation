import 'package:ar_indoor_nav_admin/data/building/data_provider/building_data_provider.dart';
import 'package:ar_indoor_nav_admin/data/building/model/building.dart';

class BuildingRepository {
  final BuildingDataProvider buildingDataProvider;

  BuildingRepository({
    required this.buildingDataProvider,
  });

  Future<List<Building>> getAllBuildings() async {
    return await buildingDataProvider.getAllBuildings();
  }

  Future<Building> getBuildingDetails(String bldgId) async {
    return await buildingDataProvider.getBuildingDetails(bldgId);
  }
}
