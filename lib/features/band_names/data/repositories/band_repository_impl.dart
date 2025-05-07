import 'package:band_names/features/band_names/data/datasources/local/bands.dart';
import 'package:band_names/features/band_names/domain/models/band.dart';

import '../../domain/repositories/band_repository.dart';

class BandRepositoryImpl implements BandRepository {
  @override
  Future<void> addBand(Band band) async {
    await Future.delayed(const Duration(seconds: 1));
    bands.add(band);
  }

  @override
  Future<List<Band>> getBands() async {
    await Future.delayed(const Duration(seconds: 1));
    return Future.value(bands);
  }
}
