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


/** This is an auto generated class representing the User type in your schema. */
@immutable
class User extends Model {
  static const classType = const _UserModelType();
  final String id;
  final String? _firstName;
  final String? _lastName;
  final String? _email;
  final String? _phoneNumber;
  final TemporalDateTime? _birthdate;
  final RosImage? _picture;
  final List<Role>? _role;
  final List<PaymentType>? _paymentType;
  final RosProvider? _rosProvider;
  final double? _rating;
  final List<Suggestion>? _suggestions;
  final List<RoshubPoint>? _roshubPoints;
  final List<Message>? _messages;
  final List<Request>? _requestSubmiteds;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get firstName {
    return _firstName;
  }
  
  String? get lastName {
    return _lastName;
  }
  
  String get email {
    try {
      return _email!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get phoneNumber {
    try {
      return _phoneNumber!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime? get birthdate {
    return _birthdate;
  }
  
  RosImage? get picture {
    return _picture;
  }
  
  List<Role>? get role {
    return _role;
  }
  
  List<PaymentType>? get paymentType {
    return _paymentType;
  }
  
  RosProvider? get rosProvider {
    return _rosProvider;
  }
  
  double? get rating {
    return _rating;
  }
  
  List<Suggestion>? get suggestions {
    return _suggestions;
  }
  
  List<RoshubPoint>? get roshubPoints {
    return _roshubPoints;
  }
  
  List<Message>? get messages {
    return _messages;
  }
  
  List<Request>? get requestSubmiteds {
    return _requestSubmiteds;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const User._internal({required this.id, firstName, lastName, required email, required phoneNumber, birthdate, picture, role, paymentType, rosProvider, rating, suggestions, roshubPoints, messages, requestSubmiteds, createdAt, updatedAt}): _firstName = firstName, _lastName = lastName, _email = email, _phoneNumber = phoneNumber, _birthdate = birthdate, _picture = picture, _role = role, _paymentType = paymentType, _rosProvider = rosProvider, _rating = rating, _suggestions = suggestions, _roshubPoints = roshubPoints, _messages = messages, _requestSubmiteds = requestSubmiteds, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory User({String? id, String? firstName, String? lastName, required String email, required String phoneNumber, TemporalDateTime? birthdate, RosImage? picture, List<Role>? role, List<PaymentType>? paymentType, RosProvider? rosProvider, double? rating, List<Suggestion>? suggestions, List<RoshubPoint>? roshubPoints, List<Message>? messages, List<Request>? requestSubmiteds}) {
    return User._internal(
      id: id == null ? UUID.getUUID() : id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      birthdate: birthdate,
      picture: picture,
      role: role != null ? List<Role>.unmodifiable(role) : role,
      paymentType: paymentType != null ? List<PaymentType>.unmodifiable(paymentType) : paymentType,
      rosProvider: rosProvider,
      rating: rating,
      suggestions: suggestions != null ? List<Suggestion>.unmodifiable(suggestions) : suggestions,
      roshubPoints: roshubPoints != null ? List<RoshubPoint>.unmodifiable(roshubPoints) : roshubPoints,
      messages: messages != null ? List<Message>.unmodifiable(messages) : messages,
      requestSubmiteds: requestSubmiteds != null ? List<Request>.unmodifiable(requestSubmiteds) : requestSubmiteds);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
      id == other.id &&
      _firstName == other._firstName &&
      _lastName == other._lastName &&
      _email == other._email &&
      _phoneNumber == other._phoneNumber &&
      _birthdate == other._birthdate &&
      _picture == other._picture &&
      DeepCollectionEquality().equals(_role, other._role) &&
      DeepCollectionEquality().equals(_paymentType, other._paymentType) &&
      _rosProvider == other._rosProvider &&
      _rating == other._rating &&
      DeepCollectionEquality().equals(_suggestions, other._suggestions) &&
      DeepCollectionEquality().equals(_roshubPoints, other._roshubPoints) &&
      DeepCollectionEquality().equals(_messages, other._messages) &&
      DeepCollectionEquality().equals(_requestSubmiteds, other._requestSubmiteds);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("firstName=" + "$_firstName" + ", ");
    buffer.write("lastName=" + "$_lastName" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("phoneNumber=" + "$_phoneNumber" + ", ");
    buffer.write("birthdate=" + (_birthdate != null ? _birthdate!.format() : "null") + ", ");
    buffer.write("picture=" + (_picture != null ? _picture!.toString() : "null") + ", ");
    buffer.write("role=" + (_role != null ? _role!.map((e) => enumToString(e)).toString() : "null") + ", ");
    buffer.write("paymentType=" + (_paymentType != null ? _paymentType!.map((e) => enumToString(e)).toString() : "null") + ", ");
    buffer.write("rosProvider=" + (_rosProvider != null ? _rosProvider!.toString() : "null") + ", ");
    buffer.write("rating=" + (_rating != null ? _rating!.toString() : "null") + ", ");
    buffer.write("suggestions=" + (_suggestions != null ? _suggestions!.toString() : "null") + ", ");
    buffer.write("messages=" + (_messages != null ? _messages!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  User copyWith({String? id, String? firstName, String? lastName, String? email, String? phoneNumber, TemporalDateTime? birthdate, RosImage? picture, List<Role>? role, List<PaymentType>? paymentType, RosProvider? rosProvider, double? rating, List<Suggestion>? suggestions, List<RoshubPoint>? roshubPoints, List<Message>? messages, List<Request>? requestSubmiteds}) {
    return User._internal(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      birthdate: birthdate ?? this.birthdate,
      picture: picture ?? this.picture,
      role: role ?? this.role,
      paymentType: paymentType ?? this.paymentType,
      rosProvider: rosProvider ?? this.rosProvider,
      rating: rating ?? this.rating,
      suggestions: suggestions ?? this.suggestions,
      roshubPoints: roshubPoints ?? this.roshubPoints,
      messages: messages ?? this.messages,
      requestSubmiteds: requestSubmiteds ?? this.requestSubmiteds);
  }
  
  User.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _firstName = json['firstName'],
      _lastName = json['lastName'],
      _email = json['email'],
      _phoneNumber = json['phoneNumber'],
      _birthdate = json['birthdate'] != null ? TemporalDateTime.fromString(json['birthdate']) : null,
      _picture = json['picture']?['serializedData'] != null
        ? RosImage.fromJson(new Map<String, dynamic>.from(json['picture']['serializedData']))
        : null,
      _role = json['role'] is List
        ? (json['role'] as List)
          .map((e) => enumFromString<Role>(e, Role.values)!)
          .toList()
        : null,
      _paymentType = json['paymentType'] is List
        ? (json['paymentType'] as List)
          .map((e) => enumFromString<PaymentType>(e, PaymentType.values)!)
          .toList()
        : null,
      _rosProvider = json['rosProvider']?['serializedData'] != null
        ? RosProvider.fromJson(new Map<String, dynamic>.from(json['rosProvider']['serializedData']))
        : null,
      _rating = (json['rating'] as num?)?.toDouble(),
      _suggestions = json['suggestions'] is List
        ? (json['suggestions'] as List)
          .where((e) => e != null)
          .map((e) => Suggestion.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _roshubPoints = json['roshubPoints'] is List
        ? (json['roshubPoints'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => RoshubPoint.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _messages = json['messages'] is List
        ? (json['messages'] as List)
          .where((e) => e != null)
          .map((e) => Message.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _requestSubmiteds = json['requestSubmiteds'] is List
        ? (json['requestSubmiteds'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Request.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'firstName': _firstName, 'lastName': _lastName, 'email': _email, 'phoneNumber': _phoneNumber, 'birthdate': _birthdate?.format(), 'picture': _picture?.toJson(), 'role': _role?.map((e) => enumToString(e)).toList(), 'paymentType': _paymentType?.map((e) => enumToString(e)).toList(), 'rosProvider': _rosProvider?.toJson(), 'rating': _rating, 'suggestions': _suggestions?.map((Suggestion? e) => e?.toJson()).toList(), 'roshubPoints': _roshubPoints?.map((RoshubPoint? e) => e?.toJson()).toList(), 'messages': _messages?.map((Message? e) => e?.toJson()).toList(), 'requestSubmiteds': _requestSubmiteds?.map((Request? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField FIRSTNAME = QueryField(fieldName: "firstName");
  static final QueryField LASTNAME = QueryField(fieldName: "lastName");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField PHONENUMBER = QueryField(fieldName: "phoneNumber");
  static final QueryField BIRTHDATE = QueryField(fieldName: "birthdate");
  static final QueryField PICTURE = QueryField(fieldName: "picture");
  static final QueryField ROLE = QueryField(fieldName: "role");
  static final QueryField PAYMENTTYPE = QueryField(fieldName: "paymentType");
  static final QueryField ROSPROVIDER = QueryField(fieldName: "rosProvider");
  static final QueryField RATING = QueryField(fieldName: "rating");
  static final QueryField SUGGESTIONS = QueryField(fieldName: "suggestions");
  static final QueryField ROSHUBPOINTS = QueryField(
    fieldName: "roshubPoints",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (RoshubPoint).toString()));
  static final QueryField MESSAGES = QueryField(fieldName: "messages");
  static final QueryField REQUESTSUBMITEDS = QueryField(
    fieldName: "requestSubmiteds",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Request).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";
    
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
      key: User.FIRSTNAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.LASTNAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.EMAIL,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.PHONENUMBER,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.BIRTHDATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'picture',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'RosImage')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.ROLE,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.enumeration))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.PAYMENTTYPE,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.enumeration))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'rosProvider',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'RosProvider')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.RATING,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'suggestions',
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'Suggestion')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: User.ROSHUBPOINTS,
      isRequired: false,
      ofModelName: (RoshubPoint).toString(),
      associatedKey: RoshubPoint.USER
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'messages',
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'Message')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: User.REQUESTSUBMITEDS,
      isRequired: false,
      ofModelName: (Request).toString(),
      associatedKey: Request.USER
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

class _UserModelType extends ModelType<User> {
  const _UserModelType();
  
  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
}