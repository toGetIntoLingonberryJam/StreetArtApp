import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/pages/artwork/artwork_page.dart';
import 'package:street_art_witnesses/src/blocs/settings/settings_cubit.dart';
import 'package:street_art_witnesses/src/data/backend_datasource.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork.dart';
import 'package:street_art_witnesses/src/providers/user_provider.dart';
import 'package:street_art_witnesses/src/services/images_service.dart';
import 'package:street_art_witnesses/src/utils/logger.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';
import 'package:street_art_witnesses/widgets/buttons/app_button.dart';
import 'package:street_art_witnesses/widgets/containers/app_container.dart';
import 'package:street_art_witnesses/widgets/other/app_appbar.dart';
import 'package:street_art_witnesses/widgets/other/app_error.dart';
import 'package:street_art_witnesses/widgets/other/app_loading_indicator.dart';
import 'package:street_art_witnesses/widgets/other/image_slider.dart';
import 'package:street_art_witnesses/widgets/skeletons/app_placeholder.dart';

class ApplicationsPage extends StatelessWidget {
  const ApplicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserProvider>().user;
    if (!user.isModerator) return const AppErrorScreen();

    final future = BackendDataSource.get('/v1/tickets', requestType: RequestType.unknown);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPagePadding,
          child: Column(
            children: [
              const AppAppbar(title: 'Заявки'),
              const SizedBox(height: 20),
              Expanded(
                child: FutureBuilder(
                    future: future,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        final List json = snapshot.data!.data;
                        final data = json
                            .where((e) => e['ticket_type'] == 'create' && e['status'] == 'pending')
                            .toList();
                        for (final item in data) {
                          Logger.warning(item.toString());
                        }

                        return SingleChildScrollView(
                          child: Column(
                            children: data.map((e) {
                              final artwork = Artwork.fromTicket(e);
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: _ApplicationCard(artwork, e['id']),
                              );
                            }).toList(),
                          ),
                        );
                      }
                      return const Center(child: AppLoadingIndicator());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ApplicationCard extends StatelessWidget {
  const _ApplicationCard(this.artwork, this.ticketId);

  final Artwork artwork;
  final int ticketId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(kContainerRadius),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => _ApplicationPage(artwork, ticketId),
      )),
      child: AppContainer(
        child: Row(
          children: [
            _CardImage(artwork: artwork),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Заявка $ticketId',
                    style: TextStyles.headline2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'User Id: ${artwork.addedByUserId}',
                    style: TextStyles.textAdditional,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    artwork.updatedAt,
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
  const _ApplicationPage(this.artwork, this.ticketId);

  final Artwork artwork;
  final int ticketId;

  void _approve(BuildContext context) async {
    final token = context.read<UserProvider>().user.token!;
    final future = BackendDataSource.patch(
      '/v1/tickets/approve/$ticketId',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      requestType: RequestType.unknown,
    );
    final result = await Utils.of(context).showLoading(future);
    if (result == null && context.mounted) {
      Utils.of(context).showError('Не удалось выполнить запрос');
    } else if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  void _reject(BuildContext context) async {
    final token = context.read<UserProvider>().user.token!;
    final future = BackendDataSource.patch(
      '/v1/tickets/reject/$ticketId',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      requestType: RequestType.unknown,
    );
    final result = await Utils.of(context).showLoading(future);
    if (result == null && context.mounted) {
      Utils.of(context).showError('Не удалось выполнить запрос');
    } else if (context.mounted) {
      Navigator.of(context).pop();
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
              AppAppbar(title: 'Заявка $ticketId'),
              const SizedBox(height: 10),
              Expanded(child: ArtworkPage(artwork: artwork)),
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
