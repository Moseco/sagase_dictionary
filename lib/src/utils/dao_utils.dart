// Groups consecutive rows sharing the same id, as given by idOf, and calls
// assign once per group with a non-empty list. Rows with the same id must be
// consecutive for the grouping to be complete.
void groupRowsById<T>(
  List<T> rows,
  int Function(T row) idOf,
  void Function(int id, List<T> rows) assign,
) {
  if (rows.isEmpty) return;

  int currentId = idOf(rows.first);
  List<T> currentRows = [];
  for (final row in rows) {
    if (idOf(row) != currentId) {
      assign(currentId, currentRows);
      currentId = idOf(row);
      currentRows = [];
    }
    currentRows.add(row);
  }
  assign(currentId, currentRows);
}
