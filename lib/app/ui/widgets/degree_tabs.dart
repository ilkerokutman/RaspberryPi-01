import 'package:flutter/material.dart';
import 'package:pi01/app/core/constants/enums.dart';
import 'package:pi01/app/core/utils/common.dart';

class DegreeTabsWidget extends StatelessWidget {
  const DegreeTabsWidget({
    super.key,
    required this.callback,
    required this.activeItem,
    this.disabled = false,
    this.selectedMode = 1,
  });
  final void Function(DegreeControlTabItem) callback;
  final bool disabled;
  final DegreeControlTabItem activeItem;
  final int selectedMode;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(-1, 0),
      child: Container(
        width: CU.toLogical(254),
        height: CU.toLogical(234),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DegreeTabItemWidget(
              itemType: DegreeControlTabItem.setValue,
              isSelected: activeItem == DegreeControlTabItem.setValue,
              disabled:
                  selectedMode == 0 || selectedMode == 3 || selectedMode == 4,
              callback: () {
                callback(DegreeControlTabItem.setValue);
              },
            ),
            DegreeTabItemWidget(
              itemType: DegreeControlTabItem.boiler,
              isSelected: activeItem == DegreeControlTabItem.boiler,
              disabled:
                  selectedMode == 0 || selectedMode == 3 || selectedMode == 4,
              callback: () {
                callback(DegreeControlTabItem.boiler);
              },
            ),
            DegreeTabItemWidget(
              itemType: DegreeControlTabItem.hotWater,
              isSelected: activeItem == DegreeControlTabItem.hotWater,
              disabled: selectedMode == 4,
              callback: () {
                callback(DegreeControlTabItem.hotWater);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DegreeTabItemWidget extends StatelessWidget {
  const DegreeTabItemWidget({
    super.key,
    required this.itemType,
    required this.callback,
    this.isSelected = false,
    this.disabled = false,
  });
  final DegreeControlTabItem itemType;
  final bool isSelected;
  final bool disabled;
  final GestureTapCallback callback;

  @override
  Widget build(BuildContext context) {
    String labelText = '';
    Widget image = Container();
    Color color1 = Colors.transparent;
    Color color2 = Colors.black.withOpacity(0.4);
    if (isSelected) {
      color1 = Colors.black.withOpacity(0.4);
      color2 = Colors.black.withOpacity(0.6);
    }
    if (disabled) {
      color1 = Colors.black.withOpacity(0.2);
      color2 = Colors.black.withOpacity(0.2);
    }
    switch (itemType) {
      case DegreeControlTabItem.boiler:
        labelText = '1.8 bar';
        image = CU.image('radiator.png', w: 55, h: 40);
        break;
      case DegreeControlTabItem.hotWater:
        labelText = 'hot water';
        image = CU.image('faucet.png', w: 49, h: 37);
        break;
      case DegreeControlTabItem.setValue:
        labelText = 'set to';
        image = CU.image('set_icon.png', w: 36, h: 38);
        break;
    }
    return Expanded(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding:
            EdgeInsets.only(left: CU.toLogical(25), right: CU.toLogical(67)),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: InkWell(
          onTap: disabled ? null : callback,
          child: Opacity(
            opacity: disabled
                ? 0.2
                : isSelected
                    ? 1
                    : 0.7,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Opacity(
                        opacity: 0.7,
                        child: Text(
                          labelText,
                          style: TextStyle(
                            fontSize: CU.toLogical(14),
                            fontWeight: FontWeight.w100,
                            height: 1,
                          ),
                        ),
                      ),
                      Text(
                        '24.6 °',
                        style: TextStyle(
                            fontSize: CU.toLogical(22),
                            fontWeight: FontWeight.w300,
                            height: 1),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: CU.toLogical(11)),
                image,
                SizedBox(width: CU.toLogical(11)),
                if (isSelected)
                  Icon(
                    Icons.chevron_right,
                    size: CU.toLogical(16),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
