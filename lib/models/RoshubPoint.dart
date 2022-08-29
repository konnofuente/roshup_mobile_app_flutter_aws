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


/** This is an auto generated class representing the RoshubPoint type in your schema. */
@immutable
class RoshubPoint extends Model {
  static const classType = const _RoshubPointModelType();
  final String id;
  final String? _title;
  final List<Comment>? _comments;
  final User? _user;
  final List<RoshubPointService>? _services;
  final List<PaymentType>? _paymentType;
  final Location? _location;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get title {
    try {
      return _title!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<Comment>? get comments {
    return _comments;
  }
  
  User? get user {
    return _user;
  }
  
  List<RoshubPointService>? get services {
    return _services;
  }
  
  List<PaymentType>? get paymentType {
    return _paymentType;
  }
  
  Location? get location {
    return _location;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const RoshubPoint._internal({required this.id, required title, comments, user, services, paymentType, location, createdAt, updatedAt}): _title = title, _comments = comments, _user = user, _services = services, _paymentType = paymentType, _location = location, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory RoshubPoint({String? id, required String title, List<Comment>? comments, User? user, List<RoshubPointService>? services, List<PaymentType>? paymentType, Location? location}) {
    return RoshubPoint._internal(
      id: id == null ? UUID.getUUID() : id,
      title: title,
      comments: comments != null ? List<Comment>.unmodifiable(comments) : comments,
      user: user,
      services: services != null ? List<RoshubPointService>.unmodifiable(services) : services,
      paymentType: paymentType != null ? List<PaymentType>.unmodifiable(paymentType) : paymentType,
      location: location);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RoshubPoint &&
      id == other.id &&
      _title == other._title &&
      DeepCollectionEquality().equals(_comments, other._comments) &&
      _user == other._user &&
      DeepCollectionEquality().equals(_services, other._services) &&
      DeepCollectionEquality().equals(_paymentType, other._paymentType) &&
      _location == other._location;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("RoshubPoint {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("comments=" + (_comments != null ? _comments!.toString() : "null") + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null") + ", ");
    buffer.write("paymentType=" + (_paymentType != null ? _paymentType!.map((e) => enumToString(e)).toString() : "null") + ", ");
    buffer.write("location=" + (_location != null ? _location!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  RoshubPoint copyWith({String? id, String? title, List<Comment>? comments, User? user, List<RoshubPointService>? services, List<PaymentType>? paymentType, Location? location}) {
    return RoshubPoint._internal(
      id: id ?? this.id,
      title: title ?? this.title,
      comments: comments ?? this.comments,
      user: user ?? this.user,
      services: services ?? this.services,
      paymentType: paymentType ?? this.paymentType,
      location: location ?? this.location);
  }
  
  RoshubPoint.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _title = json['title'],
      _comments = json['comments'] is List
        ? (json['comments'] as List)
          .where((e) => e != null)
          .map((e) => Comment.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _user = json['user']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']['serializedData']))
        : null,
      _services = json['services'] is List
        ? (json['services'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => RoshubPointService.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _paymentType = json['paymentType'] is List
        ? (json['paymentType'] as List)
          .map((e) => enumFromString<PaymentType>(e, PaymentType.values)!)
          .toList()
        : null,
      _location = json['location']?['serializedData'] != null
        ? Location.fromJson(new Map<String, dynamic>.from(json['location']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'title': _title, 'comments': _comments?.map((Comment? e) => e?.toJson()).toList(), 'user': _user?.toJson(), 'services': _services?.map((RoshubPointService? e) => e?.toJson()).toList(), 'paymentType': _paymentType?.map((e) => enumToString(e)).toList(), 'location': _location?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField COMMENTS = QueryField(fieldName: "comments");
  static final QueryField USER = QueryField(
    fieldName: "user",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (User).toString()));
  static final QueryField SERVICES = QueryField(
    fieldName: "services",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (RoshubPointService).toString()));
  static final QueryField PAYMENTTYPE = QueryField(fieldName: "paymentType");
  static final QueryField LOCATION = QueryField(fieldName: "location");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "RoshubPoint";
    modelSchemaDefinition.pluralName = "RoshubPoints";
    
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: RoshubPoint.TITLE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'comments',
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'Comment')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: RoshubPoint.USER,
      isRequired: false,
      targetName: "userId",
      ofModelName: (User).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: RoshubPoint.SERVICES,
      isRequired: false,
      ofModelName: (RoshubPointService).toString(),
      associatedKey: RoshubPointService.ROSHUBPOINT
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: RoshubPoint.PAYMENTTYPE,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.enumeration))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'location',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Location')
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

class _RoshubPointModelType extends ModelType<RoshubPoint> {
  const _RoshubPointModelType();
  
  @override
  RoshubPoint fromJson(Map<String, dynamic> jsonData) {
    return RoshubPoint.fromJson(jsonData);
  }
}