abstract class Figure {
  late String symbol;
  String color;
  int row;
  int col;
  Figure(this.color, this.row, this.col);

  bool checkMove(int fromRow, int fromCol, int toRow, int toCol);
}