import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shop/core/widgets/app_bottom_navbar.dart';
import 'package:mini_shop/features/home/data/data_sources/home_local_data_source.dart';
import 'package:mini_shop/features/home/data/repos/home_repo.dart';
import 'package:mini_shop/features/home/logic/cubit/category_cubit/category_cubit.dart';
import 'package:mini_shop/features/home/logic/cubit/product_cubit/product_cubit.dart';
import 'package:mini_shop/features/home/ui/widgets/home_body.dart';

import '../widgets/favorite_body.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;

  late final List<Widget> body;

  @override
  void initState() {
    super.initState();

    body = [
      const HomeBody(),
      const FavoriteView(),
      const Center(child: Text('Cart View')),
      const Center(child: Text('Account View')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CategoryCubit(
            homeRepo: HomeRepo(homeDataSource: HomeLocalDataSource()),
          ),
        ),
        BlocProvider(
          create: (_) => ProductCubit(
            homeRepo: HomeRepo(homeDataSource: HomeLocalDataSource()),
          ),
        ),
      ],
      child: PopScope(
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
          body: SafeArea(child: body[currentIndex]),
        ),
      ),
    );
  }
}
