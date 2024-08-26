abstract class MainState {} 
class InitailState extends MainState {} 
class SumState extends MainState {
  final double result ; 
  SumState(this.result);
}