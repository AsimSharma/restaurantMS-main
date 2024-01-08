class TabBar {
  final int id;
  final String? name;

  TabBar({
    required this.id,
    this.name,
  });
}

List<TabBar> tabData = [
  TabBar(
    id: 1,
    name: 'All',
  ),
  TabBar(
    id: 2,
    name: 'Ground Floor',
  ),
  TabBar(
    id: 3,
    name: 'Cottage',
  ),
  TabBar(
    id: 4,
    name: 'Hall Room',
  ),
];
