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

  late BuildContext _context;
  late HomepageState _state;
  late ScrollController _scrollController;

  @override
  void initState() {
    _initScrollListener();
    super.initState();
  }

  void _initScrollListener() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        bool isTopOfList = _scrollController.position.pixels == 0;
        if (!isTopOfList) {
          setState(() {
            _loadMoreData(20);
          });
        }
      }
    });
  }

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
            _state = state;
            _context = context;

            if (state is HomepageInitial) {
              _loadMoreData(10);
            }

            return Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
              ),
              body: _buildBody(context, state),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, HomepageState state) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: ListView.separated(
            controller: _scrollController,
            key: const PageStorageKey(0),
            physics: const ScrollPhysics(),
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
                child: Container(
                  decoration: BoxDecoration(),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(height: 1);
            },
          ),
        ),
        Visibility(
          visible: state is LoadListOfPersonsLoading,
          child: const CircularProgressIndicator(),
        ),
      ],
    );
  }

  void _loadMoreData(
    int quantity, {
    bool isRefresh = false,
  }) {
    _context
        .read<HomepageCubit>()
        .getListOfPersons(quantity, isRefresh: isRefresh);
  }
}
