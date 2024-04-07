import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/modules/home/modules/collection/controller.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SAScaffold(
      header: SAHeader(
        title: 'Ваша Коллекция',
        autoImplyLeading: false,
        action: GestureDetector(onTap: () {}, child: const Icon(Icons.search)),
      ),
      paddings: kPagePadding,
      body: GetBuilder<CollectionController>(builder: (controller) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: SATextButton(
                  onTap: () => controller.switchPage(Collection.artworks),
                  label: 'Работы',
                  isFilled: controller.coll == Collection.artworks,
                )),
                const SizedBox(width: 16),
                Expanded(
                    child: SATextButton(
                  onTap: () => controller.switchPage(Collection.artists),
                  label: 'Авторы',
                  isFilled: controller.coll == Collection.artists,
                )),
                const SizedBox(width: 16),
                Expanded(
                  child: SATextButton(
                    onTap: () => controller.switchPage(Collection.festivals),
                    label: 'Фестивали',
                    isFilled: controller.coll == Collection.festivals,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(child: controller.view),
          ],
        );
      }),
    );
  }
}
