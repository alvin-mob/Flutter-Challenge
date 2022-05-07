import 'package:flutter/material.dart';
import 'package:flutterchallenge/constants/theme.dart';
import 'package:flutterchallenge/ui/sharedWidgets/shimmer_wrap.dart';

class DashboardLoader extends StatelessWidget {
  const DashboardLoader({Key? key}) : super(key: key);


  Widget _legendItem(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: ShimmerWrap(
            child: Container(
              height: 13,
              width: 13,
              decoration: BoxDecoration(
                  color:Colors.red,
                  shape: BoxShape.circle
              ),
            ),
          ),
        ),
        SizedBox(width: 5,),
        ShimmerWrap(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(width: 30,height: 10,color: Colors.blue,),
              const SizedBox(height: 3),
              Container(width: 30,height: 10,color: Colors.blue,),
            ],
          ),
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            ShimmerWrap(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                    child: Container(width: 200,height: 30,color: Colors.white,))
            ),
            const SizedBox(height: 30,),
            Stack(
              children: [
                ClipOval(
                  child: ShimmerWrap(
                    child: Container(
                      width: width*.6,
                      height: width*.6,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: ClipOval(
                        child: Container(
                          width: width*.5,
                          height: width*.5,
                          color: Colors.white,
                        ),
                      ),
                    ),),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _legendItem(),
                _legendItem(),
                _legendItem()
              ],
            ),
            SizedBox(height: 30,),
            ShimmerWrap(
                child: Container(width: 200,height: 30,color: Colors.red,)
            ),
            SizedBox(height: 30,),
            Container(
              width: width*.9,
              child: Row(
                children: [
                  ShimmerWrap(
                    child: Column(
                      children: [
                        Container(width: 50,height: 20,color: Colors.red,),
                        SizedBox(height: 20,),
                        Container(width: 50,height: 20,color: Colors.red,)
                      ],
                    ),
                  ),
                  Spacer(),
                  ShimmerWrap(
                    child: Column(
                      children: [
                        Container(width: 50,height: 20,color: Colors.red,),
                        SizedBox(height: 20,),
                        Container(width: 50,height: 20,color: Colors.red,)
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30,),
            ShimmerWrap(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: width*.9,
                  height: 30,
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
