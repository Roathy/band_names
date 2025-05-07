import '../models/band.dart';

abstract class BandRepository {
  Future<List<Band>> getBands();
  Future<void> addBand(Band band);
}
