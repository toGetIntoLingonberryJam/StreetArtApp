import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/api/backend_api.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork.dart';
import 'package:street_art_witnesses/data/models/ticket.dart';
import 'package:street_art_witnesses/data/services/auth_service.dart';
import 'package:street_art_witnesses/data/services/settings_service.dart';
import 'package:street_art_witnesses/modules/applications/controller.dart';
import 'package:street_art_witnesses/modules/artwork/screen.dart';
import 'package:street_art_witnesses/data/services/images_service.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class ApplicationsScreen extends StatelessWidget {
  const ApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ApplicationsController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPagePadding,
          child: Column(
            children: [
              const AppAppbar(title: 'Заявки'),
              const SizedBox(height: 20),
              GetBuilder<ApplicationsController>(builder: (context) {
                return Expanded(
                  child: controller.isLoading
                      ? const Center(child: AppLoadingIndicator())
                      : RefreshIndicator(
                          onRefresh: controller.loadTickets,
                          child: ListView.separated(
                            itemCount: controller.tickets.length,
                            itemBuilder: (_, idx) => _ApplicationCard(controller.tickets[idx]),
                            separatorBuilder: (_, __) => const SizedBox(height: 16),
                          ),
                        ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _ApplicationCard extends StatelessWidget {
  const _ApplicationCard(this.ticket);

  final ArtworkTicket ticket;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(kContainerRadius),
      onTap: () => Get.to(() => _ApplicationPage(ticket)),
      child: AppContainer(
        child: Row(
          children: [
            _CardImage(artwork: ticket.artwork),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Заявка ${ticket.id}',
                    style: TextStyles.headline2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'User Id: ${ticket.artwork.addedByUserId}',
                    style: TextStyles.textAdditional,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    ticket.artwork.updatedAt,
                    style: TextStyles.caption,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}

class _ApplicationPage extends StatelessWidget {
  const _ApplicationPage(this.ticket);

  final ArtworkTicket ticket;

  void _approve(BuildContext context) async {
    final token = Get.find<AuthService>().user.value.token!;
    final future = BackendApi.patch(
      '/v1/tickets/approve/${ticket.id}',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    final result = await Utils.showLoading(future);
    if (result == null && context.mounted) {
      Utils.showError('Не удалось выполнить запрос');
    } else if (context.mounted) {
      Utils.showInfo('Работа одобрена');
      Get.back();
    }
  }

  void _reject(BuildContext context) async {
    final token = Get.find<AuthService>().user.value.token!;
    final future = BackendApi.patch(
      '/v1/tickets/reject/${ticket.id}',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    final result = await Utils.showLoading(future);
    if (result == null && context.mounted) {
      Utils.showError('Не удалось выполнить запрос');
    } else if (context.mounted) {
      Utils.showError('Работа отклонена');
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPagePadding,
          child: Column(
            children: [
              AppAppbar(title: 'Заявка ${ticket.id}'),
              const SizedBox(height: 10),
              Expanded(child: ArtworkScreen(artwork: ticket.artwork)),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: AppButton.secondary(onTap: () => _reject(context), label: 'Отклонить'),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: AppButton.primary(onTap: () => _approve(context), label: 'Одобрить'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardImage extends StatelessWidget {
  const _CardImage({required this.artwork});

  final Artwork artwork;

  @override
  Widget build(BuildContext context) {
    if (artwork.images == null || artwork.images!.isEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(kSmallContainerRadius),
        child: const AppPlaceholder(width: 56, height: 56),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(kSmallContainerRadius),
      child: SizedBox(
        width: 56,
        height: 56,
        child: LoadingImage(
          imageLoader: ImagesService.loadFromDisk(
            artwork.images!.first.imageUrl,
            quality: ImageQuality.preview,
          ),
        ),
      ),
    );
  }
}
