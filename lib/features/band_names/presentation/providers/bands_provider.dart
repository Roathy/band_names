import 'package:band_names/features/band_names/data/providers/band_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/band.dart';

final bandsProvider = FutureProvider<List<Band>>((ref) async {
  final repository = ref.watch(bandRepositoryProvider);
  return repository.getBands();
});
