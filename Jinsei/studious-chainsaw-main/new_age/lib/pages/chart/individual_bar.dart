class IndividualBar{
  final int x;
  final double y;
  IndividualBar(this.x, this.y);
}

class BarData{
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

List<IndividualBar>barData = [];

void initializeBarData(){
  barData = [
    IndividualBar(1, janEnergyGenerated),
    IndividualBar(2, febEnergyGenerated),
    IndividualBar(3, marEnergyGenerated),
    IndividualBar(4, aprEnergyGenerated),
    IndividualBar(5, mayEnergyGenerated),
    IndividualBar(6, juneEnergyGenerated),
    IndividualBar(7, julyEnergyGenerated),
    IndividualBar(8, augEnergyGenerated),
    IndividualBar(9, sepEnergyGenerated),
    IndividualBar(10, octEnergyGenerated),
    IndividualBar(11, novEnergyGenerated),
    IndividualBar(12,decEnergyGenerated),
  ];
}

}