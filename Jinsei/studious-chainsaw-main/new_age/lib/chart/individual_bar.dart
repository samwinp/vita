import 'mapbar_gaph.dart';

class IndividualBar {
  final int x;
  final double y;
  IndividualBar(this.x, this.y);
}

final double calc = 1.6 * 0.16 * (1 - 0.15);

class BarData {
  final double janEnergyGenerated;
  final double febEnergyGenerated;
  final double marEnergyGenerated;
  final double aprEnergyGenerated;
  final double mayEnergyGenerated;
  final double juneEnergyGenerated;
  final double julyEnergyGenerated;
  final double augEnergyGenerated;
  final double sepEnergyGenerated;
  final double octEnergyGenerated;
  final double novEnergyGenerated;
  final double decEnergyGenerated;
  BarData(
    this.janEnergyGenerated,
    this.febEnergyGenerated,
    this.marEnergyGenerated,
    this.aprEnergyGenerated,
    this.mayEnergyGenerated,
    this.juneEnergyGenerated,
    this.julyEnergyGenerated,
    this.augEnergyGenerated,
    this.sepEnergyGenerated,
    this.octEnergyGenerated,
    this.novEnergyGenerated,
    this.decEnergyGenerated,
  );

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndividualBar(1, janEnergyGenerated * calc),
      IndividualBar(2, febEnergyGenerated * calc),
      IndividualBar(3, marEnergyGenerated * calc),
      IndividualBar(4, aprEnergyGenerated * calc),
      IndividualBar(5, mayEnergyGenerated * calc),
      IndividualBar(6, juneEnergyGenerated * calc),
      IndividualBar(7, julyEnergyGenerated * calc),
      IndividualBar(8, augEnergyGenerated * calc),
      IndividualBar(9, sepEnergyGenerated * calc),
      IndividualBar(10, octEnergyGenerated * calc),
      IndividualBar(11, novEnergyGenerated * calc),
      IndividualBar(12, decEnergyGenerated * calc),
    ];
  }
}
