import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_projects/projects/image_picker/features/presentation/bloc/image_picker_bloc.dart';
import 'package:flutter_bloc_projects/projects/image_picker/features/presentation/widgets/molecule/image_preview.dart';
import 'package:flutter_bloc_projects/projects/image_picker/features/presentation/widgets/molecule/select_an_image.dart';
import 'package:flutter_bloc_projects/projects/image_picker/features/presentation/widgets/molecule/select_image_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mock/mock_image_picker_bloc.dart';

void main() {
  late MockImagePickerBloc mockBloc;
  const fakePath = 'test_resources/fake_image.jpg';

  setUp(() {
    mockBloc = MockImagePickerBloc();
    File(fakePath).createSync(recursive: true);
  });

  tearDown(() {
    File(fakePath).deleteSync();
  });

  Widget buildTestable(Widget child) {
    return MaterialApp(
      home: BlocProvider<ImagePickerBloc>.value(
        value: mockBloc,
        child: child,
      ),
    );
  }

  Widget buildTestableWithScaffold(Widget child) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider<ImagePickerBloc>.value(
          value: mockBloc,
          child: child,
        ),
      ),
    );
  }

  testWidgets('when build widget show image and delete button', (WidgetTester tester) async {
    //? pumpWidget for build the widget and show it in the screen
    await tester.pumpWidget(buildTestable(const ImagePreview(filePath: fakePath)));

    expect(find.byKey(const ValueKey('image')), findsOneWidget);
    expect(find.byKey(const ValueKey('delete_image')), findsOneWidget);
  });

  testWidgets('when tap on delete button emit ClearImageEvent', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestable(const ImagePreview(filePath: fakePath)));

    await tester.ensureVisible(find.byKey(const ValueKey('delete_image')));
    await tester.tap(find.byKey(const ValueKey('delete_image')));
    await tester.pump();

    verify(() => mockBloc.add(const ClearImageEvent())).called(1);
  });

  testWidgets('when tap on image open bottom sheet for select image source', (WidgetTester tester) async {
    await tester.pumpWidget(
      buildTestableWithScaffold(
        const SelectAnImage(),
      ),
    );

    // Tap en la imagen
    await tester.tap(find.byKey(const ValueKey('select_an_image')));
    await tester.pumpAndSettle();

    // Verificar que aparece el SelectSourceImagePicker
    expect(find.byType(SelectSourceImagePicker), findsOneWidget);
  });
}
