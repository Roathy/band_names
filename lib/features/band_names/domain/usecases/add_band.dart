import '../models/band.dart';
import '../repositories/band_repository.dart';

class AddBand {
  final BandRepository repository;

  AddBand(this.repository);

  Future<void> call(String name) async {
    await repository.addBand(Band(name: name));
  }
}
