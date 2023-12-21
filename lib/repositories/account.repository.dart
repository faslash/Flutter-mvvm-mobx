import 'package:mvvm/model/user.model.dart';
import 'package:mvvm/view-models/signup.viewmodel.dart';

class AccountRepository {
  Future<UserModel> createAccount(SignupViewModel model) async {
    await Future.delayed(new Duration(milliseconds: 1500));
    return new UserModel(
        id: "1",
        name: "Fabricio Antonio",
        email: "fabricio@gmail.com",
        picture: "https://picsum.photos/200/200",
        role: "enginner",
        token: "xpto");
  }
}
