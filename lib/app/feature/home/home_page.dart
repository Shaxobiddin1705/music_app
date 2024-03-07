import 'package:music_app/app/app_bloc/app_bloc.dart';
import 'package:music_app/app/design_system/design_system.dart';
import 'package:music_app/app/feature/current_track/current_track_view.dart';
import 'package:music_app/app/navigation/src/navigation_utils.dart';
import 'package:music_app/app/navigation/src/routing_utils.dart';
import 'package:music_app/data/core/core.dart';
import 'package:music_app/domain/model/search_album.dart';

part 'components/loaded_view.dart';

part 'components/loading_view.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        body: RefreshIndicator(
          displacement: 80,
          onRefresh: () {
            return Future.wait([
              context.read<SearchAlbumCubit>().search(),
            ]);
          },
          child: CustomScrollView(
            slivers: [
              MySliverAppBar(
                title: const Text('Daily Recommended'),
                actions: [
                  IconButton(
                    onPressed: () {
                      NavigationUtils.getMainNavigator()
                          .navigateLocalTracks(context);
                    },
                    color: AppColors.primaryColor,
                    icon: const Icon(Icons.file_download),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              BlocBuilder<SearchAlbumCubit, SearchAlbumState>(
                builder: (context, state) {
                  return state.when(
                    loaded: (albums) => _LoadedView(albums),
                    initial: () => const _LoadingView(),
                    loading: () => const _LoadingView(),
                    error: (e) => _ErrorView(e),
                  );
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: const CurrentTrackView(),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String error;

  const _ErrorView(this.error);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Text(
            error,
            style: TextStyleX.styleF16W500.copyWith(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
