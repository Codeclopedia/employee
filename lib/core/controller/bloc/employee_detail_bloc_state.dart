part of 'employee_detail_bloc_bloc.dart';

@immutable
sealed class EmployeeDetailBlocState {}

abstract class EmployeeDetailActionState extends EmployeeDetailBlocState {}

final class EmployeeDetailBlocInitial extends EmployeeDetailBlocState {}

final class EmployeeDetailBlocLoading extends EmployeeDetailBlocState {}

final class EmployeeDetailBlocSuccess extends EmployeeDetailBlocState {}
