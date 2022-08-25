import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:input_slider/input_slider.dart';
import 'package:phptravelapp/app/colors.dart';

class DataFilteration extends StatefulWidget {
  @override
  State<DataFilteration> createState() => _DataFilterationState();
}

class _DataFilterationState extends State<DataFilteration> {


  final selectedValue = null;

  List listitem = ['paksitan','india','china','landon','us','canada'];
  var valueChose='ENGLISH';

  final List locale=[
    {'name':'ENGLISH','locale':Locale('en','US')},
    {'name':'АНГЛИЙСКИЙ','locale':Locale('en','IS')},
    {'name':'姓名','locale':Locale('zh','CN')},
  ];
  updateLanguage(Locale locale){
    Get.back();
    Get.updateLocale(locale);
  }
  builddialog(BuildContext context){
    showDialog(context: context, builder: (builder){

      return
        AlertDialog(
        title: Text('Choose a language'),
        content: Container(
          width: double.maxFinite,
          child:ListView.separated(
            shrinkWrap: true,
              itemBuilder: (context,index){
                return InkWell(
                    onTap: (){
                      updateLanguage(locale[index]['locale']);
                    },
                    child: Text(locale[index]['name'],));
              },
              separatorBuilder: (context,index){
                return Divider(
                  color: Colors.blue,
                );
              },
              itemCount: locale.length) ,
        ),
      );
     /*   Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
          child: Container(
            width: double.infinity,
            height: Get.size.height*0.075,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(width: 1,color: Colors.grey)
              // color: TColor.mainColor,
            ),
            child: DropdownButtonFormField(

                // decoration: InputDecoration(
                //   border: InputBorder.none,
                //   prefixIcon: Icon(Icons.outlined_flag_outlined,color: Colors.grey,),
                // ),
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey,
                ),
                isExpanded: true,
                // style: TextStyle(color: TColor.mainblueColor),
                // underline: SizedBox(),
                // icon: Visibility (visible:false, child: Icon(Icons.arrow_downward)),
                value: valueChose,
                items: listitem.map<DropdownMenuItem<String>>((e) {
                  return DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  );
                }).toList(),
                onChanged: (String? value){
                  setState((){
                    valueChose=value!;
                  });
                }),
          ),
        );*/
    });
  }

  // const DataFilteration({Key? key}) : super(key: key);
  static double _lowerValue=1.0;
  static double _upperValue=1000.0;
  double brightness=0.0;
  RangeValues values=RangeValues(_lowerValue, _upperValue);


  bool isCheck=false;
  bool isradio=false;
  bool apartment=false;
  bool home=false;
  bool hotel=false;
  bool resort=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Text('Filters',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
        centerTitle: true,
      actions: [
        InkWell(
            onTap: (){
              builddialog(context);
            },
            child: Text('language'))
      ],
      automaticallyImplyLeading: false,
      leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.close,color: Colors.black,)),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // FlutterSlider(
            //   values: [30, 420],
            //   max: 1000,
            //   min: 0,
            //   tooltip: FlutterSliderTooltip(
            //     leftPrefix: Icon(Icons.attach_money, size: 19, color: Colors.black45,),
            //     rightSuffix: Icon(Icons.attach_money, size: 19, color: Colors.black45,),
            //   ),
            //   onDragging: (handlerIndex, lowerValue, upperValue) {
            //     _lowerValue = lowerValue;
            //     _upperValue = upperValue;
            //     setState(() {
            //
            //     });
            //   },
            // )

           // commonText('Price ( for 1 night)'),
            SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text('featuretourPriceText'.tr),
                  Text(' ('),
                  Text('for 1 night'.tr),
                  Text(')')
                ],
              ),
            ),
            SizedBox(height: 10,),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                rangeThumbShape: RoundRangeSliderThumbShape(

                  enabledThumbRadius: 10,
                  // disabledThumbRadius: 10,
                  elevation: 6
                )
              ),
              child: RangeSlider(
                labels: RangeLabels(values.start.toString(),values.end.toString()),
                activeColor: TColor.maingreenColor,
                inactiveColor: TColor.mainColor,
                values:values,
              min: _lowerValue,
                max: _upperValue,
                onChanged: (val){
                setState((){
                  print(val);
                  values=val;
                });
                },
              ),
            ),

            commonText('Popular filters'.tr),

          Container(
            // width: Get.size.width,
            // height: Get.size.height*0.3,
            child: Column(

              // direction: Axis.horizontal,
              // runSpacing: 2,
              // spacing: 2,
              // verticalDirection: VerticalDirection.up,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Checkbox(
                              value: isCheck,
                              onChanged: (v){
                                setState((){
                                  isCheck=v!;
                                });
                              },
                            ),
                            Text('Free Breakfast'.tr),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(

                          children: [
                            Checkbox(
                              activeColor: TColor.maingreenColor,
                              value: isCheck,
                              onChanged: (v){
                                setState((){
                                  isCheck=v!;
                                });
                              },
                            ),
                            Text('Free Parking'.tr),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Checkbox(
                              value: isCheck,
                              onChanged: (v){
                                setState((){
                                  isCheck=v!;
                                });
                              },
                            ),
                            Text('Pool'.tr),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Checkbox(
                              value: isCheck,
                              onChanged: (v){
                                setState((){
                                  isCheck=v!;
                                });
                              },
                            ),
                            Text('pet Friendly'.tr),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Checkbox(
                              value: isCheck,
                              onChanged: (v){
                                setState((){
                                  isCheck=v!;
                                });
                              },
                            ),
                            Text('Free Wifi'.tr),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),


            commonText('Distance from city center'.tr),
            // InputSlider(
            //   onChange: (value) => print("change: $value"),
            //   min: 0.0,
            //   max: 100.0,
            //   decimalPlaces: 0,
            //   // value: 50.0,
            //   // leading: Text("Percentage:"),
            //   defaultValue: 50,
            // ),


            commonText('Type of Accommodation'.tr),
           SwitchListTile(
             activeColor: TColor.maingreenColor,
             value: (isradio||apartment||home||hotel||resort), onChanged: (index){
             setState((){
               // if(isradio==index || apartment==index|| home==index||hotel==index||resort==index){
               home=index;
               isradio=index;
               apartment=index;
               hotel=index;
               resort=index;
               // }
             });
           },
           title: Text('All'.tr),
           ),
            SwitchListTile( activeColor: TColor.maingreenColor,value: (apartment), onChanged: (index){
              setState((){

                isradio=index;
                apartment=index;

              });
            },
              title: Text('Apartment'.tr),
            ),
            SwitchListTile( activeColor: TColor.maingreenColor,value: (home), onChanged: (index){
              setState((){
                home=index;
                isradio=index;

              });
            },
              title: Text('Home'.tr),
            ),
            SwitchListTile( activeColor: TColor.maingreenColor,value: (hotel), onChanged: (index){
              setState((){

                isradio=index;

                hotel=index;

              });
            },
              title: Text('Hotel'.tr),
            ),
            SwitchListTile( activeColor: TColor.maingreenColor,value: (resort), onChanged: (index){
              setState((){

                isradio=index;

                resort=index;
              });
            },
              title: Text('Resort'.tr),
            ),

            SizedBox(height: Get.size.height*0.06,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: MaterialButton(onPressed: (){},
                minWidth: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text('Apply'.tr,style: TextStyle(color: Colors.white),),
              ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: TColor.maingreenColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget commonText(String title,){
    return  Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          child: Text(title),
        ));
  }

  // Widget dropDownButton(){
  //   return
  //
  // }
}
