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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the File type in your schema. */
@immutable
class File {
  final String? _s3Key;
  final String? _type;
  final double? _size;
  final int? _version;

  String get s3Key {
    try {
      return _s3Key!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get type {
    return _type;
  }
  
  double? get size {
    return _size;
  }
  
  int get version {
    try {
      return _version!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const File._internal({required s3Key, type, size, required version}): _s3Key = s3Key, _type = type, _size = size, _version = version;
  
  factory File({required String s3Key, String? type, double? size, required int version}) {
    return File._internal(
      s3Key: s3Key,
      type: type,
      size: size,
      version: version);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is File &&
      _s3Key == other._s3Key &&
      _type == other._type &&
      _size == other._size &&
      _version == other._version;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("File {");
    buffer.write("s3Key=" + "$_s3Key" + ", ");
    buffer.write("type=" + "$_type" + ", ");
    buffer.write("size=" + (_size != null ? _size!.toString() : "null") + ", ");
    buffer.write("version=" + (_version != null ? _version!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  File copyWith({String? s3Key, String? type, double? size, int? version}) {
    return File._internal(
      s3Key: s3Key ?? this.s3Key,
      type: type ?? this.type,
      size: size ?? this.size,
      version: version ?? this.version);
  }
  
  File.fromJson(Map<String, dynamic> json)  
    : _s3Key = json['s3Key'],
      _type = json['type'],
      _size = (json['size'] as num?)?.toDouble(),
      _version = (json['version'] as num?)?.toInt();
  
  Map<String, dynamic> toJson() => {
    's3Key': _s3Key, 'type': _type, 'size': _size, 'version': _version
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "File";
    modelSchemaDefinition.pluralName = "Files";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 's3Key',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'type',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'size',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'version',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
  });
}