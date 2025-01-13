import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderRequestCard extends StatelessWidget {
  const OrderRequestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  child: SvgPicture.asset('assets/icons/mobile.svg'),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:32),
                    child: Text(
                      'Pepperoni pizza',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Text(
                    'Delicious Pepperoni pizza',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            //Spacer(flex: 0,),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:  30,horizontal: 45 ),
                    child: Text('3 Items',
                    style: TextStyle(
                      color: Color(0xff20bc3b),
                      fontSize: 20,
                    ),),
                    
                  ),
                  Text("10.00"),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
