import 'package:fake_api_exam/features/homepage/data/repositories/HomepageRepositoryImpl.dart';
import 'package:fake_api_exam/features/homepage/data/repositories/datasourceimpl/persons_remote_datasource_impl.dart';
import 'package:fake_api_exam/features/homepage/domain/usecases/get_list_of_persons_usecase.dart';
import 'package:fake_api_exam/features/homepage/presentation/blocs/homepage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/dio_client.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DioClient _client;
  late PersonsRemoteDatasourceImpl personsRemoteDatasourceImpl;
  late HomepageRepositoryImpl homepageRepositoryImpl;
  late GetListOfPersonsUseCase getListOfPersonsUseCase;

  String _strResponse = '';

  @override
  void initState() {
    _client = DioClient();
    personsRemoteDatasourceImpl = PersonsRemoteDatasourceImpl(client: _client);
    homepageRepositoryImpl = HomepageRepositoryImpl(
        personRemoteDatasource: personsRemoteDatasourceImpl);
    getListOfPersonsUseCase =
        GetListOfPersonsUseCase(repository: homepageRepositoryImpl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return HomepageCubit(getListOfPersonsUseCase);
        }),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<HomepageCubit, HomepageState>(
            listener: (context, state) {
              if (state is HomepageInitial) {
                print(state);
              } else if (state is LoadListOfPersonSuccess) {
                print('success: ${state.apiResponse}');
                _strResponse = state.apiResponse.toString();
              }
            },
          ),
        ],
        child: BlocBuilder<HomepageCubit, HomepageState>(
          builder: (context, state) {
            context.read<HomepageCubit>().getListOfPersons(20);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: Text(widget.title),
              ),
              body: Center(
                child: Text(_strResponse),
              ),
            );
          },
        ),
      ),
    );
  }
}
