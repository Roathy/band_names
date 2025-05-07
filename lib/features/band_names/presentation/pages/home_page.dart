import 'package:band_names/features/band_names/presentation/providers/bands_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../providers/add_band_provider.dart';
import '../widgets/bands_details.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final bandsAsyncValue = ref.watch(bandsProvider);
    final addBandUsecase = ref.read(addBandProvider);

    void addBand() {
      showDialog(
        context: context,
        builder: (context) {
          final TextEditingController bandNameController =
              TextEditingController();
          return AlertDialog(
            title: Text('New Band Name'),
            content: TextField(controller: bandNameController),
            actions: <Widget>[
              MaterialButton(
                onPressed: () async {
                  if (bandNameController.text.isNotEmpty) {
                    await addBandUsecase(bandNameController.text);
                    ref.invalidate(bandsProvider);
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  }
                },
                child: Text('Add'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.colorScheme.secondary,
        onPressed: addBand,
        child: Icon(
          FontAwesomeIcons.plus,
          color: theme.colorScheme.onSecondary,
        ),
      ),
      appBar: AppBar(
        title: const Text('Band Names'),
        backgroundColor: theme.colorScheme.secondary,
        foregroundColor: theme.colorScheme.onSecondary,
      ),
      body: SafeArea(
        child: bandsAsyncValue.when(
          data: (data) {
            return ListView.separated(
              itemBuilder: (context, index) => BandsDetails(band: data[index]),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: data.length,
            );
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
          error: (error, stackTrace) {
            return Center(
              child: Text(
                'Error: $error',
                style: const TextStyle(color: Colors.red),
              ),
            );
          },
        ),
      ),
    );
  }
}
