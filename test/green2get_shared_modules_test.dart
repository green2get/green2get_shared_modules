import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:green2get_shared_modules/modules/__test__/test/logic/picsum_photos_instructions.dart';
import 'package:green2get_shared_modules/modules/__test__/test/models/picsum_photos_models.dart';
import 'package:green2get_shared_modules/modules/__test__/test/widgets/picsum_widget.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'modules/__test__/controllers/app_controller.dart';
import 'modules/__test__/main_app.dart';
import 'green2get_shared_modules_test.mocks.dart';

@GenerateMocks([PicsumPhotosInstructions])
@GenerateNiceMocks([MockSpec<AppController>()])
void main() {
  testWidgets('Displaying an image from picsum.photos', (widgetTester) async {
    final load = MockPicsumPhotosInstructions();
    when(load.getPicsumImageBytes(width: 640, height: 360)).thenAnswer((realInvocation) async {
      return (await rootBundle.load('example/picsum.photos/640x360.jpeg')).buffer.asUint8List();
    });
    await widgetTester.pumpWidget(FutureBuilder<Uint8List?>(
      future: load.getPicsumImageBytes(width: 640, height: 360),
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data == null) return const SizedBox();

        return Image.memory(data);
      },
    ));
    expect(find.byType(SizedBox), findsOneWidget);
    await widgetTester.pump();

    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('Displaying an image from picsum.photos, attaching it to PicsumWidget', (widgetTester) async {
    final load = MockPicsumPhotosInstructions();
    when(load.getPicsumImageBytes(width: 640, height: 360)).thenAnswer((realInvocation) async {
      return (await rootBundle.load('example/picsum.photos/640x360.jpeg')).buffer.asUint8List();
    });
    PicsumWidget.setLoadingPicsumPhotoBuilder(() => load);
    await widgetTester.pumpWidget(const PicsumWidget(width: 640, height: 360));
    expect(find.byType(SizedBox), findsOneWidget);
    await widgetTester.pump();

    expect(find.byType(Image), findsOneWidget);
  });

  test('Obtaining an image list from picsum.photos', () async {
    final load = MockPicsumPhotosInstructions();
    when(load.getPicsumImageList()).thenAnswer((realInvocation) async {
      return PicsumPhotosItemList([
        for (int i = 0; i < 30; i++)
          {
            "id": "$i",
            "author": "Random Name#$i",
            "width": 640,
            "height": 360,
            "url": "https://unsplash.com",
            "download_url": "https://picsum.photos"
          },
      ]);
    });

    final value = await load.getPicsumImageList();
    expect(value, isA<PicsumPhotosItemList>());
    expect(value?.length, 30);
  });

  testWidgets('Displaying an image from picsum.photos, attaching it to PicsumMixinWidget', (widgetTester) async {
    final mockApp = MockAppController();

    when(mockApp.getPicsumImageBytes(width: 640, height: 360)).thenAnswer((realInvocation) async {
      return (await rootBundle.load('example/picsum.photos/640x360.jpeg')).buffer.asUint8List();
    });

    when(mockApp.onStart).thenReturn(InternalFinalCallback(callback: () {}));
    when(mockApp.onDelete).thenReturn(InternalFinalCallback(callback: () {}));

    final app = MainApp<MockAppController>(mockController: mockApp);

    await widgetTester.pumpWidget(app);
    expect(find.byType(SizedBox), findsOneWidget);
    await widgetTester.pump();

    expect(find.byType(Image), findsOneWidget);
  });
}
