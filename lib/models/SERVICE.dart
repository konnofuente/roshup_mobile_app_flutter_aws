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

/** This is an auto generated class representing the SERVICE type in your schema. */
@immutable
class SERVICE extends Model {
  static const classType = const _SERVICEModelType();
  final String id;
  final String? _name;
  final int? _amoungt;
  final String? _imagePath;
  final double? _rating;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  String get name {
    try {
      return _name!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  int get amoungt {
    try {
      return _amoungt!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String? get imagePath {
    return _imagePath;
  }

  double? get rating {
    return _rating;
  }

  TemporalDateTime? get createdAt {
    return _createdAt;
  }

  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const SERVICE._internal(
      {required this.id,
      required name,
      required amoungt,
      imagePath,
      rating,
      createdAt,
      updatedAt})
      : _name = name,
        _amoungt = amoungt,
        _imagePath = imagePath,
        _rating = rating,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory SERVICE(
      {String? id,
      required String name,
      required int amoungt,
      String? imagePath,
      double? rating}) {
    return SERVICE._internal(
        id: id == null ? UUID.getUUID() : id,
        name: name,
        amoungt: amoungt,
        imagePath: imagePath,
        rating: rating);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SERVICE &&
        id == other.id &&
        _name == other._name &&
        _amoungt == other._amoungt &&
        _imagePath == other._imagePath &&
        _rating == other._rating;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("SERVICE {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write(
        "amoungt=" + (_amoungt != null ? _amoungt!.toString() : "null") + ", ");
    buffer.write("imagePath=" + "$_imagePath" + ", ");
    buffer.write(
        "rating=" + (_rating != null ? _rating!.toString() : "null") + ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt!.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  SERVICE copyWith(
      {String? id,
      String? name,
      int? amoungt,
      String? imagePath,
      double? rating}) {
    return SERVICE._internal(
        id: id ?? this.id,
        name: name ?? this.name,
        amoungt: amoungt ?? this.amoungt,
        imagePath: imagePath ?? this.imagePath,
        rating: rating ?? this.rating);
  }

  SERVICE.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _name = json['name'],
        _amoungt = (json['amoungt'] as num?)?.toInt(),
        _imagePath = json['imagePath'],
        _rating = (json['rating'] as num?)?.toDouble(),
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': _name,
        'amoungt': _amoungt,
        'imagePath': _imagePath,
        'rating': _rating,
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  static final QueryField ID = QueryField(fieldName: "sERVICE.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField AMOUNGT = QueryField(fieldName: "amoungt");
  static final QueryField IMAGEPATH = QueryField(fieldName: "imagePath");
  static final QueryField RATING = QueryField(fieldName: "rating");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "SERVICE";
    modelSchemaDefinition.pluralName = "SERVICES";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: SERVICE.NAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: SERVICE.AMOUNGT,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: SERVICE.IMAGEPATH,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: SERVICE.RATING,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: 'createdAt',
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: 'updatedAt',
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));
  });

  static List<SERVICE> ServiceList = <SERVICE>[
    SERVICE(
        name: 'Wordpress',
        amoungt: 30000,
        imagePath: 'assets/design_course/interFace1.png',
        rating: 4.5),

    SERVICE(
        name: 'Microsoft',
        amoungt: 32000,
        imagePath: 'assets/design_course/interFace1.png',
        rating: 4.5),

    SERVICE(
        name: 'Power point',
        amoungt: 30000,
        imagePath: 'assets/design_course/interFace1.png',
        rating: 4.5),

    SERVICE(
        name: 'Wordpress',
        amoungt: 30000,
        imagePath: 'assets/design_course/interFace2.png',
        rating: 4.5),
  ];


  
  static List<SERVICE> AllServiceList = <SERVICE>[
    SERVICE(
        name: 'Wordpress',
        amoungt: 30000,
        imagePath: 'assets/design_course/interFace1.png',
        rating: 4.5),

    SERVICE(
        name: 'Microsoft',
        amoungt: 32000,
        imagePath: 'assets/design_course/interFace1.png',
        rating: 4.5),

    SERVICE(
        name: 'Power point',
        amoungt: 30000,
        imagePath: 'assets/design_course/interFace1.png',
        rating: 4.5),

    SERVICE(
        name: 'Wordpress',
        amoungt: 30000,
        imagePath: 'assets/design_course/interFace2.png',
        rating: 4.5),
  ];
}

class _SERVICEModelType extends ModelType<SERVICE> {
  const _SERVICEModelType();

  @override
  SERVICE fromJson(Map<String, dynamic> jsonData) {
    return SERVICE.fromJson(jsonData);
  }
}
