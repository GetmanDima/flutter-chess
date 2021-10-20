import 'package:flutter/material.dart';
import 'package:flutter_chess/desk.dart';
import 'package:flutter_svg/svg.dart';

import 'figure.dart';

String _title = 'Flutter Chess';

void main() => runApp(const ChessApp());

/// This is the main application widget.
class ChessApp extends StatelessWidget {
  const ChessApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: Text(_title)),
        body: const BoardWidget(),
      ),
    );
  }
}

class BoardWidget extends StatefulWidget {
  const BoardWidget({Key? key}) : super(key: key);

  @override
  State<BoardWidget> createState() => _BoardWidgetState();
}

class _BoardWidgetState extends State<BoardWidget> {
  List <TableRow> board = [];

  void setBoard() {
    board = [];

    for (int x = 0; x < 8; x++) {
      List<Widget>? row = [];

      for (int y = 0; y < 8; y++) {
        var figure = Desk.position[x][y];

        row.add(squareWidget(context, x, y, figure));
      }

      board.add(TableRow(children: row));
    }
  }

  @override
  void initState() {
    Desk.initialize();
    setBoard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: Padding(child: Table(children: board), padding: const EdgeInsets.fromLTRB(17, 16, 14, 15)),
          width: 360,
          height: 360,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/desk3.png'),
              fit: BoxFit.cover,
            ),
          )
      )
    );
  }

  Widget squareWidget(BuildContext context, int row, int col, Figure? figure) {
    return DragTarget<Figure>(
      builder: (
          BuildContext context,
          List<dynamic> accepted,
          List<dynamic> rejected,
          ) {

        if (figure == null) {
          return const SizedBox(
            width: 40,
            height: 41
          );
        }

        return figureWidget(context, figure);
      },
      onAccept: (Figure acceptedFigure) {
        Desk.move(acceptedFigure.row, acceptedFigure.col, row, col);

        setState(() {
          setBoard();
        });
      },
    );
  }

  Widget figureWidget(BuildContext context, Figure figure) {
    var figureImages = {
      'p': 'pawn.svg',
      'r': 'rook.svg',
      'n': 'knight.svg',
      'b': 'bishop.svg',
      'k': 'king.svg',
      'q': 'queen.svg',
    };

    var image = 'assets/' + (figureImages[figure.symbol] ?? '');
    var color = figure.color == 'w' ? Colors.white : Colors.black;

    return Draggable<Figure>(
      data: figure,
      child: SizedBox(
        width: 40,
        height: 41,
        child: SvgPicture.asset(image, color: color),
      ),
      feedback: SizedBox(
        child: SvgPicture.asset(image, color: color),
      ),
      childWhenDragging: Container(),
    );
  }
}
