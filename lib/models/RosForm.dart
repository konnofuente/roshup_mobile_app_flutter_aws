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

import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the RosForm type in your schema. */
@immutable
class RosForm {
  final String? _name;
  final String? _type;
  final List<String>? _accepted_values;

  String? get name {
    return _name;
  }
  
  String? get type {
    return _type;
  }
  
  List<String>? get accepted_values {
    return _accepted_values;
  }
  
  const RosForm._internal({name, type, accepted_values}): _name = name, _type = type, _accepted_values = accepted_values;
  
  factory RosForm({String? name, String? type, List<String>? accepted_values}) {
    return RosForm._internal(
      name: name,
      type: type,
      accepted_values: accepted_values != null ? List<String>.unmodifiable(accepted_values) : accepted_values);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RosForm &&
      _name == other._name &&
      _type == other._type &&
      DeepCollectionEquality().equals(_accepted_values, other._accepted_values);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("RosForm {");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("type=" + "$_type" + ", ");
    buffer.write("accepted_values=" + (_accepted_values != null ? _accepted_values!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  RosForm copyWith({String? name, String? type, List<String>? accepted_values}) {
    return RosForm._internal(
      name: name ?? this.name,
      type: type ?? this.type,
      accepted_values: accepted_values ?? this.accepted_values);
  }
  
  RosForm.fromJson(Map<String, dynamic> json)  
    : _name = json['name'],
      _type = json['type'],
      _accepted_values = json['accepted_values']?.cast<String>();
  
  Map<String, dynamic> toJson() => {
    'name': _name, 'type': _type, 'accepted_values': _accepted_values
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "RosForm";
    modelSchemaDefinition.pluralName = "RosForms";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'name',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'type',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'accepted_values',
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
  });
}