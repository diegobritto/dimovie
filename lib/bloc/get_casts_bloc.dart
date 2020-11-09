import 'package:flutter/material.dart';
import 'package:dimovie/model/cast_response.dart';
import 'package:dimovie/model/video_response.dart';
import 'package:dimovie/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class CastsBloc {
  final Repository _repository = Repository();
  final BehaviorSubject<CastResponse> _subject =
      BehaviorSubject<CastResponse>();

  getCasts(int id) async {
    CastResponse response = await _repository.getCasts(id);
    _subject.sink.add(response);
  }

  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<CastResponse> get subject => _subject;
  
}
final castsBloc = CastsBloc();