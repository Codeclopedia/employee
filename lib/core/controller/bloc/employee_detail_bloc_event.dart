part of 'employee_detail_bloc_bloc.dart';

@immutable
sealed class EmployeeDetailBlocEvent {}

class EmployeeDateSelectTapEvent extends EmployeeDetailBlocEvent {}

class EmployeeDateOptionTapEvent extends EmployeeDetailBlocEvent {}
