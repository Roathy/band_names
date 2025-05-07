import 'package:band_names/features/band_names/data/repositories/band_repository_impl.dart';
import 'package:riverpod/riverpod.dart';

import '../../domain/repositories/band_repository.dart';

final bandRepositoryProvider = Provider<BandRepository>(
  (ref) => BandRepositoryImpl(),
);
