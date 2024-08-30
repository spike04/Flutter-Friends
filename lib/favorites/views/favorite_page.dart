import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_friends/favorites/favorites.dart';
import 'package:flutter_friends/schedule/schedule.dart';
import 'package:flutter_friends/theme/theme.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FavoriteView();
  }
}

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FFAppBar(),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state.events.isEmpty) return const EmptyFavorites();
          return FavoritesListView(events: state.events);
        },
      ),
    );
  }
}

class EmptyFavorites extends StatelessWidget {
  const EmptyFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.heart_broken_sharp,
              color: Colors.pinkAccent,
              size: 64,
            ),
            const SizedBox(height: 24),
            Text(
              "You don't have any favorites",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Tap the heart icon to add an event to your favorites',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class FavoritesListView extends StatelessWidget {
  const FavoritesListView({required this.events, super.key});

  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      padding: const EdgeInsets.all(12),
      itemCount: events.length,
      itemBuilder: (context, index) => EventCard(event: events[index]),
    );
  }
}
