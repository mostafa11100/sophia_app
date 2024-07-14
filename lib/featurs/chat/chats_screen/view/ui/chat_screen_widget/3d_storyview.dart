// import 'package:flutter/material.dart';

// class D3 extends StatefulWidget {
//   D3({super.key, required this.listofimages, required this.controler});

//   List<Widget> listofimages = [];
//   TabController controler;

//   @override
//   State<D3> createState() => _D3State();
// }

// class _D3State extends State<D3> {
//   double _rx = 0.0;
//   double _ry = 0.0;
//   double _rz = 0.0;

//   @override
//   void initState() {
//     widget.controler!.addListener(() {
//       setState(() {
//         //_ry = (_con!.offset / (MediaQuery.of(context).size.width));
//       });
//     });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 7, 28, 44),
//       body: SizedBox(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: TabBarView(
//             // scrollDirection: Axis.horizontal,
//             controller: widget.controler!,
//             //   itemCount: widget.listofimages.length,
//             children: List.generate(widget.listofimages.length, (i) {
//               print(
//                   "i==$i and   ${rotateycalc(i: i, con: widget.controler!, w: MediaQuery.of(context).size.width).$1}  ");
//               return Transform(
//                   alignment: rotateycalc(
//                           i: i,
//                           con: widget.controler!,
//                           w: MediaQuery.of(context).size.width)
//                       .$2,
//                   transform: Matrix4.identity()
//                     ..setEntry(3, 2, .002)
//                     ..rotateX(0)
//                     ..rotateY(rotateycalc(
//                             i: i,
//                             con: widget.controler,
//                             w: MediaQuery.of(context).size.width)
//                         .$1)
//                     ..rotateZ(0),
//                   child: SizedBox(
//                       height: MediaQuery.of(context).size.height,
//                       width: MediaQuery.of(context).size.width,
//                       child: widget.listofimages[i]));
//             }),
//           )),
//     );
//   }

//   (double, Alignment) rotateycalc({required TabController con, w, i}) {
//     //return ;
//     Alignment? align;

//     double y = con.offset / w;
//     print("offset   !!!!!!!!!!!!===${con.offset}");
//     double? rotatey;
//     if (y.floor() - 1 < 0) {
//       if (i == 0) {
//         rotatey = y;
//         align = FractionalOffset.centerRight;
//       } else {
//         align = FractionalOffset.centerLeft;
//         rotatey = -(1 - y);
//       }
//     } else {
//       print("elseeeeeeeeee");
//       if (i == y.floor()) {
//         align = FractionalOffset.centerRight;
//         rotatey = ((y - (y.toInt())));
//       } else {
//         align = FractionalOffset.centerLeft;
//         rotatey = -(1 - (y - (y.toInt())));
//       }
//     }
//     return (rotatey, align);
//   }
// }

import 'package:flutter/material.dart';

class D3 extends StatefulWidget {
  D3({super.key, required this.listofimages, required this.controler});

  List<Widget> listofimages = [];
  PageController controler;

  @override
  State<D3> createState() => _D3State();
}

class _D3State extends State<D3> {
  // PageController? _con;

  @override
  void initState() {
    //_con = PageController();
    widget.controler.addListener(() {
      setState(() {
        //_ry = (_con!.offset / (MediaQuery.of(context).size.width));
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 28, 44),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: widget.controler,
            //  itemCount: listofimages.length,
            itemCount: widget.listofimages.length,
            itemBuilder: (BuildContext context, int i) {
              return Transform(
                  alignment: rotateycalc(
                          i: i,
                          con: widget.controler,
                          w: MediaQuery.of(context).size.width)
                      .$2,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, .002)
                    ..rotateX(0)
                    ..rotateY(rotateycalc(
                            i: i,
                            con: widget.controler,
                            w: MediaQuery.of(context).size.width)
                        .$1)
                    ..rotateZ(0),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: widget.listofimages[i]));
            },
            // children: List.generate(widget.listofimages.length, (i) {
            //   print(
            //       "i==$i and   ${rotateycalc(i: i, con: widget.controler!, w: MediaQuery.of(context).size.width).$1}  ");
            //   return Transform(
            //       alignment: rotateycalc(
            //               i: i,
            //               con: widget.controler!,
            //               w: MediaQuery.of(context).size.width)
            //           .$2,
            //       transform: Matrix4.identity()
            //         ..setEntry(3, 2, .002)
            //         ..rotateX(0)
            //         ..rotateY(rotateycalc(
            //                 i: i,
            //                 con: widget.controler,
            //                 w: MediaQuery.of(context).size.width)
            //             .$1)
            //         ..rotateZ(0),
            //       child: SizedBox(
            //           height: MediaQuery.of(context).size.height,
            //           width: MediaQuery.of(context).size.width,
            //           child: widget.listofimages[i]));
            // }),
          )),
    );
  }

  (double, Alignment) rotateycalc({required PageController con, w, i}) {
    //return ;
    Alignment? align;

    double y = con.offset / w;

    double? rotatey;
    if (y.floor() - 1 < 0) {
      if (i == 0) {
        rotatey = y;
        align = FractionalOffset.centerRight;
      } else {
        align = FractionalOffset.centerLeft;
        rotatey = -(1 - y);
      }
    } else {
      if (i == y.floor()) {
        align = FractionalOffset.centerRight;
        rotatey = ((y - (y.toInt())));
      } else {
        align = FractionalOffset.centerLeft;
        rotatey = -(1 - (y - (y.toInt())));
      }
    }
    return (rotatey, align);
  }
}
