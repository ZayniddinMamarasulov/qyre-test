import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qyre_test/features/home/presentation/widgets/availability_list.dart';
import 'package:qyre_test/features/home/presentation/widgets/cards_list.dart';
import 'package:qyre_test/features/home/presentation/widgets/complete_list.dart';
import 'package:qyre_test/features/home/presentation/widgets/production_list.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../commons/compare_object.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Set<ItemContext>? _itemsContexts;
  BehaviorSubject<ScrollNotification>? _streamController;

  final List<Widget> widgets = [
    AvailabilityList(),
    SizedBox(height: 16),
    CompleteCards(),
    SizedBox(height: 16),
    ProductionList(),
    SizedBox(height: 16),
    CardsList(),
    Container(height: 240, color: Colors.red)
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
        appBar: PreferredSize(
          preferredSize: Size(
              MediaQuery.of(context).size.width, AppBar().preferredSize.height),
          child: Container(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: AppBar(
                  shadowColor: Colors.red,
                  elevation: 0,
                  backgroundColor: Color(0xCCFFFFFF),
                  title: const Text(
                    "My Availability",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scroll) {
            if (!_streamController!.isClosed) {
              _streamController?.add(scroll);
            }
            return false;
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            child: ListView.builder(
                itemCount: widgets.length,
                itemBuilder: (BuildContext context, int index) {
                  _itemsContexts?.add(ItemContext(
                    context: context,
                    id: index,
                  ));
                  return widgets[index];
                }),
          ),
        ));
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

      if (item.id == 1) {
        if (deltaTop + widgetHeight - widgetHeight / 4 < 0) {
          print("------- DONE");
        }
      }
    });
  }
}
