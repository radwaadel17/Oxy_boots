import 'dart:io';

import 'package:app/cubits/Profile%20Cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileImageCubit extends Cubit<ProfileImageState>{
 ProfileImageCubit():super(ProfileImageInitial());
  void updateProfileImage(File imageFile) {
    emit(ProfileImageUpdated(imageFile));
  }
}