import 'package:dashfleet_ui/data/entities.dart';

class UserRepository {
  late User currentUser;
  void setUser(User user) {
    currentUser = user;
  }
}
