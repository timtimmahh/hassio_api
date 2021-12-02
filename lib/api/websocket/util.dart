Map<String, String?> parseQuery(String queryString) {
  const query = <String, String?>{};
  final items = queryString.split('&');
  for (var i = 0; i < items.length; i++) {
    final item = items[i].split('=');
    final key = Uri.decodeComponent(item[0]);
    final value = item.length > 1 ? Uri.decodeComponent(item[1]) : null;
    query[key] = value;
  }
  return query;
}

/*T debounce<T extends dynamic Function(List<dynamic> args)>() {
  num? timeout;

  return (args) {
    const later = () => {
      timeout = null;
      if (!immediate)
        func.appy(context, args);
    };
    const callNow = immediate && timeout == null;

  };
}*/
