import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_geeks/user_cubit/user_cubit.dart';
import 'package:office_geeks/user_cubit/user_states.dart';
import 'package:office_geeks/views/main_screen/widgets/info_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        final cubit = UserCubit.get(context);
        return UserCubit.get(context).hotel.owner != null
            ? DefaultTabController(
                length: 2,
                child: Scaffold(
                    appBar: AppBar(
                      title: Text(cubit.hotel.title!),
                      leading: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {},
                      ),
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () {},
                        ),
                      ],
                      bottom: TabBar(
                          indicatorWeight: 3,
                          indicatorColor: Theme.of(context).primaryColor,
                          tabs: const [Text('Info'), Text('Reviews')]),
                    ),
                    body: TabBarView(
                      children: [
                        InfoWidget(),
                        Container(
                          color: Colors.green,
                        )
                      ],
                    )),
              )
            : const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
      },
    );
  }
}
