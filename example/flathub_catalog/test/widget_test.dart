// SPDX-License-Identifier: Apache-2.0
// SPDX-FileCopyrightText: 2026 Joel Winarske <joel.winarske@gmail.com>

import 'package:flutter_test/flutter_test.dart';

import 'package:flathub_catalog/main.dart';

void main() {
  testWidgets('App starts without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const FlathubCatalogApp());
    expect(find.byType(FlathubCatalogApp), findsOneWidget);
  });
}
