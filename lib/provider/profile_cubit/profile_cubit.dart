import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/model/profileModel.dart';
import '../../repositories/auth_repositories/profileRepository.dart';
// import '../../data/model/deleteProfileModel.dart';
part 'profile_state.dart';
class ProfileCubit extends Cubit<ProfileState> {
  GetProfileRepository getProfileRepository;
  // DeleteAccountRepositories deleteAccountRepositories;
  ProfileCubit(
      {
        required this.getProfileRepository,
        // required this.deleteAccountRepositories,
      })
      : super(ProfileInitial());
  ProfileModel ? profileListProfileData;
  getProfileData() async {
    emit(ProfileLoading());
    try {
      profileListProfileData = await getProfileRepository.getProfileData();
      emit(ProfileLoaded(profileListData: profileListProfileData!));
    } catch (e) {
      emit(ProfileError(error: e.toString()));
    }
  }



  /*
  ----------------------------------
  ----------update All Fields-------
  ----------------------------------
   */
updateAllFieldsAccInfo({
  required dynamic name,
  required dynamic password,


})async{
  try {
    await getProfileRepository.updateAllFields(
        name: name,
      password:password,
    );
    emit(UpdateAllProfileLoaded());

  } catch (e) {
    emit(UpdateProfileError(error: e.toString()));
  }
}

}
