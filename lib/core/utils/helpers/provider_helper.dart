import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/homepage/data/models/person.dart';

class ProviderHelper {
  late StateProvider<Person?> personProvider;

  ProviderHelper() {
    personProvider = StateProvider<Person?>((ref) => null);
  }

  void invalidateProviders(WidgetRef ref) {
    ref.invalidate(personProvider);
  }
}
