import '../widgets/constants.dart';

class Message {
  final String message;
  final String id;

  Message({required this.message, required this.id});
  factory Message.fromJosn(josnData) {
    return Message(message: josnData[kMessage], id: josnData[kID]);
  }
}
