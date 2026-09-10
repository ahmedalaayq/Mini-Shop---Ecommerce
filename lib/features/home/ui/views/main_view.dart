import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shop/core/networking/api_service.dart';
import 'package:mini_shop/core/widgets/app_bottom_navbar.dart';
import 'package:mini_shop/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:mini_shop/features/home/data/repos/home_repo.dart';
import 'package:mini_shop/features/home/logic/cubit/home_cubit.dart';
import 'package:mini_shop/features/home/ui/widgets/home_body.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;

  final List<Widget> _body = [
    BlocProvider(
      create: (_) => HomeCubit(
        homeRepo: HomeRepo(
          homeDataSource: HomeRemoteDataSource(apiService: ApiService()),
        ),
      ),
      child: const HomeBody(),
    ),
    const Center(child: Text('Cart View')),
    const Center(child: Text('Account View')),
  ];
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        bottomNavigationBar: AppBottomNavigationBar(
          currentIndex: currentIndex,
          onItemSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        body: SafeArea(child: _body[currentIndex]),
      ),
    );
  }
}
