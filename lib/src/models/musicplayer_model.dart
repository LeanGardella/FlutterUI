import 'package:flutter/material.dart';

class MusicplayerModel with ChangeNotifier{
  bool _isPlaying = false;
  AnimationController _animationController;

  Duration _songDuration = Duration(milliseconds: 0);
  Duration _elapsedTime = Duration(milliseconds: 0);
  

  String get totalSongDuration => this.printDuration(_songDuration);
  String get elapsedTimeDuration => this.printDuration(_elapsedTime);


  Duration get songDuration => this._songDuration;
  Duration get elapsedTime => this._elapsedTime;

  get procentajeAvance => (_songDuration.inSeconds > 0 ) ? 
                            _elapsedTime.inSeconds / _songDuration.inSeconds
                            : 0;
  
  set songDuration (Duration d) {
    this._songDuration = d;
    notifyListeners();
  }
  set elapsedTime (Duration d) {
    this._elapsedTime = d;
    notifyListeners();
  }
 
  bool get isPlaying => this._isPlaying;
  AnimationController get animationController => this._animationController;

  set isPlaying( bool v ) {
    this._isPlaying = v;
    notifyListeners();
  }

  set animationController(AnimationController a){
    this._animationController = a;
    //notifyListeners();
  }

  String printDuration(Duration d){
    String twoDigits(int n){
      
      if(n>=10) return "$n";
      return "0$n";

    }
      String twoDigitsMinutes = twoDigits(d.inMinutes.remainder(60));
      String twoDigitsSeconds = twoDigits(d.inSeconds.remainder(60));
    return "$twoDigitsMinutes:$twoDigitsSeconds";

  }

}