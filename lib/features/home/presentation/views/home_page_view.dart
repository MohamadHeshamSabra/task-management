import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_app/features/home/cubits/all_todos_cubit/all_todos_cubit.dart';
import 'package:task_manager_app/features/home/presentation/views/widgets/home_drawer.dart';
import 'package:task_manager_app/features/home/presentation/views/widgets/home_page_view_body.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  String image = "";
  @override
  void initState() {
    BlocProvider.of<AllTodosCubit>(context).getAllTodosForHomePage();
    shared();
    super.initState();
  }

  void shared() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      image = sharedPreferences.getString("image") ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("All Todos"),
      ),
      drawer: HomeDrawer(
        imageUrl: image,
      ),
      body: const HomePageViewBody(),
    );
  }
}
