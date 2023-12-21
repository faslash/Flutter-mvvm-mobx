import 'package:mvvm/model/user.model.dart';
import 'package:mvvm/repositories/account.repository.dart';
import 'package:mvvm/view-models/signup.viewmodel.dart';

class SignupController {
  late AccountRepository repository;

  SignupController() {
    repository = new AccountRepository();
  }

  Future<UserModel> create(SignupViewModel model) async {
    model.busy = true;
    var user = await repository.createAccount(model);
    model.busy = false;
    return user;
  }
}
