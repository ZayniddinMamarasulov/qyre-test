class ProductionDto {
  final String title;
  final String imgUrl;
  final String period;

  const ProductionDto(this.title, this.imgUrl, this.period);

  static const List<ProductionDto> productionsList = [
    ProductionDto(
      "Production Name That is Long",
      'assets/images/img_1.png',
      "Sweden Jan 14, 2022-Feb 23, 2023",
    ),
    ProductionDto(
      "What has been seen very very long terms",
      'assets/images/img_2.png',
      "Sweden Jan 14, 2022-Feb 23, 2023",
    ),
  ];
}
