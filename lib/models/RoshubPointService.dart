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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the RoshubPointService type in your schema. */
@immutable
class RoshubPointService extends Model {
  static const classType = const _RoshubPointServiceModelType();
  final String id;
  final RoshubPoint? _roshubPoint;
  final Service? _service;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  RoshubPoint get roshubPoint {
    try {
      return _roshubPoint!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Service get service {
    try {
      return _service!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const RoshubPointService._internal({required this.id, required roshubPoint, required service, createdAt, updatedAt}): _roshubPoint = roshubPoint, _service = service, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory RoshubPointService({String? id, required RoshubPoint roshubPoint, required Service service}) {
    return RoshubPointService._internal(
      id: id == null ? UUID.getUUID() : id,
      roshubPoint: roshubPoint,
      service: service);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RoshubPointService &&
      id == other.id &&
      _roshubPoint == other._roshubPoint &&
      _service == other._service;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("RoshubPointService {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("roshubPoint=" + (_roshubPoint != null ? _roshubPoint!.toString() : "null") + ", ");
    buffer.write("service=" + (_service != null ? _service!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  RoshubPointService copyWith({String? id, RoshubPoint? roshubPoint, Service? service}) {
    return RoshubPointService._internal(
      id: id ?? this.id,
      roshubPoint: roshubPoint ?? this.roshubPoint,
      service: service ?? this.service);
  }
  
  RoshubPointService.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _roshubPoint = json['roshubPoint']?['serializedData'] != null
        ? RoshubPoint.fromJson(new Map<String, dynamic>.from(json['roshubPoint']['serializedData']))
        : null,
      _service = json['service']?['serializedData'] != null
        ? Service.fromJson(new Map<String, dynamic>.from(json['service']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'roshubPoint': _roshubPoint?.toJson(), 'service': _service?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField ROSHUBPOINT = QueryField(
    fieldName: "roshubPoint",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (RoshubPoint).toString()));
  static final QueryField SERVICE = QueryField(
    fieldName: "service",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Service).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "RoshubPointService";
    modelSchemaDefinition.pluralName = "RoshubPointServices";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: RoshubPointService.ROSHUBPOINT,
      isRequired: true,
      targetName: "roshubPointID",
      ofModelName: (RoshubPoint).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: RoshubPointService.SERVICE,
      isRequired: true,
      targetName: "serviceID",
      ofModelName: (Service).toString()
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

class _RoshubPointServiceModelType extends ModelType<RoshubPointService> {
  const _RoshubPointServiceModelType();
  
  @override
  RoshubPointService fromJson(Map<String, dynamic> jsonData) {
    return RoshubPointService.fromJson(jsonData);
  }
}