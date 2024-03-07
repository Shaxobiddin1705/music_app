import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/app/app_bloc/app_bloc.dart';
import 'package:music_app/app/app_bloc/app_bloc_helper.dart';

@RoutePage(name: 'HomeRouter')
class HomePageWrapper extends AutoRouter implements AutoRouteWrapper {
  const HomePageWrapper({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppBlocHelper.getSearchAlbumCubit()..search(),
        ),
        BlocProvider(
          create: (context) => AppBlocHelper.getPlaylistBloc(),
        ),
        BlocProvider(
          create: (context) => AppBlocHelper.getLocalTracksBloc(),
          lazy: false,
        ),
      ],
      child: this,
    );
  }
}
