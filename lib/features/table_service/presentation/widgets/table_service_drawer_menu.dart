import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/app_scale/app_scale.dart';
import '../../../../core/app_theme/app_theme.dart';
import '../../../../router/app_router.dart';

class TableServiceDrawerMenu extends StatefulWidget {
  const TableServiceDrawerMenu({super.key});

  @override
  State<TableServiceDrawerMenu> createState() => _TableServiceDrawerMenuState();
}

class _TableServiceDrawerMenuState extends State<TableServiceDrawerMenu>
    with SingleTickerProviderStateMixin {
  static const _menuTitles = [
    'Order List',
  ];

  static const _initialDelayTime = Duration(milliseconds: 50);
  static const _itemSlideTime = Duration(milliseconds: 250);
  static const _staggerTime = Duration(milliseconds: 50);
  static const _buttonDelayTime = Duration(milliseconds: 150);
  static const _buttonTime = Duration(milliseconds: 500);
  final _animationDuration = _initialDelayTime +
      (_staggerTime * _menuTitles.length) +
      _buttonDelayTime +
      _buttonTime;

  late AnimationController _staggeredController;

  final List<Interval> _itemSlideIntervals = [];
  late Interval _buttonInterval;

  @override
  void initState() {
    _createAnimationIntervals();

    _staggeredController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..forward();
    super.initState();
  }

  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }

  void _createAnimationIntervals() {
    for (var i = 0; i < _menuTitles.length; ++i) {
      final startTime = _initialDelayTime + (_staggerTime * i);
      final endTime = startTime + _itemSlideTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds,
        ),
      );
    }

    final buttonStartTime =
        Duration(milliseconds: (_menuTitles.length * 50)) + _buttonDelayTime;
    final buttonEndTime = buttonStartTime + _buttonTime;
    _buttonInterval = Interval(
      buttonStartTime.inMilliseconds / _animationDuration.inMilliseconds,
      buttonEndTime.inMilliseconds / _animationDuration.inMilliseconds,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0), // here the desired height
        child: AppBar(
          actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                ),
                onPressed:() => Navigator.pop(context),
              ),
          ],
          // this will hide endDrawer hamburger icon
          title: const Text('Menu'),
        ),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        ..._buildListItems(),
      ],
    );
  }

  List<Widget> _buildListItems() {
    AppScale scale = AppScale(context);

    final listItems = <Widget>[];
    for (var i = 0; i < _menuTitles.length; ++i) {
      String menuTitle = _menuTitles[i];

      listItems.add(
        AnimatedBuilder(
          animation: _staggeredController,
          builder: (context, child) {
            final animationPercent = Curves.easeOut.transform(
              _itemSlideIntervals[i].transform(_staggeredController.value),
            );
            final opacity = animationPercent;
            final slideDistance = (1.0 - animationPercent) * 150;

            return Opacity(
              opacity: opacity,
              child: Transform.translate(
                offset: Offset(slideDistance, 0),
                child: child,
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: scale.pagePadding),
            child: Column(
              children: [
                ListTile(
                  onTap: () => _submit(i),
                  enabled:  true,
                  dense: true,
                  title: Text(
                          menuTitle,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                ),
                const Divider(
                  color: AppTheme.greyColor,
                  thickness: 1,
                  height: 0,
                ),
              ],
            ),
          ),
        ),
      );
    }
    return listItems;
  }

  _submit(int i) async {

    Navigator.pop(context);
    switch (i) {
      case 0:
        return context.go('${AppRouter.tableServicePath}/${AppRouter.orderListPath}');
    }
  }
}
