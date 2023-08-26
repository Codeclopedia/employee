import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'employee_detail_bloc_event.dart';
part 'employee_detail_bloc_state.dart';

class EmployeeDetailBlocBloc
    extends Bloc<EmployeeDetailBlocEvent, EmployeeDetailBlocState> {
  EmployeeDetailBlocBloc() : super(EmployeeDetailBlocInitial()) {
    on<EmployeeDetailBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
