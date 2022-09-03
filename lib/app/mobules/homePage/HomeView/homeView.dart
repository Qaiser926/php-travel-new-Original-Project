import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/language_translation_string/languageTranslation.dart';
import 'package:phptravelapp/app/mobules/homePage/component/HomePageComponent.dart';
import 'package:phptravelapp/app/mobules/homePage/component/feature_car.dart';
import 'package:phptravelapp/app/mobules/homePage/component/feature_tourData.dart';
import 'package:phptravelapp/app/mobules/homePage/component/topRowIcon.dart';
import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';
import 'package:phptravelapp/app/mobules/homePage/component/feature_hotel.dart';
import 'package:phptravelapp/app/mobules/menu_filterPage/dataFilteration.dart';
import 'package:phptravelapp/app/mobules/tourPage/tourView/tourDetailpage.dart';
import 'package:phptravelapp/app/mobules/visaPage/visaView/visaDetailPage.dart';
import 'package:phptravelapp/app/reusableText/reusableText.dart';

import '../component/flightdestinationData.dart';
import '../../hotelPage/hotelView/hotelSearchPage.dart';

class HomeViewPage extends GetView<HomeController>{
  final homecontroller=Get.put(HomeController());

  String lng='English';
  final List changeCurrency=[
    {'name':'Turkish','locale':Locale('en','turkish')},
    {'name':'Russian','locale':Locale('en','russian')},
    {'name':'Philippine','locale':Locale('en','flippen')},
    {'name':'Korean','locale':Locale('en','korean')},
    {'name':'Khmer','locale':Locale('en','khmer')},
    {'name':'Indonesia','locale':Locale('en','indonesia')},
    {'name':'French','locale':Locale('en','french')},
    {'name':'Spanish','locale':Locale('en','spanish')},
    {'name':'English','locale':Locale('en','US')},
    {'name':'German','locale':Locale('en','german')},
    {'name':'Chinese','locale':Locale('en','chines')},
    {'name':'Arabic','locale':Locale('en','arabic')},
  ];




  updateCurrency(Locale locale){
    Get.back();
    Get.updateLocale(locale);
  }
  ChangeCurrency(BuildContext context){
    showDialog(context: context, builder: (builder){

      return

        AlertDialog(
          title: Text('Choose a Currency'),
          content: Scrollbar(
            isAlwaysShown: true,
            child: Container(
              height: Get.size.height*0.3,
              width: Get.size.width*0.3,
              child:ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return InkWell(
                        onTap: (){
                          updateLanguage(locale[index]['locale']);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 6,bottom: 6),
                          child: Center(child: Row(
                            children: [
                              Container(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset(countryImage[index])),
                              SizedBox(width: Get.size.width*0.06,),
                              Text(locale[index]['name'],style: TextStyle(fontSize: 17),),
                            ],
                          )),
                        ));
                  },
                  separatorBuilder: (context,index){
                    return Divider(
                      color: Colors.grey,
                      thickness: 0.0,
                      height: 5.0,
                    );
                  },
                  itemCount: locale.length) ,
            ),
          ),
        );


    });
  }


  final List locale=[
    {'name':'Turkish','locale':Locale('en','turkish')},
    {'name':'Russian','locale':Locale('en','russian')},
    {'name':'Philippine','locale':Locale('en','flippen')},
    {'name':'Korean','locale':Locale('en','korean')},
    {'name':'Khmer','locale':Locale('en','khmer')},
    {'name':'Indonesia','locale':Locale('en','indonesia')},
    {'name':'French','locale':Locale('en','french')},
    {'name':'Spanish','locale':Locale('en','spanish')},
    {'name':'English','locale':Locale('en','US')},
    {'name':'German','locale':Locale('en','german')},
    {'name':'Chinese','locale':Locale('en','chines')},
    {'name':'Arabic','locale':Locale('en','arabic')},
  ];

  List<String> countryImage=['images/turkish.jpg','images/rassian.jpg','images/philippen.png'
    ,'images/korean.jpg','images/Khmer.png','images/indonesia.png','images/french.jpg','images/spanish.jpg'
    ,'images/us.jpg','images/german.jpg','images/chines.jpg','images/arabic.jpg'];

  updateLanguage(Locale locale){
    Get.back();
    Get.updateLocale(locale);
  }
  builddialog(BuildContext context){
    showDialog(context: context, builder: (builder){

      return

        AlertDialog(
          title: Text('Choose a language'),
          content: Scrollbar(
            isAlwaysShown: true,
            child: Container(
              height: Get.size.height*0.3,
              width: Get.size.width*0.3,
              child:ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return InkWell(
                        onTap: (){
                          updateLanguage(locale[index]['locale']);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 6,bottom: 6),
                          child: Center(child: Row(
                            children: [
                              Container(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset(countryImage[index])),
                              SizedBox(width: Get.size.width*0.06,),
                              Text(locale[index]['name'],style: TextStyle(fontSize: 17),),
                            ],
                          )),
                        ));
                  },
                  separatorBuilder: (context,index){
                    return Divider(
                      color: Colors.grey,
                      thickness: 0.0,
                      height: 5.0,
                    );
                  },
                  itemCount: locale.length) ,
            ),
          ),
        );


    });
  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      drawer: drawer(),

      appBar: AppBar(
          surfaceTintColor: TColor.mainColor.withOpacity(0.6),
        backgroundColor:TColor.mainColor.withOpacity(0.1),
        elevation: 0,
        actions: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
                decoration: BoxDecoration(
                    color: TColor.mainIconColor,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.notifications_none),
                )),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 4,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Get.size.height*0.04,),
              // appBar(),
              // sizeBox(),
              // TabComponent(),
          // Obx(() =>Container(
              TopRowIcon(),

              Align(
                  alignment: Alignment.center,
                  child: commonText(
                    title: 'topflightdestination'.tr,
                    size: 25,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 15,),
              FeatureFlight(),
              SizedBox(height:Get.size.height*0.01),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1,color: Colors.grey),
                          shape: BoxShape.circle,
                        ),
                        width: 14,
                        height: 14,
                        child: Icon(Icons.question_mark,size: 8,),

                      ),
                    ),
                    SizedBox(width: 5,),
                    Expanded(child: Text('belowFlightdestinationText'.tr,style: TextStyle(fontSize: 14),))
                  ],
                ),
              ),
              SizedBox(height:Get.size.height*0.05),
              Container(
               color: TColor.mainColor.withOpacity(0.6),
               child: Column(
                 children: [
                   SizedBox(height: 12,),
                   Align(
                       alignment: Alignment.center,
                       child: commonText(
                         title: 'featurehotel'.tr,
                         size: 25,
                         fontWeight: FontWeight.bold,
                       )),

                   FeatureHotel(),

                   SizedBox(height: 20,),
                 ],
               ),
             ),


              SizedBox(
                height: 13,
              ),
              Align(
                  alignment: Alignment.center,
                  child: commonText(
                    title: 'featuretour'.tr,
                    size: 25,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 12,
              ),
              FeatureTourData(),
              SizedBox(
                height: 13,
              ),
              Align(
                  alignment: Alignment.center,
                  child: commonText(
                    title: 'Featured Cars',
                    size: 25,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 13,
              ),
              FeatureCar()
            ],
          ),
        ),
      ),
    );
  }
  Widget appBar(){
    return
      Container(
      width: Get.size.width,
      height: Get.size.height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
                decoration: BoxDecoration(
                    color: TColor.mainIconColor,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  // child: InkWell(
                  //     onTap: () {
                  //       Get.to(DataFilteration());
                  //     },
                  //     child: Icon(Icons.menu)),
                )),
          ),
           Text(
            '       ',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 17),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
                decoration: BoxDecoration(
                    color: TColor.mainIconColor,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.notifications_none),
                )),
          ),
        ],
      ),
    );
  }
  Widget sizeBox(){
    return   const SizedBox(
      height: 10,
    );
  }
 Widget drawer(){
    return   Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xffe9ecef),
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xffe9ecef)),
              accountName: Text(
                " ",
                style: TextStyle(fontSize: 18,color: Colors.black),
              ),
              accountEmail: Text("Qasim Hussain",style: TextStyle(color: Colors.black,fontSize: 17),),
              currentAccountPictureSize: Size.square(50),

              currentAccountPicture: CircleAvatar(
                // backgroundColor: Color.fromARGB(255, 165, 255, 137),
                child: Text(
                  "Q",
                  style: TextStyle(fontSize: 30.0, color: Colors.blue),
                ), //Text
              ), //circleAvatar
            ), //UserAccountDrawerHeader
          ), //DrawerHeader
          ListTile(
            leading: const Icon(Icons.language),
            // title: DropDownPage(),
            title:LanguageChange(),
            onTap: (){
              // builddialog(context);

            },
          ),
          SizedBox(height: 10,),
          ListTile(
            leading:  Icon(Icons.currency_exchange_rounded),
            title: CurrencyExchange(),

            onTap: (){
              // builddialog(context);

            },
          ),

          ListTile(
            leading: Icon(Icons.person_outline_outlined),
            title: LoginLogoutDropDown(),

          )

          // ListTile(
          //   leading: const Icon(Icons.currency_exchange_rounded),
          //   title:ChangeCurreny(),
          //   // title: Text('change cuurendcy'),
          //   onTap: () {
          //
          //   },
          // ),

        ],
      ),
      //Deawer
    );
 }
}

class LanguageChange extends StatefulWidget {
  // const LanguageChange({Key? key}) : super(key: key);

  @override
  State<LanguageChange> createState() => _LanguageChangeState();
}

class _LanguageChangeState extends State<LanguageChange> {
  List countryImage=['images/turkish.jpg','images/rassian.jpg','images/philippen.png'
    ,'images/korean.jpg','images/Khmer.png','images/indonesia.png','images/french.jpg','images/spanish.jpg'
    ,'images/us.jpg','images/german.jpg','images/chines.jpg','images/arabic.jpg',];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lng=TranslationPage().getCurrentLang();
  }
  String? lng;
  @override
  Widget build(BuildContext context) {
  /*  return  DropdownButton<String>(
      menuMaxHeight: Get.size.height*0.35,

      value: this.lng,
      underline: Container(),
      isExpanded: false,
      onChanged: (newVal){
        setState((){
          this.lng=newVal!;
          TranslationPage().changeLocale(newVal);
        });
      },
      items: TranslationPage.langs.map((String value) {
      // items: langs.map((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),*/
    return  DropdownButton<String>(
      menuMaxHeight: Get.size.height*0.35,

      value: this.lng,
      underline: Container(),
      isExpanded: false,
      onChanged: (newVal){
        setState((){
          this.lng=newVal!;
          TranslationPage().changeLocale(newVal);
        });
      },
      items: TranslationPage.langs.map(( value) {
        // items: langs.map((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Row(
            children: [
              Image.asset(countryImage[2],width: 35,height: 35,),
              Text(value),
            ],
          ),
        );
      }).toList(),


      /*  return DropdownMenuItem(
    value: value['id'].toString(),
    child: Row(
    children: [
    Image.asset(value['image'],width: 35,height: 35,),
    // Text(value),
    Container(
    margin: EdgeInsets.only(left: 10),
    child: Text(value['name']),
    )
    ],
    ),
    );*/

    );
  }
}



class DropDownPage extends StatefulWidget {

  @override
  State<DropDownPage> createState() => _DropDownState();
}

class _DropDownState extends State<DropDownPage> {
  List<String> countryImage=['images/turkish.jpg','images/rassian.jpg','images/philippen.png'
    ,'images/korean.jpg','images/Khmer.png','images/indonesia.png','images/french.jpg','images/spanish.jpg'
    ,'images/us.jpg','images/german.jpg','images/chines.jpg','images/arabic.jpg'];
  String _selectedLang='en';
  bool selectedLang=false;

  bool selected=true;



  @override
  Widget build(BuildContext context) {
    return
      Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          // focusColor: Colors.black,
          //   hintColor: Colors.black,
        ),
        child: Scrollbar(
          isAlwaysShown: true,
          child: DropdownButton(
            borderRadius: BorderRadius.circular(6),
              style: TextStyle(color: Colors.orange),
              underline: Container(),
              menuMaxHeight: Get.size.height*0.3,
              // dropdownColor: Colors.white,
              isExpanded: true,
              // focusColor: selectedLang?Colors.black:Colors.white,
              // style: TextStyle(color: Colors.black),
            value: _selectedLang
            , onChanged: (value){
            setState((){
              _selectedLang=value!;
              selectedLang =true;
              // TextStyle(color: Colors.black);
              // TextStyle(color:selected?Colors.black:Colors.white);
            });
            Get.updateLocale(Locale(_selectedLang));
          },
              items: [
                DropdownMenuItem(child: Row(
                  children: [
                    Image.asset(countryImage[0],width: 35,height: 35,),
                    SizedBox(width: 14,),
                    Text('Turkish',style: TextStyle(color:selected?Colors.black:Colors.white,fontSize: 20),),
                  ],
                ),value: 'turkish',),
                DropdownMenuItem(child: Row(
                  children: [
                    Image.asset(countryImage[1],width: 35,height: 35,),
                    SizedBox(width: 14,),
                    Text('Rassian',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 20),),
                  ],
                ),value: 'ra',),
                DropdownMenuItem(child: Row(
                  children: [
                    Image.asset(countryImage[2],width: 35,height: 35,),
                    SizedBox(width: 14,),
                    Text('Philippen',style: TextStyle(color:selected?Colors.black:Colors.white,fontSize: 20),),
                  ],
                ),value: 'filipin',),
                DropdownMenuItem(child: Row(
                  children: [
                    Image.asset(countryImage[3],width: 35,height: 35,),
                    SizedBox(width: 14,),
                    Text('Korean',style: TextStyle(color:selected?Colors.black:Colors.white,fontSize: 20),),
                  ],
                ),value: 'korean',),
                DropdownMenuItem(child: Row(
                  children: [
                    Image.asset(countryImage[4],width: 35,height: 35,),
                    SizedBox(width: 14,),
                    Text('Khmer',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 17),),
                  ],
                ),value: 'Khmer',),
                DropdownMenuItem(child: Row(
                  children: [
                    Image.asset(countryImage[5],width: 35,height: 35,),
                    SizedBox(width: 14,),
                    Text('Indonesia',style: TextStyle(color:selected?Colors.black:Colors.white,fontSize: 17),),
                  ],
                ),value: 'indonesia',),
                DropdownMenuItem(child: Row(
                  children: [
                    Image.asset(countryImage[6],width: 35,height: 35,),
                    SizedBox(width: 14,),
                    Text('French',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 17),),
                  ],
                ),value: 'french',),
                DropdownMenuItem(child: Row(
                  children: [
                    Image.asset(countryImage[7],width: 35,height: 35,),
                    SizedBox(width: 14,),
                    Text('Spanish',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 17),),
                  ],
                ),value: 'spanish',),
                DropdownMenuItem(child: Row(
                  children: [
                    Image.asset(countryImage[8],width: 35,height: 35,),
                    SizedBox(width: 14,),
                    Text('English',style: TextStyle(color:selected?Colors.black:Colors.white,fontSize: 17),),
                  ],
                ),value: 'en',),
                DropdownMenuItem(child: Row(
                  children: [
                    Image.asset(countryImage[9],width: 35,height: 35,),
                    SizedBox(width: 14,),
                    Text('German',style: TextStyle(color:selected?Colors.black:Colors.white,fontSize: 17),),
                  ],
                ),value: 'german',),
                DropdownMenuItem(child: Row(
                  children: [
                    Image.asset(countryImage[10],width: 35,height: 35,),
                    SizedBox(width: 14,),
                    Text('Chiness',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 17),),
                  ],
                ),value: 'chnes',),
                DropdownMenuItem(
                  child: Row(
                  children: [
                    Image.asset(countryImage[11],width: 35,height: 35,),
                    SizedBox(width: 14,),
                    Text('Arabic',style:TextStyle(color:selected?Colors.black:Colors.white,fontSize: 17),),
                  ],
                ),value: 'arabic',),
              ],
             ),
        ),
      );

  }
}



class CurrencyExchange extends StatefulWidget {
  const CurrencyExchange({Key? key}) : super(key: key);

  @override
  State<CurrencyExchange> createState() => _CurrencyExchangeState();
}

class _CurrencyExchangeState extends State<CurrencyExchange> {
  String _selectedLang='en';
  bool selectedLang=false;

  bool selected=true;

  @override
  Widget build(BuildContext context) {
    return
      Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          // focusColor: Colors.black,
          //   hintColor: Colors.black,
        ),
        child: Scrollbar(
          isAlwaysShown: true,
          child: DropdownButton(
            borderRadius: BorderRadius.circular(6),
            style: TextStyle(color: Colors.orange),
            underline: Container(),
            menuMaxHeight: Get.size.height*0.3,
            // dropdownColor: Colors.white,
            isExpanded: true,
            // focusColor: selectedLang?Colors.black:Colors.white,
            // style: TextStyle(color: Colors.black),
            value: _selectedLang
            , onChanged: (value){
            setState((){
              _selectedLang=value!;
              selectedLang =true;
              // TextStyle(color: Colors.black);
              // TextStyle(color:selected?Colors.black:Colors.white);
            });
            Get.updateLocale(Locale(_selectedLang));
          },
            items: [

              DropdownMenuItem(child: Text('USD',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 20),),value: 'usd',),
              DropdownMenuItem(child: Text('GBP',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 20,),),value: 'gbp',),
              DropdownMenuItem(child: Text('SAR',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 20),),value: 'sar',),
              DropdownMenuItem(child: Text('EUR',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 20),),value: 'eur',),
              DropdownMenuItem(child: Text('PKR',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 17),),value: 'pkr',),
              DropdownMenuItem(child: Text('JPY',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 17),),value: 'jpy',),
              DropdownMenuItem(child: Text('INR',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 17),),value: 'inr',),
              DropdownMenuItem(child: Text('CNY',style: TextStyle(color:selected?Colors.black:Colors.white,fontSize: 17),),value: 'cny',),
              DropdownMenuItem(child: Text('TRY',style: TextStyle(color:selected?Colors.black:Colors.white,fontSize: 17),),value: 'en',),
              DropdownMenuItem(child: Text('RUB',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 17),),value: 'rub',),
              DropdownMenuItem(child: Text('IRR',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 17),),value: 'irr',),
            ],
          ),
        ),
      );
  }
}


class LoginLogoutDropDown extends StatefulWidget {
  const LoginLogoutDropDown({Key? key}) : super(key: key);

  @override
  State<LoginLogoutDropDown> createState() => _LoginLogoutDropDownState();
}

class _LoginLogoutDropDownState extends State<LoginLogoutDropDown> {


  bool isVisible=false;
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: (){
           setState((){
             isVisible=!isVisible;
           });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Colors.black,
            ),
            width: Get.size.width*0.4,
            height: Get.size.height*0.054,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.person_outline_outlined,color: Colors.white,),
              Text('ACCOUNT',style: TextStyle(fontSize: 20,color: Colors.white,
              fontWeight: FontWeight.bold),),
              Icon(Icons.keyboard_arrow_down_sharp,color: Colors.white,)
            ],
          ),
          ),
        ),
        Visibility(
          visible: isVisible,
          child:Padding(
            padding: const EdgeInsets.only(top: 4),
            child: AnimatedContainer(
              duration: Duration(
                milliseconds: 100,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.black,
                ),
                width: double.infinity,
                height: Get.size.height*0.434,

                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Get.size.height*0.01,),
                     commonText('Customer Login'),
                      SizedBox(height: Get.size.height*0.03,),
                     commonText('Customer Signup'),
                      SizedBox(height: Get.size.height*0.03,),
                     Divider(color: Colors.white54),
                     commonText('Agents Login'),
                      SizedBox(height: Get.size.height*0.03,),
                     commonText('Agents Signup'),
                      SizedBox(height: Get.size.height*0.02,),
                      Divider(color: Colors.white54),
                     commonText('Supplier Signup'),
                      SizedBox(height: Get.size.height*0.03,),
                     commonText('Supplier Login'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );

  }
  Widget commonText(String title){
    return  Text(title,style: TextStyle(fontSize: 17,color: Colors.white,
        fontWeight: FontWeight.w500),);
  }
}

