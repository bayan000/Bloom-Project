import 'package:admin/controllers/aninvestorController.dart';
import 'package:admin/controllers/investor_controller.dart';
import 'package:admin/models/investor.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';


class InvestorsList extends StatelessWidget {
  const InvestorsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    InvestorsController ic=InvestorsController();

    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: FutureBuilder<List<Investor>>(
          future: ic.fetchInvestors(),
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting)
            {return Column(
              children: [
                SizedBox(height: size.height*0.37,),
                Container(
                  height: size.height*0.5,
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Center(child: Column(children: [
                    CircularProgressIndicator(),
                    SizedBox(height: size.height*0.01,),
                    Text('loading...',style: TextStyle(fontSize: 15),),],)),),
              ],

            );}
            if(snapshot.hasError)
            {
              return Center(child: Text('Error !',style: TextStyle(fontSize: 20),),);
            }
            else{
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "قائمة المستثمرين",
                    style: TextStyle(color: textColor,
                      fontFamily: 'font1',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: DataTable(
                      columnSpacing: defaultPadding,
                      // minWidth: 600,
                      columns: [
                        DataColumn(
                          label: Text("اسم المستثمر", style: communTextStyle24textColor,),
                        ),
                        DataColumn(
                          label: Text("الإيميل", style: communTextStyle24textColor,),
                        ),
                      ],
                      rows: List.generate(
                        snapshot.data?.length ??0,
                              (index) => investorDataRow(snapshot.data![index])
                      ),
                    ),
                  ),
                ],
              );
            }

          })
    );
  }
}

DataRow investorDataRow(Investor investor) {
  String? fullname=investor.firstName! +" "+ investor.lastName!;
  return DataRow(

    cells: [
      //if(fullname!=null)
      DataCell(

          Consumer<InvestorsController>(
          builder: (context,IS,child) {
            return InkWell( // Wrap DataCell with InkWell
                onTap: (){
                  IS.curr_Investor(investor);
                  print(investor.id.toString()+"investor iddddddddd");
                },
                child: Row(
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Text(fullname,style: communTextStyle24black,),
                ),
              ],
            ));
          }
        ),
      ),

        DataCell(investor.email!=null ?
        Text(investor.email!,style: communTextStyle24black,)
            : Text(" ",style: communTextStyle24black,)),
    ],
  );
}