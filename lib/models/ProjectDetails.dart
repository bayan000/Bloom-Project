class ProjectDetailsWithCanvases {
  Data? data;
  String? message;
  int? status;

  ProjectDetailsWithCanvases({this.data, this.message, this.status});

  ProjectDetailsWithCanvases.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? description;
  String? invName;
  String? wName;
  String? pType;
  int? amount;
  String? location;
  int? investmentStatus;
  int? acceptStatus;
  int? investorId;
  int? userId;
  int? typeId;
  String? createdAt;
  String? updatedAt;
  Canvases? canvases;

  Data(
      {this.id,
        this.invName,
        this.wName,
        this.pType,
        this.name,
        this.description,
        this.amount,
        this.location,
        this.investmentStatus,
        this.acceptStatus,
        this.investorId,
        this.userId,
        this.typeId,
        this.createdAt,
        this.updatedAt,
        this.canvases});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    amount = json['amount'];
    location = json['location'];
    investmentStatus = json['investment_status'];
    acceptStatus = json['accept_status'];
    investorId = json['investor_id'];
    userId = json['user_id'];
    typeId = json['type_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    canvases = json['canvases'] != null
        ? new Canvases.fromJson(json['canvases'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['amount'] = this.amount;
    data['location'] = this.location;
    data['investment_status'] = this.investmentStatus;
    data['accept_status'] = this.acceptStatus;
    data['investor_id'] = this.investorId;
    data['user_id'] = this.userId;
    data['type_id'] = this.typeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.canvases != null) {
      data['canvases'] = this.canvases!.toJson();
    }
    return data;
  }
}

class Canvases {
  int? id;
  int? projectId;
  String? targetAudience;
  String? customersUsingOurProductsOrServices;
  String? customerSegments;
  String? mostImportantCustomers;
  String? interactingWithAudience;
  String? strengtheningOurRelationshipWithThem;
  String? differentiatingOurRelationshipFromCompetitors;
  String? costsOfBuildingRelationship;
  String? raisingAwarenessOfOurExistence;
  String? preferredCommunicationMethodsOfAudience;
  String? optimalCommunicationMethods;
  String? costEffectiveDeliveryMethods;
  String? valuePropositionForAudience;
  String? problemsOfAudienceWeSolve;
  String? productsOfferedToEachCustomerSegment;
  String? audienceNeedsWeFulfill;
  String? requiredActivitiesForOurProducts;
  String? requiredActivitiesForCommunicationChannels;
  String? requiredActivitiesForAudienceRelationships;
  String? requiredActivitiesForRevenueGeneration;
  String? resourcesRequiredForProductDevelopment;
  String? resourcesRequiredForCustomerRelationships;
  String? resourcesRequiredForRevenueGeneration;
  String? keyPartners;
  String? keySuppliers;
  String? keyResourcesRequestedFromPartners;
  String? keyActivitiesExecutedByPartners;
  String? productsAudiencePaysFor;
  String? currentPaymentMethods;
  String? preferredPaymentMethods;
  String? revenuePercentagePerProductForProject;
  String? majorCostsForProject;
  String? mostCostlyKeyResources;
  String? mostCostlyKeyActivities;
  String? createdAt;
  String? updatedAt;

  Canvases(
      {this.id,
        this.projectId,
        this.targetAudience,
        this.customersUsingOurProductsOrServices,
        this.customerSegments,
        this.mostImportantCustomers,
        this.interactingWithAudience,
        this.strengtheningOurRelationshipWithThem,
        this.differentiatingOurRelationshipFromCompetitors,
        this.costsOfBuildingRelationship,
        this.raisingAwarenessOfOurExistence,
        this.preferredCommunicationMethodsOfAudience,
        this.optimalCommunicationMethods,
        this.costEffectiveDeliveryMethods,
        this.valuePropositionForAudience,
        this.problemsOfAudienceWeSolve,
        this.productsOfferedToEachCustomerSegment,
        this.audienceNeedsWeFulfill,
        this.requiredActivitiesForOurProducts,
        this.requiredActivitiesForCommunicationChannels,
        this.requiredActivitiesForAudienceRelationships,
        this.requiredActivitiesForRevenueGeneration,
        this.resourcesRequiredForProductDevelopment,
        this.resourcesRequiredForCustomerRelationships,
        this.resourcesRequiredForRevenueGeneration,
        this.keyPartners,
        this.keySuppliers,
        this.keyResourcesRequestedFromPartners,
        this.keyActivitiesExecutedByPartners,
        this.productsAudiencePaysFor,
        this.currentPaymentMethods,
        this.preferredPaymentMethods,
        this.revenuePercentagePerProductForProject,
        this.majorCostsForProject,
        this.mostCostlyKeyResources,
        this.mostCostlyKeyActivities,
        this.createdAt,
        this.updatedAt});

  Canvases.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectId = json['project_id'];
    targetAudience = json['target_audience'];
    customersUsingOurProductsOrServices =
    json['customers_using_our_products_or_services'];
    customerSegments = json['customer_segments'];
    mostImportantCustomers = json['most_important_customers'];
    interactingWithAudience = json['interacting_with_audience'];
    strengtheningOurRelationshipWithThem =
    json['strengthening_our_relationship_with_them'];
    differentiatingOurRelationshipFromCompetitors =
    json['differentiating_our_relationship_from_competitors'];
    costsOfBuildingRelationship = json['costs_of_building_relationship'];
    raisingAwarenessOfOurExistence = json['raising_awareness_of_our_existence'];
    preferredCommunicationMethodsOfAudience =
    json['preferred_communication_methods_of_audience'];
    optimalCommunicationMethods = json['optimal_communication_methods'];
    costEffectiveDeliveryMethods = json['cost_effective_delivery_methods'];
    valuePropositionForAudience = json['value_proposition_for_audience'];
    problemsOfAudienceWeSolve = json['problems_of_audience_we_solve'];
    productsOfferedToEachCustomerSegment =
    json['products_offered_to_each_customer_segment'];
    audienceNeedsWeFulfill = json['audience_needs_we_fulfill'];
    requiredActivitiesForOurProducts =
    json['required_activities_for_our_products'];
    requiredActivitiesForCommunicationChannels =
    json['required_activities_for_communication_channels'];
    requiredActivitiesForAudienceRelationships =
    json['required_activities_for_audience_relationships'];
    requiredActivitiesForRevenueGeneration =
    json['required_activities_for_revenue_generation'];
    resourcesRequiredForProductDevelopment =
    json['resources_required_for_product_development'];
    resourcesRequiredForCustomerRelationships =
    json['resources_required_for_customer_relationships'];
    resourcesRequiredForRevenueGeneration =
    json['resources_required_for_revenue_generation'];
    keyPartners = json['Key_partners'];
    keySuppliers = json['Key_suppliers'];
    keyResourcesRequestedFromPartners =
    json['Key_resources_requested_from_partners'];
    keyActivitiesExecutedByPartners =
    json['Key_activities_executed_by_partners'];
    productsAudiencePaysFor = json['products_audience_pays_for'];
    currentPaymentMethods = json['current_payment_methods'];
    preferredPaymentMethods = json['preferred_payment_methods'];
    revenuePercentagePerProductForProject =
    json['revenue_percentage_per_product_for_project'];
    majorCostsForProject = json['major_costs_for_project'];
    mostCostlyKeyResources = json['most_costly_key_resources'];
    mostCostlyKeyActivities = json['most_costly_key_activities'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_id'] = this.projectId;
    data['target_audience'] = this.targetAudience;
    data['customers_using_our_products_or_services'] =
        this.customersUsingOurProductsOrServices;
    data['customer_segments'] = this.customerSegments;
    data['most_important_customers'] = this.mostImportantCustomers;
    data['interacting_with_audience'] = this.interactingWithAudience;
    data['strengthening_our_relationship_with_them'] =
        this.strengtheningOurRelationshipWithThem;
    data['differentiating_our_relationship_from_competitors'] =
        this.differentiatingOurRelationshipFromCompetitors;
    data['costs_of_building_relationship'] = this.costsOfBuildingRelationship;
    data['raising_awareness_of_our_existence'] =
        this.raisingAwarenessOfOurExistence;
    data['preferred_communication_methods_of_audience'] =
        this.preferredCommunicationMethodsOfAudience;
    data['optimal_communication_methods'] = this.optimalCommunicationMethods;
    data['cost_effective_delivery_methods'] = this.costEffectiveDeliveryMethods;
    data['value_proposition_for_audience'] = this.valuePropositionForAudience;
    data['problems_of_audience_we_solve'] = this.problemsOfAudienceWeSolve;
    data['products_offered_to_each_customer_segment'] =
        this.productsOfferedToEachCustomerSegment;
    data['audience_needs_we_fulfill'] = this.audienceNeedsWeFulfill;
    data['required_activities_for_our_products'] =
        this.requiredActivitiesForOurProducts;
    data['required_activities_for_communication_channels'] =
        this.requiredActivitiesForCommunicationChannels;
    data['required_activities_for_audience_relationships'] =
        this.requiredActivitiesForAudienceRelationships;
    data['required_activities_for_revenue_generation'] =
        this.requiredActivitiesForRevenueGeneration;
    data['resources_required_for_product_development'] =
        this.resourcesRequiredForProductDevelopment;
    data['resources_required_for_customer_relationships'] =
        this.resourcesRequiredForCustomerRelationships;
    data['resources_required_for_revenue_generation'] =
        this.resourcesRequiredForRevenueGeneration;
    data['Key_partners'] = this.keyPartners;
    data['Key_suppliers'] = this.keySuppliers;
    data['Key_resources_requested_from_partners'] =
        this.keyResourcesRequestedFromPartners;
    data['Key_activities_executed_by_partners'] =
        this.keyActivitiesExecutedByPartners;
    data['products_audience_pays_for'] = this.productsAudiencePaysFor;
    data['current_payment_methods'] = this.currentPaymentMethods;
    data['preferred_payment_methods'] = this.preferredPaymentMethods;
    data['revenue_percentage_per_product_for_project'] =
        this.revenuePercentagePerProductForProject;
    data['major_costs_for_project'] = this.majorCostsForProject;
    data['most_costly_key_resources'] = this.mostCostlyKeyResources;
    data['most_costly_key_activities'] = this.mostCostlyKeyActivities;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}