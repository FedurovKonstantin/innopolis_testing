import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:inno_testing/api.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('checkIsEnabled', () {
    test('returns an true if the http call completes successfully', () async {
      final client = MockClient();
      final api = Api(client);

      /// Use Mockito to return a successful response when it calls the
      /// provided http.Client.
      when(
        client.get(
          Uri.parse('check'),
        ),
      ).thenAnswer(
        (_) async => http.Response('', 200),
      );
      final result = await api.check();

      expect(result, isTrue);
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();
      final api = Api(client);

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.get(
        Uri.parse(
          'check',
        ),
      )).thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );

      expect(api.check(), throwsException);
    });
  });
}
