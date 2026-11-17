
import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/model/dashboard_model.dart';
import 'package:mahindra_bricks/repo/dashboard_repo.dart';

class DashboardviewModel with ChangeNotifier {
  final _dashboardRepo = DashboardRepo();

  bool _loading = false;
  bool get loading => _loading;

  DashBoardListModel? _dashBoardListModel;
  DashBoardListModel? get dashBoardListModel => _dashBoardListModel;

  void setDashBoardModelData(DashBoardListModel value) {
    _dashBoardListModel = value;
    notifyListeners();
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> DashBoardApi() async {
    await dashBoardApi();
  }

  Future<void> dashBoardApi() async {
    setLoading(true);

    try {
      final response = await _dashboardRepo.DashBoardApi();
      final model = DashBoardListModel.fromJson(response);
      setDashBoardModelData(model);
    } catch (e) {
      if (kDebugMode) print("ViewModel Error → $e");
    } finally {
      setLoading(false);
    }
  }
}