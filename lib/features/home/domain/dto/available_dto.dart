class AvailableDto {
  String date;
  AvailabilityStatus status;

  AvailableDto(this.date, this.status);

  static List<AvailableDto> days = [
    AvailableDto("Mon Oct 18", AvailabilityStatus.BUSY),
    AvailableDto("Tue Oct 19", AvailabilityStatus.FREE),
    AvailableDto("Wed Oct 20", AvailabilityStatus.NOT_SET),
    AvailableDto("Thu Oct 21", AvailabilityStatus.BUSY),
    AvailableDto("Fri Oct 22", AvailabilityStatus.NOT_SET),
    AvailableDto("Sat Oct 23", AvailabilityStatus.NOT_SET),
  ];
}

enum AvailabilityStatus {
  BUSY,
  FREE,
  NOT_SET,
}
