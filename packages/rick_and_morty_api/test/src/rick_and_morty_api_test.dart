// ignore_for_file: prefer_const_constructors
import 'package:rick_and_morty_api/rick_and_morty_api.dart';
import 'package:test/test.dart';

void main() {
  group('RickAndMortyApi', () {
    test('can be instantiated', () {
      expect(RickAndMortyApi(), isNotNull);
    });
  });
}
