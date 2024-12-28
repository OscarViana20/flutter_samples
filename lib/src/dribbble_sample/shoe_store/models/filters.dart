class Filter {
  Filter({
    required this.index,
    required this.text,
  });

  final int index;
  final String text;
}

List<Filter> get filters {
  return [
    Filter(index: 0, text: 'All'),
    Filter(index: 1, text: 'Running'),
    Filter(index: 2, text: 'Sneakers'),
    Filter(index: 3, text: 'Casual'),
    Filter(index: 4, text: 'Formal'),
  ];
}
