/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Payment type in your schema. */
@immutable
class Payment extends Model {
  static const classType = const _PaymentModelType();
  final String id;
  final List<Request>? _requests;
  final String? _paymentInstrument;
  final PaymentType? _type;
  final double? _price;
  final String? _mnoId;
  final String? _mnoRespond;
  final PaymentStatus? _status;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  List<Request>? get requests {
    return _requests;
  }
  
  String get paymentInstrument {
    try {
      return _paymentInstrument!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  PaymentType get type {
    try {
      return _type!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double? get price {
    return _price;
  }
  
  String? get mnoId {
    return _mnoId;
  }
  
  String? get mnoRespond {
    return _mnoRespond;
  }
  
  PaymentStatus? get status {
    return _status;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Payment._internal({required this.id, requests, required paymentInstrument, required type, price, mnoId, mnoRespond, status, createdAt, updatedAt}): _requests = requests, _paymentInstrument = paymentInstrument, _type = type, _price = price, _mnoId = mnoId, _mnoRespond = mnoRespond, _status = status, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Payment({String? id, List<Request>? requests, required String paymentInstrument, required PaymentType type, double? price, String? mnoId, String? mnoRespond, PaymentStatus? status}) {
    return Payment._internal(
      id: id == null ? UUID.getUUID() : id,
      requests: requests != null ? List<Request>.unmodifiable(requests) : requests,
      paymentInstrument: paymentInstrument,
      type: type,
      price: price,
      mnoId: mnoId,
      mnoRespond: mnoRespond,
      status: status);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Payment &&
      id == other.id &&
      DeepCollectionEquality().equals(_requests, other._requests) &&
      _paymentInstrument == other._paymentInstrument &&
      _type == other._type &&
      _price == other._price &&
      _mnoId == other._mnoId &&
      _mnoRespond == other._mnoRespond &&
      _status == other._status;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Payment {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("paymentInstrument=" + "$_paymentInstrument" + ", ");
    buffer.write("type=" + (_type != null ? enumToString(_type)! : "null") + ", ");
    buffer.write("price=" + (_price != null ? _price!.toString() : "null") + ", ");
    buffer.write("mnoId=" + "$_mnoId" + ", ");
    buffer.write("mnoRespond=" + "$_mnoRespond" + ", ");
    buffer.write("status=" + (_status != null ? enumToString(_status)! : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Payment copyWith({String? id, List<Request>? requests, String? paymentInstrument, PaymentType? type, double? price, String? mnoId, String? mnoRespond, PaymentStatus? status}) {
    return Payment._internal(
      id: id ?? this.id,
      requests: requests ?? this.requests,
      paymentInstrument: paymentInstrument ?? this.paymentInstrument,
      type: type ?? this.type,
      price: price ?? this.price,
      mnoId: mnoId ?? this.mnoId,
      mnoRespond: mnoRespond ?? this.mnoRespond,
      status: status ?? this.status);
  }
  
  Payment.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _requests = json['requests'] is List
        ? (json['requests'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Request.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _paymentInstrument = json['paymentInstrument'],
      _type = enumFromString<PaymentType>(json['type'], PaymentType.values),
      _price = (json['price'] as num?)?.toDouble(),
      _mnoId = json['mnoId'],
      _mnoRespond = json['mnoRespond'],
      _status = enumFromString<PaymentStatus>(json['status'], PaymentStatus.values),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'requests': _requests?.map((Request? e) => e?.toJson()).toList(), 'paymentInstrument': _paymentInstrument, 'type': enumToString(_type), 'price': _price, 'mnoId': _mnoId, 'mnoRespond': _mnoRespond, 'status': enumToString(_status), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField REQUESTS = QueryField(
    fieldName: "requests",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Request).toString()));
  static final QueryField PAYMENTINSTRUMENT = QueryField(fieldName: "paymentInstrument");
  static final QueryField TYPE = QueryField(fieldName: "type");
  static final QueryField PRICE = QueryField(fieldName: "price");
  static final QueryField MNOID = QueryField(fieldName: "mnoId");
  static final QueryField MNORESPOND = QueryField(fieldName: "mnoRespond");
  static final QueryField STATUS = QueryField(fieldName: "status");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Payment";
    modelSchemaDefinition.pluralName = "Payments";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: AuthRuleProvider.USERPOOLS,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Payment.REQUESTS,
      isRequired: false,
      ofModelName: (Request).toString(),
      associatedKey: Request.PAYMENT
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Payment.PAYMENTINSTRUMENT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Payment.TYPE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Payment.PRICE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Payment.MNOID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Payment.MNORESPOND,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Payment.STATUS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _PaymentModelType extends ModelType<Payment> {
  const _PaymentModelType();
  
  @override
  Payment fromJson(Map<String, dynamic> jsonData) {
    return Payment.fromJson(jsonData);
  }
}