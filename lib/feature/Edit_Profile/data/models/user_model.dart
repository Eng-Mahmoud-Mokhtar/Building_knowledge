class ProfileState {
  final String email;
  final String name;
  final String phoneNumber;
  final String image;
  final String? errorMessage;
  final bool isLoading;
  final bool updateSuccess;
  final String? invalidField;
  final String? emailError;
  final bool nameUpdated;
  final bool emailUpdated;
  final bool phoneUpdated;

  ProfileState({
    this.email = '',
    this.name = '',
    this.phoneNumber = '',
    this.image = '',
    this.errorMessage,
    this.isLoading = false,
    this.updateSuccess = false,
    this.invalidField,
    this.emailError,
    this.nameUpdated = false,
    this.emailUpdated = false,
    this.phoneUpdated = false,
  });

  ProfileState copyWith({
    String? email,
    String? name,
    String? phoneNumber,
    String? image,
    String? errorMessage,
    bool? isLoading,
    bool? updateSuccess,
    String? invalidField,
    String? emailError,
    bool? nameUpdated,
    bool? emailUpdated,
    bool? phoneUpdated,
  }) {
    return ProfileState(
      email: email ?? this.email,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      image: image ?? this.image,
      errorMessage: errorMessage,
      isLoading: isLoading ?? this.isLoading,
      updateSuccess: updateSuccess ?? this.updateSuccess,
      invalidField: invalidField,
      emailError: emailError,
      nameUpdated: nameUpdated ?? this.nameUpdated,
      emailUpdated: emailUpdated ?? this.emailUpdated,
      phoneUpdated: phoneUpdated ?? this.phoneUpdated,
    );
  }
}
