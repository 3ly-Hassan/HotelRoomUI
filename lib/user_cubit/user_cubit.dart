import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_geeks/data/models/hotel_model.dart';
import 'package:office_geeks/data/repository.dart';
import 'package:office_geeks/user_cubit/user_states.dart';

class UserCubit extends Cubit<UserState> {
  final Repository repository;

  UserCubit({required this.repository}) : super(InitialState());
  static UserCubit get(context) => BlocProvider.of(context);
  Hotel hotel = Hotel();
  int? maxLines = 2;
  void seeDetails() {
    maxLines = maxLines == null ? 2 : null;
    emit(SeeDetails());
  }

  void getHotel() {
    repository.getHotel().then((value) {
      if (value.id == null) {
        emit(GetUsersError());
      } else {
        hotel = value;
        emit(UserLoadedSuccessfully());
      }
    });
  }
}
