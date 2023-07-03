import 'package:flutter/material.dart';

import '../../uitilities/colors.dart';
import '../../widgets/text_field_input.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
   final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
      final screenWidth =MediaQuery.of(context).size.width;
    final screenHeight =MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image.asset("assets/side_menu.png"),
        title: Row(
          children: const [
             Text("Your work",style: TextStyle(color: textColor,fontSize: 13,),),
             SizedBox(width: 15,),
             Text("Projects",style: TextStyle(color: textColor,fontSize: 13,),),
             SizedBox(width: 15,),
             Icon(Icons.arrow_drop_down,color: Colors.black,)
          ],
        ),
        actions: [
           Image.asset("assets/tittle.png"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                width: screenWidth * 0.35,
                child: TextFieldInput(
                            iconPath: "assets/search.png",
                              hintText: 'Search',
                              textInputType: TextInputType.text,
                              textEditingController: _searchController,
                              isSearch: true,
                              
                            ),
              ),
            ),
            Image.asset("assets/help.png"),
            Image.asset("assets/notification.png"),
             const Padding(
               padding: EdgeInsets.symmetric(vertical: 18),
               child: Text("Dr.Jhon",style: TextStyle(color: textColor,fontSize: 13,),),
             ),
             Image.asset("assets/profile.png"),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                  elevation: 20,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  SizedBox(
                    width: screenWidth * 0.5,
                    height: 450,
                    child:Column(
                      children: [
                        Container(
                          height: 80,
                          width: screenWidth,
                          decoration: const BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))),
                       
                       child: Padding(
                         padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/video.png"),
                                const SizedBox(width: 20,),
                                 const Text("Live Stream",style: TextStyle(color: Colors.white,fontSize: 15,),),
                              ],
                            ),
                            Image.asset("assets/arrow _down.png"),
                          ],
                         ),
                       ),
                        ),
                        Expanded(child: Image.asset("assets/bgImage.png",fit: BoxFit.cover,)),
                       Container(
                          height: 80,
                          width: screenWidth,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))),
                       
                       child: const Text("Live Stream",style: TextStyle(color: text2Color,fontSize: 15,),),
                        ), 
                      ],
                    )
                      
                  )),
                  const SizedBox(height: 10,),
                  Card(
                  elevation: 20,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  SizedBox(
                    width: screenWidth * 0.5,
                    height: 200,
                    child:Column(
                      children: [
                        Container(
                          height: 80,
                          width: screenWidth,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))),
                       
                       child: Padding(
                         padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                         child: Row(
                           children: [
                             Image.asset("assets/message.png"),
                             const SizedBox(width: 20,),
                              const Text("Messenger",style: TextStyle(color: text2Color,fontSize: 15,),),

                            
                           ],
                         ),
                       ),
                        ),
                          const Expanded(
                                child: TextField(
                                 
                                    decoration: InputDecoration(
                                    
                                     
                                      hintText: "Send Doctor a message....",
                                      fillColor: Colors.white,
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      filled: true,
                                      contentPadding:  EdgeInsets.symmetric(horizontal: 25,),
                                    ),
                                    keyboardType: TextInputType.text,
                                    
                                  ),
                              ),
                        
                      ],
                    )
                      
                  ),),
                  SizedBox(height: 20,),
                  Card(
                elevation: 20,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child:  SizedBox(
                  width: screenWidth * 0.5,
                  height: screenHeight,
                  child:Column(
                    children: [
                      Container(
                        height: 80,
                        width: screenWidth,
                        decoration: const BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))),
                     
                     child: Padding(
                       padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/voice.png"),
                              const SizedBox(width: 20,),
                               const Text("Speech to Text",style: TextStyle(color: Colors.white,fontSize: 15,),),
                            ],
                          ),
                          Image.asset("assets/emojione_record-button.png"),
                        ],
                       ),
                     ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Row(
                            children: [
                              Image.asset("assets/solar_hambur.png"),
                              SizedBox(width: 20,),
                              Image.asset("assets/replayrounded.png"),
                              SizedBox(width: 10,),
                              Image.asset("assets/play-arrow-rounded.png"),
                              SizedBox(width: 10,),
                              Image.asset("assets/forwardrounded.png"),
                            ],
                          ),
                          Image.asset("assets/volume-up-fill.png"),
                        ],),
                      )
                    ],
                  ),
                    
                ),),
            ],
          ),
        ),
      ),
    );
  }
}