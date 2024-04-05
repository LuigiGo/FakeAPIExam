import 'package:fake_api_exam/features/homepage/presentation/blocs/homepage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../data/models/person.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: Text(widget.title),
              ),
              body: ListView.separated(
                itemCount: persons.length,
                itemBuilder: (_, i) {
                  Person person = persons[i];
                  return ListTile(
                    title: Text(person.firstname ?? ''),
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
