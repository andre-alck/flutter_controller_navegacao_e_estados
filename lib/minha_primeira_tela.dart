import 'package:flutter/material.dart';

class MinhaPrimeiraTela extends StatelessWidget {
  const MinhaPrimeiraTela({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                color: Colors.yellow,
                width: 100.0,
                height: 100.0,
              ),
              Container(
                color: Colors.indigo,
                width: 50.0,
                height: 50.0,
              ),
            ],
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                color: Colors.yellow,
                width: 100.0,
                height: 100.0,
              ),
              Container(
                color: Colors.indigo,
                width: 50.0,
                height: 50.0,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.cyan,
                height: 100.0,
                width: 100.0,
              ),
              Container(
                color: Colors.teal,
                height: 100.0,
                width: 100.0,
              ),
              Container(
                color: Colors.greenAccent,
                height: 100.0,
                width: 100.0,
              ),
            ],
          ),
          Container(
            color: Colors.amber,
            height: 50,
            width: 300,
            child: const Text(
              'Diamante Amarelo',
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              'Aperte o botão!',
            ),
          ),
        ],
      ),
    );
  }
}
