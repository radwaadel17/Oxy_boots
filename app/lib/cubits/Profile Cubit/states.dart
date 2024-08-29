
import 'dart:io';

abstract class ProfileImageState {}

class ProfileImageInitial extends ProfileImageState {}

class ProfileImageUpdated extends ProfileImageState {
  final File imageFile;

  ProfileImageUpdated(this.imageFile);
}
