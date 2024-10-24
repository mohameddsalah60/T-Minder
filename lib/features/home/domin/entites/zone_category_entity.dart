class ZoneCategoryEntity {
  final String name, zone;

  ZoneCategoryEntity({required this.name, required this.zone});
}

List<ZoneCategoryEntity> get zoneCategoryItems => [
      ZoneCategoryEntity(name: 'الكل', zone: "all"),
      ZoneCategoryEntity(name: 'زون 1', zone: "1"),
      ZoneCategoryEntity(name: 'زون 2', zone: "2"),
      ZoneCategoryEntity(name: 'زون 3', zone: "3"),
      ZoneCategoryEntity(name: 'زون 4', zone: "4"),
    ];
