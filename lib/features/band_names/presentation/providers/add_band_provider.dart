import 'package:band_names/features/band_names/data/providers/band_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/add_band.dart';

final addBandProvider = Provider<AddBand>((ref) {
  final repository = ref.watch(bandRepositoryProvider);
  return AddBand(repository);
});
