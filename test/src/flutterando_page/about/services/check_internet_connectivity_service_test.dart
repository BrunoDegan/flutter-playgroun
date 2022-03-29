import 'package:flutter_playground/src/flutterando_page/about/services/check_internet_connectivity_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CheckConnectivityServiceMock extends Mock
    implements CheckConnectivityService {}

void main() {
  late CheckConnectivityServiceMock service;

  setUp(() {
    service = CheckConnectivityServiceMock();
  });

  test('Given internet connection When check connection Then returns true',
      () async {
    when(() => service.isConnected()).thenAnswer((_) => Future.value(true));

    bool result = await service.isConnected();

    expect(result, true);
  });

  test('Given no internet connection When check connection Then returns false',
      () async {
    when(() => service.isConnected()).thenAnswer((_) => Future.value(false));

    bool result = await service.isConnected();

    expect(result, false);
  });
}
