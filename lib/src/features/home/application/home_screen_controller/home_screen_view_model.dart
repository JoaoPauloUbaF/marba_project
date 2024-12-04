import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/search/application/search_view_model/search_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../user_profile/application/current_user_profile_provider/current_user_profile_provider.dart';

part 'home_screen_view_model.g.dart';

@riverpod
class HomeScreenViewModel extends _$HomeScreenViewModel {
  @override
  HomeScreenState build() {
    ref.watch(authStateChangeProvider);
    // ref.watch(currentUserProvider);
    mockLoading();
    return (HomeScreenState.loading);
  }

  Future<void> mockLoading() async {
    await Future.delayed(const Duration(seconds: 1), () {
      state = HomeScreenState.loaded;
    });
  }

  bool? thisUserHasBusiness() {
    final user = ref.read(currentUserProvider);
    if (user == null) {
      return false;
    }

    return user.isBusinessOwner;
  }

  void isUserRegistrationComplete(BuildContext context) async {
    final user = ref.read(authRepositoryProvider).getCurrentUser();
    if (user == null) {
      return null;
    }
    await ref.read(authRepositoryProvider).checkUserRegistration(user.uid).then(
        (value) => value
            ? null
            : Navigator.pushNamedAndRemoveUntil(
                context, '/profile-form', (route) => false));
  }

  void onSearch(
      {required String query, required void Function(int index) onItemTap}) {
    if (query.isEmpty || query.length < 3) {
      return;
    }
    onItemTap(0);
    Future.delayed(const Duration(milliseconds: 100), () {
      ref.read(searchViewModelProvider.notifier).setSearchFieldText(query);
      ref.read(searchViewModelProvider.notifier).onSearchSubmit(query: query);
    });
  }
}

enum HomeScreenState { loading, loaded, error }
