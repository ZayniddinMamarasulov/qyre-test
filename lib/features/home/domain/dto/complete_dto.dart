class CompleteDto {
  final String? title;
  final double? progress;

  const CompleteDto(this.title, this.progress);

  static const completeList = [
    CompleteDto(
        "Complete your profile tooptimize your exposure in job searches", 70.0),
    CompleteDto(
        "Lorem Ipsum is simply dummy text of the printing and typesetting",
        30.5),
    CompleteDto(
        "Lorem Ipsum is simply dummy text of the printing and typesetting",
        50.5),
  ];
}
