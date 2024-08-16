
import 'package:admin/screens/dashboard/components/Chat/chat_body.dart';
import 'package:admin/screens/dashboard/components/Chat/custom_divider.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class MessageBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;

    return Container(

      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),

            child: Container(
              width: size.width*0.5,
              child: Column(
                mainAxisSize:  MainAxisSize.min,

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize:  MainAxisSize.min,
                    children: [
                      Text(
                        "Bloom",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 50),
                      Text(
                        "أهلاً وسهلاً",
                        style: communTextStyle28white,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "يمكنك التواصل والتعاون مع أصحاب العمل والمستثمرين بسهولة\n"
                            "ناقش المشاريع..\n"
                            "ولا تنس أننا موجودون دائماً لتقديم الدعم.\n",
                        style: communTextStyle20white

                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(),
                            SizedBox(width: 10),
                            Column(
                              mainAxisSize:  MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                    flex: 1,
                                    fit: FlexFit.loose,
                                    child: _buildMessage("رائع سنحظى بالكثير من الربح")),
                                Flexible(flex: 1,
                                    fit: FlexFit.loose,child: _buildMessage(" اطلعت على ال business canvas")),
                                Flexible(flex: 1,
                                    fit: FlexFit.loose,child: _buildMessage("بالتوفيق")),
                              ],
                            )
                          ],
                        ),
                      ),

                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisSize:  MainAxisSize.min,

                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                 //Text('hi'),
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.loose,
                                  child: _buildMessage(
                                    "شكراً على التعاون",
                                    isSend: true,
                                  ),
                                ),
                               Flexible(
                                  flex: 1,
                                  fit: FlexFit.loose,
                                  child: _buildMessage(
                                    "سنلتقي قريباً بإذن الله",
                                    isSend: true,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                            CircleAvatar(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: defaultPadding,),
                  //from here
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(

                            decoration: InputDecoration(
                              filled: true, // This enables the filled property
                              fillColor: Colors.grey[350],
                              hintText: "Write message..",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.send_rounded,
                            color: white,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
          CustomDivider(),
          SizedBox(width: defaultPadding,),

        ],
      ),
    );
  }

  Container _buildMessage(String message, {bool isSend = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: isSend ? white : Colors.grey[300]!.withOpacity(.4),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: Text(
        message,
        style: TextStyle(color: isSend ? textColor : null, fontFamily: 'font1',fontSize: 18,fontWeight: FontWeight.bold),
      ),
    );
  }
}