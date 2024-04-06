import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_api_exam/core/const/image_const.dart';
import 'package:fake_api_exam/core/utils/common_widgets/reusable_card_container.dart';
import 'package:fake_api_exam/core/utils/common_widgets/reusable_circular_button.dart';
import 'package:fake_api_exam/features/homepage/presentation/blocs/homepage_cubit.dart';
import 'package:fake_api_exam/features/homepage/presentation/screens/widgets/person_details_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/const/routes_const.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/resource/color_palette.dart';
import '../../../../core/utils/common_widgets/reusable_list_item.dart';
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
  late ScrollController _scrollController;
  late GlobalKey<RefreshIndicatorState> _refreshIndicatorKey;

  @override
  void initState() {
    _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
    _initScrollListener();
    super.initState();
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
      child: _buildMultiBlocListener(),
    );
  }

  MultiBlocListener _buildMultiBlocListener() {
    return MultiBlocListener(
      listeners: [
        BlocListener<HomepageCubit, HomepageState>(
          listener: (_, state) {
            if (state is RefreshHomepage) {
              persons.clear();
            } else if (state is LoadListOfPersonSuccess) {
              persons.addAll(state.persons);
            } else if (state is LoadListOfPersonFailed) {}
          },
        ),
      ],
      child: _buildBlocBuilder(),
    );
  }

  BlocBuilder<HomepageCubit, HomepageState> _buildBlocBuilder() {
    return BlocBuilder<HomepageCubit, HomepageState>(
      builder: (context, state) {
        _context = context;

        if (state is HomepageInitial) {
          _refreshIndicatorKey.currentState?.show();
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: _buildBody(context, state),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, HomepageState state) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: () async {
        await _loadMoreData(10, isRefresh: true);
      },
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                key: const PageStorageKey(0),
                itemCount: persons.length,
                itemBuilder: (_, i) {
                  Person person = persons[i];
                  return ReusableListItem(
                    card: ReusableCardContainer(
                      cardContent: PersonDetailsContent(person: person),
                    ),
                    circularButton: ReusableCircularButton(
                      buttonColor: AppColors.circularButtonColor,
                      icon: Icons.info_outline_rounded,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RoutesConst.detailsPage,
                          arguments: person,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          Visibility(
            visible: state is LoadListOfPersonsLoading,
            child: const CircularProgressIndicator(),
          ),
        ],
      ),
    );
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

  Future<void> _loadMoreData(
    int quantity, {
    bool isRefresh = false,
  }) async {
    await _context
        .read<HomepageCubit>()
        .getListOfPersons(quantity, isRefresh: isRefresh);
  }
}
