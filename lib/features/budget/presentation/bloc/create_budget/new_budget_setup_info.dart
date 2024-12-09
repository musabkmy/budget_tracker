class NewBudgetSetupInfo {
  final String title;
  final String description;
  final String? additionDescription;
  final String? nextUp;

  NewBudgetSetupInfo(
      {this.title = '',
      required this.description,
      this.additionDescription,
      this.nextUp});

  factory NewBudgetSetupInfo.empty() {
    return NewBudgetSetupInfo(description: '');
  }
}
