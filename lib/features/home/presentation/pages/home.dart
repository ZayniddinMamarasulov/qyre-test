import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qyre_test/features/home/presentation/widgets/availability_list.dart';
import 'package:qyre_test/features/home/presentation/widgets/cards_list.dart';
import 'package:qyre_test/features/home/presentation/widgets/complete_list.dart';
import 'package:qyre_test/features/home/presentation/widgets/my_job_offers.dart';
import 'package:qyre_test/features/home/presentation/widgets/production_list.dart';
import 'package:qyre_test/features/home/presentation/widgets/starred_posts.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../commons/compare_object.dart';
import '../../domain/dto/available_dto.dart';
import '../widgets/top_availability_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Set<ItemContext>? _itemsContexts;
  BehaviorSubject<ScrollNotification>? _streamController;
  bool _isTopListVisible = true;

  final List<Widget> widgets = [
    AvailabilityList(),
    SizedBox(height: 16),
    CompleteCards(),
    SizedBox(height: 16),
    ProductionList(),
    SizedBox(height: 16),
    CardsList(),
    SizedBox(height: 24),
    MyJobOffers(),
    SizedBox(height: 24),
    StarredPosts()
  ];

  @override
  void initState() {
    super.initState();

    _itemsContexts = <ItemContext>{};

    _streamController = BehaviorSubject<ScrollNotification>();

    _streamController
        ?.bufferTime(const Duration(
          milliseconds: 100,
        ))
        .where((batch) => batch.isNotEmpty)
        .listen(_onScroll);
  }

  @override
  void dispose() {
    _itemsContexts?.clear();
    _itemsContexts = null;
    _streamController?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: buildHomeAppBar(),
        body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scroll) {
            if (!_streamController!.isClosed) {
              _streamController?.add(scroll);
            }
            return false;
          },
          child: Container(
            padding:
                const EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 0),
            child: ListView.builder(
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: widgets.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    _itemsContexts?.add(ItemContext(
                      context: context,
                      id: index,
                    ));
                  }
                  return widgets[index];
                }),
          ),
        ));
  }

  PreferredSizeWidget buildHomeAppBar() {
    double appBarHeight = AppBar().preferredSize.height;
    if (!_isTopListVisible) {
      appBarHeight = 96;
    }

    return PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, appBarHeight),
      child: Container(
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: AppBar(
              shadowColor: Colors.red,
              elevation: 0,
              backgroundColor: const Color(0xCCFFFFFF),
              title: Container(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "My Availability",
                      style: TextStyle(color: Colors.black),
                    ),
                    buildAppBarList()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAppBarList() {
    if (!_isTopListVisible) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 12),
          Container(
            height: 96,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: AvailableDto.days.length,
                itemBuilder: (BuildContext context, int index) {
                  return TopAvailabilityItem(AvailableDto.days[index]);
                }),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  void _onScroll(List<ScrollNotification> notifications) {
    _itemsContexts?.forEach((ItemContext item) {
      final RenderObject? object = item.context.findRenderObject();

      if (object == null || !object.attached) {
        return;
      }

      final RenderAbstractViewport? viewport =
          RenderAbstractViewport.of(object);
      final double? vpHeight = viewport?.paintBounds.height;
      final ScrollableState? scrollableState = Scrollable.of(item.context);
      final ScrollPosition? scrollPosition = scrollableState?.position;
      final RevealedOffset? vpOffset = viewport?.getOffsetToReveal(object, 0.0);

      final Size? size = object.semanticBounds.size;

      final double? deltaTop = vpOffset!.offset - scrollPosition!.pixels;
      final double? deltaBottom = deltaTop! + size!.height;

      final double widgetHeight = MediaQuery.of(context).size.height * 0.2;

      // print("deltaTop = $deltaTop");
      if (deltaTop + widgetHeight / 6 < 0) {
        // print("------- DONE");
        if (_isTopListVisible) {
          setState(() {
            _isTopListVisible = false;
            print("HIDDEN");
          });
        }
      } else {
        if (!_isTopListVisible) {
          setState(() {
            _isTopListVisible = true;
            print("VISIBLE");
          });
        }
      }
    });
  }
}
