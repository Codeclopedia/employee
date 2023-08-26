import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../core/constants/text_styles.dart';
import '../../../core/utils/assets_widgets.dart';
import 'custom_elevatedButtons.dart';

class CustomDatePicker extends StatefulWidget {
  final Function() onchange;
  final bool isEndDate;
  const CustomDatePicker(
      {super.key, required this.onchange, required this.isEndDate});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late final DateRangePickerController _dateController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dateController = DateRangePickerController();

    _dateController.addPropertyChangedListener((p0) {
      print(p0);
      print(_dateController.selectedDate);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0),
      child: AlertDialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        titlePadding: EdgeInsets.all(4.w),
        title: widget.isEndDate
            ? Row(
                children: [
                  Expanded(
                    child: CustomElevatedButtons.elevatedUnselectedButton(
                        onpressed: () {}, title: 'No Date'),
                  ),
                  Expanded(
                    child: CustomElevatedButtons.elevatedUnselectedButton(
                        onpressed: () {}, title: 'Today'),
                  ),
                ],
              )
            : Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomElevatedButtons.elevatedUnselectedButton(
                            onpressed: () {}, title: 'Today'),
                      ),
                      Expanded(
                        child: CustomElevatedButtons.elevatedUnselectedButton(
                            onpressed: () {}, title: 'Next Monday'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomElevatedButtons.elevatedUnselectedButton(
                            onpressed: () {}, title: 'Next Tuesday'),
                      ),
                      Expanded(
                        child: CustomElevatedButtons.elevatedUnselectedButton(
                            onpressed: () {}, title: 'After 1 week'),
                      ),
                    ],
                  )
                ],
              ),
        contentPadding: EdgeInsets.zero,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getSvgIcon(svgPath: 'left arrow.svg'),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Text(
                    'August 2023',
                    style: AppTextStyles.titleStyle
                        .copyWith(fontSize: 7.sp, color: Colors.black),
                  ),
                ),
                getSvgIcon(svgPath: 'right arrow.svg')
              ],
            ),
            SizedBox(height: 3.w),
            SizedBox(
              height: 70.w,
              width: 100.w,
              child: SfDateRangePicker(
                onSelectionChanged: (dateRangePickerSelectionChangedArgs) {},
                confirmText: 'save',
                cancelText: 'cancel',
                allowViewNavigation: false,
                enablePastDates: true,
                headerHeight: 0,
                headerStyle: const DateRangePickerHeaderStyle(
                  textAlign: TextAlign.center,
                ),
                controller: _dateController,
                showNavigationArrow: false,
                navigationMode: DateRangePickerNavigationMode.snap,
                selectionMode: DateRangePickerSelectionMode.single,
              ),
            ),
            const Divider(),
            Padding(
              padding:
                  EdgeInsets.only(left: 4.w, right: 4.w, top: 2.w, bottom: 4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  getSvgIcon(
                      svgPath:
                          'event_FILL0_wght300_GRAD0_opsz24 (1) 1 (1).svg'),
                  SizedBox(width: 1.w),
                  Text(
                    '5 Sept 2022',
                    style: TextStyle(fontSize: 6.sp),
                  ),
                  const Spacer(),
                  CustomElevatedButtons.elevatedUnselectedButton(
                      onpressed: () {
                        Navigator.pop(context);
                      },
                      title: 'Cancel'),
                  SizedBox(width: 2.w),
                  CustomElevatedButtons.elevationSelectedButton(
                      onpressed: () {
                        const snackBar = SnackBar(
                          content: Text('Select a date first'),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      title: 'Save')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
