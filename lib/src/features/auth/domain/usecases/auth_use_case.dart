import '../../data/repo/auth_repo.dart';

class AuthUseCases {
  final AuthRepository repository;

  AuthUseCases(this.repository);

  Future<String?> signUp(String email, String password) {
    return repository.signUp(email, password);
  }

  Future<String?> logIn(String email, String password) {
    return repository.logIn(email, password);
  }

  Future<String?> logOut() {
    return repository.logOut();
  }
}
