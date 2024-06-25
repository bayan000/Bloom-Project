
import 'dart:io';

import 'package:admin/controllers/transactionsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../controllers/MenuAppController.dart';
import '../../../../models/transaction.dart';


class TransactionsList extends StatelessWidget {

  const TransactionsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionsController transactionsController=TransactionsController();
    Size size =MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: FutureBuilder<Transactions>(
          future: transactionsController.fetchTransactions(),
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
                    "قائمة المعاملات",
                    style: TextStyle(color: textColor,
                      fontFamily: 'font1',
                      fontSize: 26,
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
                          label: Text("المعاملة", style: communTextStyle24textColor,),

                        ),

                        DataColumn(
                          label: Text("التكلفة", style: communTextStyle24textColor,),
                        ),
                        DataColumn(
                          label: Text("الحسم", style: communTextStyle24textColor,),
                        ),
                        DataColumn(
                          label: Text("", style: communTextStyle24textColor,),
                        ),
                        DataColumn(
                          label: Text("", style: communTextStyle24textColor,),
                        ),

                      ],
                      rows: List.generate(
                          snapshot!.data!.transaction?.length ??0,
                              (index) => transactionDataRow(snapshot!.data!.transaction![index],context) //   (index) => projectDataRow(project_list_item[index]),
                      ),
                    ),
                  ),
                ],
              );
            }
        }
      ),
    );
  }
  DataRow transactionDataRow(Transaction t,BuildContext context) {
    TransactionsController transactionsController=TransactionsController();
    return DataRow(
      cells: [
        DataCell(
          Consumer<TransactionsController>(
              builder: (context,tc,child) {
              return InkWell(
                onTap: (){
                  tc.curr_transaction(t);
                },
                child: Row(
                  children: [

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                      child: Text(t.name!, style: communTextStyle24black,),
                    ),
                  ],
                ),
              );
            }
          ),
        ),
        DataCell(Text(t.price!.toString(), style: communTextStyle24black,)),
        DataCell(Text(t.discount!, style: communTextStyle24black,)),
        DataCell(
            Consumer<MenuAppController>(
                builder: (context, mc, child) {
                  return Consumer<TransactionsController>(
                      builder: (context, tc, child) {
                      return IconButton(
                          icon: Icon(Icons.edit, color: textColor, weight: 40,),
                        onPressed: ()  {
                          _showTextInputDialog(context, t.projectId, t.id, () => mc.UpdateScreenIndex(5));
                        },);
                    }
                  );
                }
            )
        ),
         DataCell(
        Consumer<MenuAppController>(
            builder: (context,mc,child) {
              return IconButton(
                  icon: Icon(Icons.delete, color: white),
                  onPressed: () async {
                    EasyLoading.show(status: 'Loading....');
                    final r = await transactionsController.deleteTransaction(t.id);
                    if (r == 200)
                      EasyLoading.showSuccess("Done");
                    else
                      EasyLoading.showError('Something must have gone wrong');
                    mc.UpdateScreenIndex(5);
                  });
            }
        ),),

      ],
    );
  }

  void _showTextInputDialog(BuildContext context,id,trId,Function updateIndexCallback) {
    final _titleController = TextEditingController(); // Title input
    final PriceController = TextEditingController();
    final DiscountController = TextEditingController();
    final DescriptionController = TextEditingController();
    TransactionsController transactionsController = TransactionsController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'تعديل معاملة',
            style: communTextStyle20textColor,
            textDirection: TextDirection.rtl,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min, // Avoid excessive scrolling
            children: [
              TextField(
                textAlign: TextAlign.end,
                controller: _titleController, // Title input
                decoration: InputDecoration(hintText: 'أدخل اسم المعاملة'),
              ),
              TextField(
                textAlign: TextAlign.end,
                controller: PriceController, // Long text input
                decoration: InputDecoration(hintText: 'أدخل سعر المعاملة'),
              ),
              TextField(
                textAlign: TextAlign.end,
                controller: DiscountController, // Long text input
                decoration: InputDecoration(hintText: 'أدخل الحسم على المعاملة'),
              ),
              TextField(
                textAlign: TextAlign.end,
                controller: DescriptionController, // Long text input
                decoration: InputDecoration(hintText: 'أدخل وصف المعاملة'),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'إلغاء',
                      style: communTextStyle20textColor,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                   TextButton(
                          onPressed: () async {
                            if (_titleController.text == null ||
                                PriceController.text == null ||
                                DiscountController.text == null ||
                                DescriptionController.text == null) {
                              EasyLoading.showError("Please Fill all Required Field");
                            }
                            else {
                              EasyLoading.show(status: 'Loading....');
                              await transactionsController.UpdateTransaction(_titleController.text, id, int.parse(PriceController.text),
                                  DiscountController.text, DescriptionController.text,trId);


                              if (transactionsController.status == 201) {

                                EasyLoading.showSuccess('تم حفظ التعديلات');

                              } else
                                EasyLoading.showError('Something went wrong');
                              Navigator.pop(context);
                              updateIndexCallback();

                            }
                          },
                          child: Text(
                            'تأكيد',
                            style: communTextStyle20textColor,
                            textDirection: TextDirection.rtl,
                          ),
                        )

                ],
              ),
            ],
          ),
        );
      },
    );
  }

}



