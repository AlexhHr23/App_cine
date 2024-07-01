import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';

import 'package:cinemapedia/presentation/widgets/widgets.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
      //: Placeholder(fallbackHeight: 100),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView({
    super.key,
  });

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(populargMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    
    if(initialLoading) return const FullScreenLoader();

    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    //now playing movies
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    //popular movies
    final popularMovies = ref.watch(populargMoviesProvider);

    //top rated movies
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    //Upcoming movies
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppBar(),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              Column(
                children: [
                  MoviesSlideshow(movies: slideShowMovies),
                  MovieHorizontalListview(
                      movies: nowPlayingMovies,
                      title: 'En cines',
                      subTilte: 'Lunes 20',
                      loadNextPage: () => ref
                          .read(nowPlayingMoviesProvider.notifier)
                          .loadNextPage()),
                  MovieHorizontalListview(
                      movies: topRatedMovies,
                      title: 'Proximamente',
                      subTilte: 'En este mes',
                      loadNextPage: () => ref
                          .read(topRatedMoviesProvider.notifier)
                          .loadNextPage()),
                  MovieHorizontalListview(
                      movies: popularMovies,
                      title: 'Populares',
                      //subTilte: 'En este mes',
                      loadNextPage: () => ref
                          .read(populargMoviesProvider.notifier)
                          .loadNextPage()),
                  MovieHorizontalListview(
                      movies: upcomingMovies,
                      title: 'Mejor calificadas',
                      subTilte: 'Desde siempre',
                      loadNextPage: () => ref
                          .read(upcomingMoviesProvider.notifier)
                          .loadNextPage()),
                  const SizedBox(height: 10)
                ],
              ),
            ],
          );
        }, childCount: 1))
      ],
    );
  }
}
