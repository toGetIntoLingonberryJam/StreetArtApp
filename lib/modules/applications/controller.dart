import 'package:get/get.dart';
import 'package:street_art_witnesses/data/api/backend_api.dart';
import 'package:street_art_witnesses/data/models/ticket.dart';
import 'package:street_art_witnesses/data/services/auth_service.dart';
import 'package:street_art_witnesses/widgets/other/app_error.dart';

class ApplicationsController extends GetxController {
  ApplicationsController() : _authService = Get.find<AuthService>() {
    loadTickets();
  }

  final AuthService _authService;
  bool get isModerator => _authService.user.value.isModerator;
  List<ArtworkTicket> tickets = [];
  bool isLoading = true;

  @override
  void onInit() {
    ever(_authService.user, (user) {
      if (!user.isModerator) Get.off(() => const AppErrorScreen());
    });
    super.onInit();
  }

  Future<void> loadTickets() async {
    isLoading = true;
    update();
    final response = await BackendApi.get('/v1/tickets');
    if (response == null || response.data == null) {
      isLoading = false;
      // TODO: Error snackbar
      return update();
    }

    final List filtered = response.data
        .where((e) => e['ticket_type'] == 'create' && e['status'] == 'pending')
        .toList();
    tickets = filtered.map((e) => ArtworkTicket.fromJson(e)).toList();
    isLoading = false;
    update();
  }
}
