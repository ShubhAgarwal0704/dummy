class PopularFilterListData {
  PopularFilterListData({
    this.titleTxt = '',
    this.isSelected = false,
  });

  String titleTxt;
  bool isSelected;

  static List<PopularFilterListData> popularFList = <PopularFilterListData>[
    PopularFilterListData(
      titleTxt: 'AC',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Cooler',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Power Backup',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'Mattress',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Wifi',
      isSelected: false,
    ),
  ];

  static List<PopularFilterListData> accomodationList = [
    PopularFilterListData(
      titleTxt: 'All',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: '4 Seater',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: '3 Seater',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: '2 Seater',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Single Seater',
      isSelected: false,
    ),
  ];
}
