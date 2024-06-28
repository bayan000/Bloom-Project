
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../controllers/ProjectsController.dart';
import '../../../models/ProjectDetails.dart';

class Canvas extends StatelessWidget {
  const Canvas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    print("Width "+size.width.toString());
    print("Height "+size.width.toString());
    return Container(
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child:   Consumer<ProjectsController>(
            builder: (context,pc,child) {
            return FutureBuilder<ProjectDetailsWithCanvases>(
                future: pc.fetchProjectDetails(pc.project.id)!,
                builder: (context,snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting||snapshot.hasError)
                  {

                    return SizedBox(
                      width: double.infinity,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  else {
                    if(snapshot.data!.data!.canvases==null)
                      return Center(child:Text("لم يتم ملء نموذج العمل التجاري بعد",style: communTextStyle24white));
                    else
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Container(
                    padding: EdgeInsets.all(defaultPadding),
                    width: size.width*0.6,
                    decoration: BoxDecoration(
                      color: white
                      ,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      children: [
                        Text("نموذج العمل التجاري",style: communTextStyle24textColor),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: defaultPadding,),
                SizedBox(
                    width: double.infinity,
                      child: Row(
                        children: [
                          MyContainer(size.width*0.2,white,
                              snapshot.data!.data!.canvases!.targetAudience!,
                              "الجمهور المستهدف",communTextStyle20textColor),
                          SizedBox(width: defaultPadding,),
                          MyContainer(size.width*0.15,secondaryColor,
                              snapshot.data!.data!.canvases!.customersUsingOurProductsOrServices!,
                              "العملاء المستخدمين للمنتج",communTextStyle20white),
                          SizedBox(width: defaultPadding,),

                          MyContainer(size.width*0.17,textColor,
                              snapshot.data!.data!.canvases!.customerSegments!,
                              "فئات العملاء",communTextStyle20white),
                        ],
                      )
                  ),
                SizedBox(height: defaultPadding,),
                SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        MyContainer(size.width*0.2,secondaryColor,
                            snapshot.data!.data!.canvases!.mostImportantCustomers!,
                            "العملاء الأكثر أهمية",communTextStyle20white),
                        SizedBox(width: defaultPadding,),
                        MyContainer(size.width*0.15,white,
                            snapshot.data!.data!.canvases!.interactingWithAudience!,
                            "التفاعل مع الجمهور",communTextStyle20textColor),
                        SizedBox(width: defaultPadding,),

                        MyContainer(size.width*0.17,secondaryColor,
                            snapshot.data!.data!.canvases!.strengtheningOurRelationshipWithThem!,
                            "تعزيز علاقتنا معهم",communTextStyle20white),
                      ],
                    )
                ),
                SizedBox(height: defaultPadding,),
                SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        MyContainer(size.width*0.2,textColor,
                            snapshot.data!.data!.canvases!.differentiatingOurRelationshipFromCompetitors!,
                            "تميز علاقتنا عن المنافسين",communTextStyle20white),
                        SizedBox(width: defaultPadding,),
                        MyContainer(size.width*0.15,secondaryColor,
                            snapshot.data!.data!.canvases!.costsOfBuildingRelationship!,
                            "تكاليف بناء العلاقة",communTextStyle20white),
                        SizedBox(width: defaultPadding,),
                        MyContainer(size.width*0.17,white,
                            snapshot.data!.data!.canvases!.raisingAwarenessOfOurExistence!,
                            "زيادة الوعي بوجودنا",communTextStyle20textColor),
                      ],
                    )
                ),
                SizedBox(height: defaultPadding,),
                SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        MyContainer(size.width*0.2,white,
                            snapshot.data!.data!.canvases!.preferredCommunicationMethodsOfAudience!,"طرق التواصل المفضلة للجمهور",communTextStyle20textColor),
                        SizedBox(width: defaultPadding,),
                        MyContainer(size.width*0.15,secondaryColor,
                            snapshot.data!.data!.canvases!.optimalCommunicationMethods!,
                            "أفضل طرق التواصل",communTextStyle20white),
                        SizedBox(width: defaultPadding,),

                        MyContainer(size.width*0.17,textColor,
                            snapshot.data!.data!.canvases!.costEffectiveDeliveryMethods!,
                            "طرق توصيل فعالة من حيث التكلفة",communTextStyle20white),
                      ],
                    )
                ),
                SizedBox(height: defaultPadding,),
                SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        MyContainer(size.width*0.2,secondaryColor,
                            snapshot.data!.data!.canvases!.valuePropositionForAudience!,
                            "القيمة المقدمة للجمهور",communTextStyle20white),
                        SizedBox(width: defaultPadding,),
                        MyContainer(size.width*0.15,white,
                            snapshot.data!.data!.canvases!.problemsOfAudienceWeSolve!,
                            "المشاكل التي نحلها للجمهور",communTextStyle20textColor),
                        SizedBox(width: defaultPadding,),

                        MyContainer(size.width*0.17,secondaryColor,
                            snapshot.data!.data!.canvases!.productsOfferedToEachCustomerSegment!,
                            "المنتجات المقدمة لكل فئة من العملاء",communTextStyle20white),
                      ],
                    )
                ),
                SizedBox(height: defaultPadding,),
                SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        MyContainer(size.width*0.2,textColor,
                            snapshot.data!.data!.canvases!.audienceNeedsWeFulfill!,"تلبية احتياجات الجمهور",communTextStyle20white),
                        SizedBox(width: defaultPadding,),
                        MyContainer(size.width*0.15,secondaryColor,
                            snapshot.data!.data!.canvases!.requiredActivitiesForOurProducts!,
                            "الأنشطة المطلوبة لمنتجاتنا",communTextStyle20white),
                        SizedBox(width: defaultPadding,),
                        MyContainer(size.width*0.17,white,
                            snapshot.data!.data!.canvases!.requiredActivitiesForCommunicationChannels!,"الأنشطة المطلوبة لقنوات الاتصال",communTextStyle20textColor),
                      ],
                    )
                ),
                SizedBox(height: defaultPadding,),
                SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        MyContainer(size.width*0.2,white,
                            snapshot.data!.data!.canvases!.requiredActivitiesForAudienceRelationships!,"الأنشطة المطلوبة لبناء العلاقات مع الجمهور",communTextStyle20textColor),
                        SizedBox(width: defaultPadding,),
                        MyContainer(size.width*0.15,secondaryColor,
                            snapshot.data!.data!.canvases!.requiredActivitiesForRevenueGeneration!,
                            "الأنشطة المطلوبة لتوليد الإيرادات",communTextStyle20white),
                        SizedBox(width: defaultPadding,),
                        MyContainer(size.width*0.17,textColor,
                            snapshot.data!.data!.canvases!.resourcesRequiredForProductDevelopment!,
                            "الموارد المطلوبة لتطوير المنتج",communTextStyle20white),
                      ],
                    )
                ),
                SizedBox(height: defaultPadding,),
                SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        MyContainer(size.width*0.2,secondaryColor,
                            snapshot.data!.data!.canvases!.resourcesRequiredForCustomerRelationships!,"الموارد المطلوبة لعلاقات العملاء",communTextStyle20white),
                        SizedBox(width: defaultPadding,),
                        MyContainer(size.width*0.15,white,
                            snapshot.data!.data!.canvases!.requiredActivitiesForRevenueGeneration!,
                            "الموارد المطلوبة لتوليد الإيرادات",communTextStyle20textColor),
                        SizedBox(width: defaultPadding,),

                        MyContainer(size.width*0.17,secondaryColor,
                            snapshot.data!.data!.canvases!.keyPartners!,"الشركاء الرئيسيون",communTextStyle20white),
                      ],
                    )
                ),
                SizedBox(height: defaultPadding,),
                SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        MyContainer(size.width*0.2,textColor,
                            snapshot.data!.data!.canvases!.keySuppliers!,"الموردين الرئيسيون",communTextStyle20white),
                        SizedBox(width: defaultPadding,),
                        MyContainer(size.width*0.15,secondaryColor,
                            snapshot.data!.data!.canvases!.keyResourcesRequestedFromPartners!,
                            "الموارد الرئيسية التي سنطلبها من الشركاء",communTextStyle20white),
                        SizedBox(width: defaultPadding,),
                        MyContainer(size.width*0.17,white,
                            snapshot.data!.data!.canvases!.keyActivitiesExecutedByPartners!,"الأنشطة الرئيسية التي سيقوم بها الشركاء",communTextStyle20textColor),
                      ],
                    )
                ),
                SizedBox(height: defaultPadding,),
                SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        MyContainer(size.width*0.2,white,
                            snapshot.data!.data!.canvases!.productsAudiencePaysFor!,"المنتجات التي يدفع عنها الجمهور",communTextStyle20textColor),
                        SizedBox(width: defaultPadding,),
                        MyContainer(size.width*0.15,secondaryColor,
                            snapshot.data!.data!.canvases!.currentPaymentMethods!,
                            "طرق الدفع الحالية",communTextStyle20white),
                        SizedBox(width: defaultPadding,),

                        MyContainer(size.width*0.17,textColor,
                            snapshot.data!.data!.canvases!.preferredPaymentMethods!,"طرق الدفع المفضلة",communTextStyle20white),
                      ],
                    )
                ),
                SizedBox(height: defaultPadding,),
                SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        MyContainer(size.width*0.2,secondaryColor,
                            snapshot.data!.data!.canvases!.revenuePercentagePerProductForProject!,"نسبة الإيرادات لكل منتج في المشروع",communTextStyle20white),
                        SizedBox(width: defaultPadding,),
                        MyContainer(size.width*0.15,white,
                            snapshot.data!.data!.canvases!.majorCostsForProject!,
                            "التكاليف الرئيسية للمشروع",communTextStyle20textColor),
                        SizedBox(width: defaultPadding,),

                        MyContainer(size.width*0.17,secondaryColor,
                            snapshot.data!.data!.canvases!.mostCostlyKeyResources!,
                            "الموارد الأكثر تكلفة",communTextStyle20white),
                      ],
                    )
                ),
                SizedBox(height: defaultPadding,),
                MyContainer(size.width*0.6, textColor,
                    snapshot.data!.data!.canvases!.mostCostlyKeyActivities!,"الأنشطة الأكثر تكلفة", communTextStyle20white)

                      ],
                    );
                  }
              }
            );
          }
        )
    );
  }}
  //secondaryColor
