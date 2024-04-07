import 'package:fake_api_exam/core/const/image_const.dart';
import 'package:fake_api_exam/core/di/injection.dart';
import 'package:fake_api_exam/core/utils/common_widgets/text_title_medium.dart';
import 'package:fake_api_exam/core/utils/helpers/responsive_helper.dart';
import 'package:fake_api_exam/core/utils/helpers/string_helper.dart';
import 'package:fake_api_exam/core/utils/mapper/list_item_mapper.dart';
import 'package:fake_api_exam/features/details/presentation/widgets/personal_info_card_content.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/utils/common_widgets/primary_button.dart';
import '../../../core/utils/common_widgets/reusable_dotted_container.dart';
import '../../../core/utils/common_widgets/reusable_list_item2.dart';
import '../../../core/utils/helpers/provider_helper.dart';
import '../../homepage/data/models/person.dart';

class PersonInfoPage extends ConsumerStatefulWidget {
  final Person? person;

  const PersonInfoPage({
    Key? key,
    this.person,
  }) : super(key: key);

  @override
  ConsumerState<PersonInfoPage> createState() => _PersonInfoPageState();
}

class _PersonInfoPageState extends ConsumerState<PersonInfoPage> {
  late BuildContext _context;
  late Person? _person;
  List<ListItemMapper> items = [];
  final ProviderHelper _providerHelper = inject<ProviderHelper>();
  final ResponsiveHelper _responsiveHelper = inject<ResponsiveHelper>();

  @override
  void initState() {
    initializeInformation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(ref.watch(_providerHelper.personProvider));

    _context = context;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: !kIsWeb ? true : false,
        title: const Text('Personal Information'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        return Center(
          child: SizedBox(
            width: _responsiveHelper.setResponsiveWidth(sizingInfo: sizingInfo),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ReusableDottedContainer(
                    cardContent: PersonalInfoCardContent(
                      person: _person,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  PrimaryButton(
                    buttonTitle: _person?.website,
                    onPressed: () {
                      return _launchURL(_person?.website ?? '');
                    },
                  ),
                  const SizedBox(height: 50.0),
                  _buildAdditionalInfo(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Expanded _buildAdditionalInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextTitleMedium(
            value: 'Additional Information',
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: ListView.separated(
              itemCount: items.length,
              itemBuilder: (context, i) {
                ListItemMapper item = items[i];
                return ReusableListItem2(
                  listItemMapper: ListItemMapper(
                    image: item.image,
                    title: item.title?.toCapitalize(),
                    subtitle: item.subtitle,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(height: 1),
            ),
          ),
        ],
      ),
    );
  }

  void initializeInformation() {
    _person = widget.person;
    items.add(
      ListItemMapper(
        image: ImageConst.defaultImagePlaceholder,
        title: _person?.phone,
        subtitle: 'Phone | Mobile',
      ),
    );
    items.add(
      ListItemMapper(
        image: ImageConst.defaultImagePlaceholder,
        title: _person?.email,
        subtitle: 'Personal | Email',
      ),
    );
    items.add(
      ListItemMapper(
        image: ImageConst.defaultImagePlaceholder,
        title: _person?.gender,
        subtitle: 'Gender',
      ),
    );
    items.add(
      ListItemMapper(
        image: ImageConst.defaultImagePlaceholder,
        title: _person?.birthday,
        subtitle: 'Birthday',
      ),
    );
  }

  Future<void> _launchURL(String urlPath) async {
    final Uri url = Uri.parse(urlPath);
    if (await launchUrl(url)) {
      throw Exception('Could not launch $urlPath');
    }
  }
}
