import '../../common_packages/common_packages.dart';
import 'dart:developer' as developer;
part 'userdata_event.dart';
part 'userdata_state.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final UserDataRepo userDataRepo;
  StreamSubscription? userStream;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  UserModel? currentUserData;
  UserDataBloc({required this.userDataRepo}) : super(UserDataInitial()) {
    on<UserInit>((event, emit) {
      userStream = userDataRepo.getUserData(event.uid).listen((doc) {
        Map<String, dynamic>? temp = doc.data();
        UserModel tempUser = UserModel.fromJson(doc.id, temp!);
        add(UserUpdate(user: tempUser));
      });
    });

    on<UserUpdate>(
      (event, emit) async {
        developer.log('${event.user.json}', name: 'PrintUserInfoFromJson');
        emit(UserUpdated(user: event.user));
      },
    );

    on<UserDataDispose>(
      (event, emit) {
        userStream!.cancel();
      },
    );
  }
}
