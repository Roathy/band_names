import 'package:go_router/go_router.dart';

import '../../features/band_names/presentation/pages/home_page.dart';

class AppRouter {
  final GoRouter appRouter;
  final String tag;

  static const String home = '/home';

  AppRouter()
    : appRouter = GoRouter(
        initialLocation: AppRouter.home,
        routes: [
          GoRoute(
            path: AppRouter.home,
            name: AppRouter.home,
            builder: (context, state) => const HomePage(),
          ),
        ],
      ),
      tag = 'default-router';
}
