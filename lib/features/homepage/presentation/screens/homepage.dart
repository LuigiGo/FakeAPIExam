import 'dart:ui';

import 'package:fake_api_exam/core/const/string_conts.dart';
import 'package:fake_api_exam/core/network/exceptions/server_error.dart';
import 'package:fake_api_exam/core/utils/common_widgets/reusable_card_container.dart';
import 'package:fake_api_exam/core/utils/common_widgets/reusable_circular_button.dart';
import 'package:fake_api_exam/core/utils/common_widgets/reusable_list_item1.dart';
import 'package:fake_api_exam/core/utils/common_widgets/reusable_list_item_container.dart';
import 'package:fake_api_exam/core/utils/common_widgets/text_title_medium.dart';
import 'package:fake_api_exam/core/utils/helpers/dialog_helper.dart';
import 'package:fake_api_exam/core/utils/helpers/provider_helper.dart';
import 'package:fake_api_exam/core/utils/helpers/responsive_helper.dart';
import 'package:fake_api_exam/core/utils/mapper/list_item_mapper.dart';
import 'package:fake_api_exam/features/homepage/presentation/blocs/homepage_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../core/const/routes_const.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/resource/color_palette.dart';
import '../../../../core/utils/common_widgets/primary_button.dart';
import '../../data/models/person.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState<Homepage> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {
  List<Person> persons = [];

  int _loadMoreDataCounter = 0;
  bool isShowLoadMoreButton = false;
  late BuildContext _context;
  late ScrollController _scrollController;
  late GlobalKey<RefreshIndicatorState> _refreshIndicatorKey;
  final DialogHelper _dialog = inject<DialogHelper>();
  final ResponsiveHelper _responsiveHelper = inject<ResponsiveHelper>();

  @override
  void initState() {
    _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
    _initScrollListener();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _refreshIndicatorKey.currentState?.show();
    });

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
            print(state);
            if (state is RefreshHomepage) {
              _loadMoreDataCounter = 0;
              persons.clear();
            } else if (state is LoadListOfPersonSuccess) {
              isShowLoadMoreButton = false;
              _loadMoreDataCounter++;
              persons.addAll(state.persons);
            } else if (state is LoadListOfPersonFailed) {
              ServerError err = state.serverError;
              _dialog.showOneButtonDialog(
                _context,
                title: err.header,
                subtitle: err.message,
                buttonTitle: 'Okay',
              );
            }
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

        return Scaffold(
          appBar: AppBar(
            title: const Text(StringConst.kPersonBook),
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
      child: ResponsiveBuilder(
        builder: (context, sizingInfo) {
          return Center(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                        },
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        controller: _scrollController,
                        physics: const AlwaysScrollableScrollPhysics(),
                        key: const PageStorageKey(0),
                        itemCount: persons.length,
                        itemBuilder: (_, i) {
                          Person person = persons[i];
                          String name =
                              '${person.firstname} ${person.lastname}';

                          return ReusableCardContainer(
                            cardWidth: _responsiveHelper.setResponsiveWidth(
                              sizingInfo: sizingInfo,
                            ),
                            cardContent: ReusableListItemContainer(
                              card: ReusableListItem1(
                                listItemMapper: ListItemMapper(
                                  image: person.image,
                                  title: name,
                                  subtitle: person.email,
                                ),
                              ),
                              circularButton: ReusableCircularButton(
                                icon: Icons.info_outline_rounded,
                                buttonColor: AppColors.defaultButtonColor,
                                onPressed: () {
                                  ref
                                      .read(inject<ProviderHelper>()
                                          .personProvider
                                          .notifier)
                                      .state = person;
                                  Navigator.pushNamed(
                                    context,
                                    RoutesConst.detailsPage,
                                    arguments: person,
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: !kIsWeb && state is LoadListOfPersonsLoading,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 30.0,
                      height: 30.0,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
                Visibility(
                  visible: kIsWeb && isShowLoadMoreButton,
                  child: Container(
                    width: _responsiveHelper.setResponsiveWidth(
                      sizingInfo: sizingInfo,
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: PrimaryButton(
                      buttonTitle: StringConst.kLoadMore,
                      onPressed: () => _loadMoreData(20),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _initScrollListener() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        bool isTopOfList = _scrollController.position.pixels == 0;
        if (!isTopOfList) {
          if (_loadMoreDataCounter <= 4) {
            if (!kIsWeb) {
              _loadMoreData(20);
            } else {
              setState(() {
                isShowLoadMoreButton = true;
              });
            }
          } else {
            if (!kIsWeb) {
              const snackBar = SnackBar(
                content: TextTitleMedium(
                  value: StringConst.kTheresNoAvailableData,
                  textColor: AppColors.snackbarLabelColor,
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }
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
