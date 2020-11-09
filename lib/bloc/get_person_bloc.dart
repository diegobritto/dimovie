import 'package:dimovie/model/person_response.dart';
import 'package:dimovie/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class PersonBloc {
  final Repository _repository = Repository();
  final BehaviorSubject<PersonResponse> _subject =
  BehaviorSubject<PersonResponse>();

  getPerson() async {
    PersonResponse response = await _repository.getPerson();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<PersonResponse> get subject => _subject;

}
final personBloc = PersonBloc();