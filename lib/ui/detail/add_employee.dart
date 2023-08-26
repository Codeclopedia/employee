import 'package:employee_app/core/controller/bloc/employee_detail_bloc_bloc.dart';
import 'package:employee_app/core/data/models/employee_detail_model.dart';
import 'package:employee_app/core/utils/text_type_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer_pro/sizer.dart';

import '../../core/constants/text_styles.dart';
import '../../core/data/db/organisation_utils.dart';
import '../../core/utils/assets_widgets.dart';
import 'details_widgets/custom_datepicker.dart';
import 'details_widgets/custom_elevatedButtons.dart';
import 'details_widgets/custom_textFormFeild.dart';

class AddOrEditEmployeeScreen extends StatefulWidget {
  final EmployeeDetails employeeDetails;
  final bool addDetailPage;
  const AddOrEditEmployeeScreen(
      {super.key, required this.addDetailPage, required this.employeeDetails});

  @override
  State<AddOrEditEmployeeScreen> createState() =>
      _AddOrEditEmployeeScreenState();
}

class _AddOrEditEmployeeScreenState extends State<AddOrEditEmployeeScreen> {
  late final GlobalKey<FormState> formKey;

  late final TextEditingController startingDatetextController;

  late final TextEditingController roletextController;

  late final TextEditingController nametextController;

  late final TextEditingController endingDatetextController;

  @override
  void initState() {
    super.initState();
    //formkey
    formKey = GlobalKey<FormState>();

    //texteditingController
    initializeTextControllers();
  }

  @override
  void dispose() {
    disposeTextControllers();
    super.dispose();
  }

  initializeTextControllers() {
    nametextController =
        TextEditingController(text: widget.employeeDetails.name);
    roletextController =
        TextEditingController(text: widget.employeeDetails.role);
    startingDatetextController = TextEditingController(
        text: DateFormat('dd MMM yyyy')
            .format(widget.employeeDetails.startingDate ?? DateTime.now()));
    endingDatetextController = TextEditingController(
        text: widget.employeeDetails.endingDate == null
            ? 'No Data'
            : DateFormat('dd MMM yyyy')
                .format(widget.employeeDetails.endingDate!));
  }

  disposeTextControllers() {
    nametextController.dispose();
    roletextController.dispose();
    startingDatetextController.dispose();
    endingDatetextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeeDetailBlocBloc(),
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          leadingWidth: 0,
          title: Text(
            '${widget.addDetailPage ? 'Add' : 'Edit'} Employee Details',
            style: AppTextStyles.titleStyle,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 3.h),
          child: Form(
            key: formKey,
            child: Column(children: [
              prefixTextFormField(
                  onchanged: (value) {},
                  controller: nametextController,
                  hintText: 'First Name',
                  validate: (p0) {
                    final name = p0?.trim();
                    if (name == null || name.isEmpty) {
                      return 'Name can\'t be empty';
                    }
                    if (isNumeric(name)) {
                      return 'Name can\'t contain numbers';
                    }
                    return null;
                  },
                  prefixIconPath:
                      'person_FILL0_wght300_GRAD0_opsz24 (2) 1.svg'),
              dropdownTextFormField(
                svgPath: 'work_FILL0_wght300_GRAD0_opsz24 1.svg',
                hintText: 'Select role',
                controller: roletextController,
                onchanged: (value) {},
                validate: (p0) {
                  final name = p0?.trim();
                  if (name == null || name.isEmpty) {
                    return 'Role can\'t be empty';
                  }
                  return null;
                },
                ontap: () {
                  showCupertinoModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return employeeRoleDialog(
                        ontap: (value) {
                          roletextController.text = value;
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: prefixTextFormField(
                        onchanged: (value) {},
                        ontap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDatePicker(
                                    isEndDate: false, onchange: () {});
                              });
                        },
                        validate: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'Date can\'t be empty';
                          }
                          return null;
                        },
                        controller: startingDatetextController,
                        hintText: 'Joining Date',
                        prefixIconPath:
                            'event_FILL0_wght300_GRAD0_opsz24 (1) 1 (1).svg'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: getSvgIcon(
                        svgPath:
                            'arrow_right_alt_FILL0_wght500_GRAD0_opsz24 14.svg'),
                  ),
                  Expanded(
                    child: prefixTextFormField(
                        controller: endingDatetextController,
                        onchanged: (value) {},
                        ontap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDatePicker(
                                    isEndDate: true, onchange: () {});
                              });
                        },
                        validate: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'Date can\'t be empty';
                          }
                          return null;
                        },
                        hintText: 'No Date',
                        prefixIconPath:
                            'event_FILL0_wght300_GRAD0_opsz24 (1) 1 (1).svg'),
                  )
                ],
              ),
              const Spacer(),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomElevatedButtons.elevatedUnselectedButton(
                      onpressed: () {
                        Navigator.pop(context);
                      },
                      title: 'Cancel'),
                  SizedBox(width: 2.w),
                  CustomElevatedButtons.elevationSelectedButton(
                      onpressed: () {
                        formKey.currentState!.validate();
                      },
                      title: 'Save')
                ],
              ),
              SizedBox(height: 3.w)
            ]),
          ),
        ),
      ),
    );
  }

  Widget employeeRoleDialog({required Function(String) ontap}) {
    return Material(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: OrganizationData.organisationsRoles.length,
        itemBuilder: (context, index) {
          final role = OrganizationData.organisationsRoles[index];
          return Column(
            children: [
              GestureDetector(
                onTap: () => ontap(role),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.w),
                  child: Text(
                    role,
                    style: AppTextStyles.titleStyle.copyWith(
                        color: Colors.black,
                        fontSize: 6.5.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const Divider()
            ],
          );
        },
      ),
    );
  }
}
