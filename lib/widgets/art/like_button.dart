import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/data/providers/collection_provider.dart';
import 'package:street_art_witnesses/data/services/auth_service.dart';
import 'package:street_art_witnesses/modules/auth/screen.dart';
import 'package:street_art_witnesses/modules/home/modules/collection/controller.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key, required this.collType, required this.id});

  final CollectionType collType;
  final int id;

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  late final CollectionType collType = widget.collType;
  late final int id = widget.id;
  final collection = Get.find<CollectionController>();

  bool isLoading = false;
  late bool isLiked = collection.isLiked(collType, id);

  void showAuthDialog() async {
    final authAccepted = await Utils.showDialog(
      title: 'Вход в аккаунт',
      content: 'Войдите в аккаунт, чтобы сохранять работы в избранное',
      acceptText: 'Хорошо',
      declineText: 'Позже',
    );
    if (authAccepted ?? false) {
      Get.offUntil(MaterialPageRoute(builder: (context) => const AuthScreen()), (route) => route.isFirst);
    }
  }

  void onTap() {
    // If user not authed, show info message
    if (!Get.find<AuthService>().user.value.isAuthorized) {
      return showAuthDialog();
    }

    // If like is currently loading, abort mission
    if (isLoading) return;

    // We only process likes when collection is loaded
    if (collection.isLoadingArtworks) {
      return;
    }

    toggleLike();
  }

  Future<void> toggleLike() async {
    // Update the visuals
    setState(() {
      isLiked = !isLiked;
      isLoading = true;
    });

    final res = await CollectionProvider.toggleLike(collType, id);

    // completed with error
    if (res == null) {
      Utils.showError('Произошла ошибка');
      return setState(() => isLoading = false);
    }

    // update like status
    isLiked = res;

    if (collType == CollectionType.artworks) collection.loadArtworks();
    if (collType == CollectionType.artists) collection.loadArtists();
    if (collType == CollectionType.festivals) collection.loadFestivals();

    Utils.showSuccess(res ? 'Добавили в коллекцию' : 'Убрали из коллекции');
    return setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CollectionController>(
      builder: (controller) => GestureDetector(
        onTap: onTap,
        child: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
      ),
    );
  }
}
