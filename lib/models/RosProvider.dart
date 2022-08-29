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


/** This is an auto generated class representing the RosProvider type in your schema. */
@immutable
class RosProvider {
  final List<String>? _services;
  final int? _rating;
  final RosProviderStatus? _status;
  final List<Comment>? _comments;

  List<String>? get services {
    return _services;
  }
  
  int? get rating {
    return _rating;
  }
  
  RosProviderStatus? get status {
    return _status;
  }
  
  List<Comment>? get comments {
    return _comments;
  }
  
  const RosProvider._internal({services, rating, status, comments}): _services = services, _rating = rating, _status = status, _comments = comments;
  
  factory RosProvider({List<String>? services, int? rating, RosProviderStatus? status, List<Comment>? comments}) {
    return RosProvider._internal(
      services: services != null ? List<String>.unmodifiable(services) : services,
      rating: rating,
      status: status,
      comments: comments != null ? List<Comment>.unmodifiable(comments) : comments);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RosProvider &&
      DeepCollectionEquality().equals(_services, other._services) &&
      _rating == other._rating &&
      _status == other._status &&
      DeepCollectionEquality().equals(_comments, other._comments);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("RosProvider {");
    buffer.write("services=" + (_services != null ? _services!.toString() : "null") + ", ");
    buffer.write("rating=" + (_rating != null ? _rating!.toString() : "null") + ", ");
    buffer.write("status=" + (_status != null ? enumToString(_status)! : "null") + ", ");
    buffer.write("comments=" + (_comments != null ? _comments!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  RosProvider copyWith({List<String>? services, int? rating, RosProviderStatus? status, List<Comment>? comments}) {
    return RosProvider._internal(
      services: services ?? this.services,
      rating: rating ?? this.rating,
      status: status ?? this.status,
      comments: comments ?? this.comments);
  }
  
  RosProvider.fromJson(Map<String, dynamic> json)  
    : _services = json['services']?.cast<String>(),
      _rating = (json['rating'] as num?)?.toInt(),
      _status = enumFromString<RosProviderStatus>(json['status'], RosProviderStatus.values),
      _comments = json['comments'] is List
        ? (json['comments'] as List)
          .where((e) => e != null)
          .map((e) => Comment.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'services': _services, 'rating': _rating, 'status': enumToString(_status), 'comments': _comments?.map((Comment? e) => e?.toJson()).toList()
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "RosProvider";
    modelSchemaDefinition.pluralName = "RosProviders";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'services',
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'rating',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'status',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'comments',
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'Comment')
    ));
  });
}