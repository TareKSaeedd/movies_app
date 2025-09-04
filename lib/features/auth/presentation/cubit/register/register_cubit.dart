import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/auth/data/register/model/register_model_request.dart';
import 'package:movies_app/features/auth/data/register/repository/register_repository.dart';
import 'package:movies_app/features/auth/presentation/cubit/register/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterRepository registerRepository;
  RegisterCubit({required this.registerRepository}) : super(RegisterLoadingState());


  void register(UserRequest useriInfo) async {
    emit(RegisterLoadingState());

    var response = await registerRepository.register(useriInfo);

    if (response.statusCode == 200 || response.statusCode == 201) {
      emit(RegisterSuccessState(successMessage: response.message));
    } else {
      String errorMsg = response.message is List
          ? (response.message as List).join(", ")
          : response.message.toString();
      emit(RegisterErrorState(errorMessage: errorMsg));
    }
  }
}
