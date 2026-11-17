import 'package:flutter/foundation.dart';
import 'package:mahindra_bricks/model/paymenethistory_model.dart';
import 'package:mahindra_bricks/repo/paymenthistory_repo.dart';

class PaymentHistoryViewModel with ChangeNotifier {
  final _paymentHistoryRepo = PaymentHistoryRepo();

  bool _loading = false;
  bool get loading => _loading;

  PaymentHistoryModel? _paymentHistoryModel;
  PaymentHistoryModel? get paymentHistoryModel => _paymentHistoryModel;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void setPaymentHistoryModelData(PaymentHistoryModel value) {
    _paymentHistoryModel = value;
    notifyListeners();
  }

  Future<void> labourPayoutHistoryApi({dynamic labourId}) async {
    setLoading(true);

    try {
      final response = await _paymentHistoryRepo.labourPayoutHistoryApi(labourId: labourId);
      final model = PaymentHistoryModel.fromJson(response);
      setPaymentHistoryModelData(model);
    } catch (e) {
      if (kDebugMode) print("ViewModel Error → $e");
    } finally {
      setLoading(false);
    }
  }
}