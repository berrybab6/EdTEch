import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell/widget.dart';
import 'package:google_fonts/google_fonts.dart';


class FoldingCellListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF2e282a),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return SimpleFoldingCell.create(
            frontWidget: _buildFrontWidget(index),
            innerWidget: _buildInnerWidget(index),
            cellSize: Size(MediaQuery.of(context).size.width, 125),
            padding: EdgeInsets.all(15),
            animationDuration: Duration(milliseconds: 300),
            borderRadius: 10,
            onOpen: () => print('$index cell opened'),
            onClose: () => print('$index cell closed'),
          );
        },
      ),
    );
  }

  Widget _buildFrontWidget(int index) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          color: Color(0xFFffcd3c),
          alignment: Alignment.center,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  "CARD - $index",
                  style: GoogleFonts.aldrich(
                    color: Color(0xFF2e282a),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: TextButton(
                  onPressed: () {
                    final foldingCellState = context
                        .findAncestorStateOfType<SimpleFoldingCellState>();
                    foldingCellState?.toggleFold();
                  },
                  child: Text(
                    "OPEN",
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(80, 40),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildInnerWidget(int index) {
    return Builder(
      builder: (context) {
        return Container(
          color: Color(0xFFecf2f9),
          padding: EdgeInsets.only(top: 10),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "CARD TITLE - $index",
                  style: GoogleFonts.aldrich(
                    color: Color(0xFF2e282a),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "CARD DETAIL - $index",
                  style: GoogleFonts.aldrich(
                    color: Color(0xFF2e282a),
                    fontSize: 32.0,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: TextButton(
                  onPressed: () {
                    final foldingCellState = context
                        .findAncestorStateOfType<SimpleFoldingCellState>();
                    foldingCellState?.toggleFold();
                  },
                  child: Text(
                    "Close",
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(80, 40),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}





class FoldingCellSimpleDemo extends StatelessWidget {
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index){
              return SimpleFoldingCell.create(
//                key: _foldingCellKey,
                frontWidget: _buildFrontWidget(index),
                innerWidget: _buildInnerWidget(index),
                cellSize: Size(MediaQuery.of(context).size.width, 116),
                padding: EdgeInsets.all(10),
                animationDuration: Duration(milliseconds: 300),
                borderRadius: 10,
                onOpen: () => print('cell opened'),
                onClose: () => print('cell closed'),
              );
            },

          ),
        ),
      ),
    );
  }

  Widget _buildFrontWidget(int index) {
    return Builder(

      builder: (BuildContext context) {
        return GestureDetector(
          onTap: (){
            final foldingCellState = context
                .findAncestorStateOfType<SimpleFoldingCellState>();
            foldingCellState?.toggleFold();
          },
//      _foldingCellKey?.currentState?.toggleFold(),
          child: Container(
            color: Colors.black,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(

                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Jane Doe",
                    style: GoogleFonts.aldrich(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(

                  child: Text(
                    'Female',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                )

              ],
            ),
          ),
        );
      }
    );
  }

  Widget _buildInnerWidget(int index) {
    return Builder(

      builder: (BuildContext context) {
        return Container(
          color: Colors.black,
          padding: EdgeInsets.only(top: 11),
          child: Expanded(
            child: Column(

              children: [
                 GestureDetector(
                    child: CircleAvatar(
                          radius: 41,
                        backgroundImage: AssetImage('assets/images/mish.jpg'),
                           ),
                    ),
                SizedBox(height: 11.0,),
                Align(
//            alignment: Alignment.topCenter,
                  child: Text(
                    "Jane Doe",
                    style: GoogleFonts.aldrich(
                      color: Colors.white,
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                    height: 11.0,
                    ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Software Engineering ",
                    style: GoogleFonts.aldrich(
                      color: Colors.white,
                      fontSize: 26.0,
                    ),
                  ),
                ),
                  SizedBox(height: 11.0,),
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                'Batch : 2011',
                    style: TextStyle(
                        fontSize: 23.0,
                        color: Colors.white,
                    ),

                        ),
                    Text(
                      'Female',
                      style: TextStyle(
                        fontSize: 23.0,
                        color: Colors.white,
                      ),

                    ),

                ],
                ),

               // GestureDetector(
                //  child: TextButton(

                  //),

                Positioned(
                  right: 11,
                  bottom: 11,
                  child: TextButton(
                    onPressed: () {
                     final foldingCellState = context
                        .findAncestorStateOfType<SimpleFoldingCellState>();
                                foldingCellState?.toggleFold();
                        },
                    //=> _foldingCellKey?.currentState?.toggleFold(),
//              child: Text(
//                "^",
//                style: TextStyle(
//                  color: Colors.white,
//                  fontSize: 27,
//                ),
//              ),
                    child: Icon(
                      Icons.arrow_drop_up,
                      color: Colors.red,
                      size: 41,
                    ),
                    style: TextButton.styleFrom(
//              backgroundColor: Colors.deepOrangeAccent,
                      minimumSize: Size(31, 30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}