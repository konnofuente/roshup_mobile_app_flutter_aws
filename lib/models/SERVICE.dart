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

import 'package:roshup_mobile_app_flutter_aws/models/Image.dart';

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Service type in your schema. */
@immutable
class Service extends Model {
  static const classType = const _ServiceModelType();
  final String id;
  final String? _title;
  final String? _content;
  final PriceRange? _priceRange;
  final Image? _image;
  final List<RoshubPointService>? _roshubPoints;
  final List<Request>? _requests;
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
  
  String? get content {
    return _content;
  }
  
  PriceRange? get priceRange {
    return _priceRange;
  }
  
  Image? get image {
    return _image;
  }
  
  List<RoshubPointService>? get roshubPoints {
    return _roshubPoints;
  }
  
  List<Request>? get requests {
    return _requests;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Service._internal({required this.id, required title, content, priceRange, image, roshubPoints, requests, createdAt, updatedAt}): _title = title, _content = content, _priceRange = priceRange, _image = image, _roshubPoints = roshubPoints, _requests = requests, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Service({String? id, required String title, String? content, PriceRange? priceRange, Image? image, List<RoshubPointService>? roshubPoints, List<Request>? requests}) {
    return Service._internal(
      id: id == null ? UUID.getUUID() : id,
      title: title,
      content: content,
      priceRange: priceRange,
      image: image,
      roshubPoints: roshubPoints != null ? List<RoshubPointService>.unmodifiable(roshubPoints) : roshubPoints,
      requests: requests != null ? List<Request>.unmodifiable(requests) : requests);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Service &&
      id == other.id &&
      _title == other._title &&
      _content == other._content &&
      _priceRange == other._priceRange &&
      _image == other._image &&
      DeepCollectionEquality().equals(_roshubPoints, other._roshubPoints) &&
      DeepCollectionEquality().equals(_requests, other._requests);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Service {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("content=" + "$_content" + ", ");
    buffer.write("priceRange=" + (_priceRange != null ? _priceRange!.toString() : "null") + ", ");
    buffer.write("image=" + (_image != null ? _image!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Service copyWith({String? id, String? title, String? content, PriceRange? priceRange, Image? image, List<RoshubPointService>? roshubPoints, List<Request>? requests}) {
    return Service._internal(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      priceRange: priceRange ?? this.priceRange,
      image: image ?? this.image,
      roshubPoints: roshubPoints ?? this.roshubPoints,
      requests: requests ?? this.requests);
  }
  
  Service.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _title = json['title'],
      _content = json['content'],
      _priceRange = json['priceRange']?['serializedData'] != null
        ? PriceRange.fromJson(new Map<String, dynamic>.from(json['priceRange']['serializedData']))
        : null,
      _image = json['image']?['serializedData'] != null
        ? Image.fromJson(new Map<String, dynamic>.from(json['image']['serializedData']))
        : null,
      _roshubPoints = json['roshubPoints'] is List
        ? (json['roshubPoints'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => RoshubPointService.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _requests = json['requests'] is List
        ? (json['requests'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Request.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'title': _title, 'content': _content, 'priceRange': _priceRange?.toJson(), 'image': _image?.toJson(), 'roshubPoints': _roshubPoints?.map((RoshubPointService? e) => e?.toJson()).toList(), 'requests': _requests?.map((Request? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField CONTENT = QueryField(fieldName: "content");
  static final QueryField PRICERANGE = QueryField(fieldName: "priceRange");
  static final QueryField IMAGE = QueryField(fieldName: "image");
  static final QueryField ROSHUBPOINTS = QueryField(
    fieldName: "roshubPoints",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (RoshubPointService).toString()));
  static final QueryField REQUESTS = QueryField(
    fieldName: "requests",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Request).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Service";
    modelSchemaDefinition.pluralName = "Services";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.READ
        ]),
      AuthRule(
        authStrategy: AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: AuthRuleProvider.USERPOOLS,
        operations: [
          ModelOperation.READ,
          ModelOperation.UPDATE,
          ModelOperation.CREATE
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Service.TITLE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Service.CONTENT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'priceRange',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'PriceRange')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'image',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Image')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Service.ROSHUBPOINTS,
      isRequired: false,
      ofModelName: (RoshubPointService).toString(),
      associatedKey: RoshubPointService.SERVICE
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Service.REQUESTS,
      isRequired: false,
      ofModelName: (Request).toString(),
      associatedKey: Request.SERVICE
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

class _ServiceModelType extends ModelType<Service> {
  const _ServiceModelType();
  
  @override
  Service fromJson(Map<String, dynamic> jsonData) {
    return Service.fromJson(jsonData);
  }
}