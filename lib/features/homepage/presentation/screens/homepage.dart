import 'package:fake_api_exam/features/homepage/presentation/blocs/homepage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/const/routes_const.dart';
import '../../../../core/di/injection.dart';
import '../../data/models/person.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, required this.title});

  final String title;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Person> persons = [];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return HomepageCubit(
            getListOfPersonsUseCase: inject(),
          );
        }),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<HomepageCubit, HomepageState>(
            listener: (_, state) {
              if (state is LoadListOfPersonSuccess) {
                persons.addAll(state.persons);
              } else if (state is LoadListOfPersonFailed) {}
            },
          ),
        ],
        child: BlocBuilder<HomepageCubit, HomepageState>(
          builder: (context, state) {
            if (state is HomepageInitial) {
              context.read<HomepageCubit>().getListOfPersons(10);
            }

            return Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
              ),
              body: ListView.separated(
                itemCount: persons.length,
                itemBuilder: (_, i) {
                  Person person = persons[i];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RoutesConst.detailsPage,
                        arguments: person,
                      );
                    },
                    child: ListTile(
                      title: Text(person.firstname ?? ''),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(height: 1);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
