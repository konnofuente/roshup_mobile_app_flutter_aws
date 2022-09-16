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


/** This is an auto generated class representing the Request type in your schema. */
@immutable
class Request extends Model {
  static const classType = const _RequestModelType();
  final String id;
  final Request? _parent;
  final List<Request>? _subRequests;
  final String? _title;
  final String? _content;
  final RequestStatus? _status;
  final String? _rosProviderId;
  final User? _user;
  final Service? _service;
  final Payment? _payment;
  final List<RosFile>? _assets;
  final List<RosFile>? _outputs;
  final List<Message>? _messages;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  Request? get parent {
    return _parent;
  }
  
  List<Request>? get subRequests {
    return _subRequests;
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
  
  RequestStatus get status {
    try {
      return _status!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get rosProviderId {
    return _rosProviderId;
  }
  
  User? get user {
    return _user;
  }
  
  Service? get service {
    return _service;
  }
  
  Payment? get payment {
    return _payment;
  }
  
  List<RosFile>? get assets {
    return _assets;
  }
  
  List<RosFile>? get outputs {
    return _outputs;
  }
  
  List<Message> get messages {
    try {
      return _messages!;
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
  
  const Request._internal({required this.id, parent, subRequests, required title, content, required status, rosProviderId, user, service, payment, assets, outputs, required messages, createdAt, updatedAt}): _parent = parent, _subRequests = subRequests, _title = title, _content = content, _status = status, _rosProviderId = rosProviderId, _user = user, _service = service, _payment = payment, _assets = assets, _outputs = outputs, _messages = messages, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Request({String? id, Request? parent, List<Request>? subRequests, required String title, String? content, required RequestStatus status, String? rosProviderId, User? user, Service? service, Payment? payment, List<RosFile>? assets, List<RosFile>? outputs, required List<Message> messages}) {
    return Request._internal(
      id: id == null ? UUID.getUUID() : id,
      parent: parent,
      subRequests: subRequests != null ? List<Request>.unmodifiable(subRequests) : subRequests,
      title: title,
      content: content,
      status: status,
      rosProviderId: rosProviderId,
      user: user,
      service: service,
      payment: payment,
      assets: assets != null ? List<RosFile>.unmodifiable(assets) : assets,
      outputs: outputs != null ? List<RosFile>.unmodifiable(outputs) : outputs,
      messages: messages != null ? List<Message>.unmodifiable(messages) : messages);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Request &&
      id == other.id &&
      _parent == other._parent &&
      DeepCollectionEquality().equals(_subRequests, other._subRequests) &&
      _title == other._title &&
      _content == other._content &&
      _status == other._status &&
      _rosProviderId == other._rosProviderId &&
      _user == other._user &&
      _service == other._service &&
      _payment == other._payment &&
      DeepCollectionEquality().equals(_assets, other._assets) &&
      DeepCollectionEquality().equals(_outputs, other._outputs) &&
      DeepCollectionEquality().equals(_messages, other._messages);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Request {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("parent=" + (_parent != null ? _parent!.toString() : "null") + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("content=" + "$_content" + ", ");
    buffer.write("status=" + (_status != null ? enumToString(_status)! : "null") + ", ");
    buffer.write("rosProviderId=" + "$_rosProviderId" + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null") + ", ");
    buffer.write("service=" + (_service != null ? _service!.toString() : "null") + ", ");
    buffer.write("payment=" + (_payment != null ? _payment!.toString() : "null") + ", ");
    buffer.write("assets=" + (_assets != null ? _assets!.toString() : "null") + ", ");
    buffer.write("outputs=" + (_outputs != null ? _outputs!.toString() : "null") + ", ");
    buffer.write("messages=" + (_messages != null ? _messages!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Request copyWith({String? id, Request? parent, List<Request>? subRequests, String? title, String? content, RequestStatus? status, String? rosProviderId, User? user, Service? service, Payment? payment, List<RosFile>? assets, List<RosFile>? outputs, List<Message>? messages}) {
    return Request._internal(
      id: id ?? this.id,
      parent: parent ?? this.parent,
      subRequests: subRequests ?? this.subRequests,
      title: title ?? this.title,
      content: content ?? this.content,
      status: status ?? this.status,
      rosProviderId: rosProviderId ?? this.rosProviderId,
      user: user ?? this.user,
      service: service ?? this.service,
      payment: payment ?? this.payment,
      assets: assets ?? this.assets,
      outputs: outputs ?? this.outputs,
      messages: messages ?? this.messages);
  }
  
  Request.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _parent = json['parent']?['serializedData'] != null
        ? Request.fromJson(new Map<String, dynamic>.from(json['parent']['serializedData']))
        : null,
      _subRequests = json['subRequests'] is List
        ? (json['subRequests'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Request.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _title = json['title'],
      _content = json['content'],
      _status = enumFromString<RequestStatus>(json['status'], RequestStatus.values),
      _rosProviderId = json['rosProviderId'],
      _user = json['user']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']['serializedData']))
        : null,
      _service = json['service']?['serializedData'] != null
        ? Service.fromJson(new Map<String, dynamic>.from(json['service']['serializedData']))
        : null,
      _payment = json['payment']?['serializedData'] != null
        ? Payment.fromJson(new Map<String, dynamic>.from(json['payment']['serializedData']))
        : null,
      _assets = json['assets'] is List
        ? (json['assets'] as List)
          .where((e) => e != null)
          .map((e) => RosFile.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _outputs = json['outputs'] is List
        ? (json['outputs'] as List)
          .where((e) => e != null)
          .map((e) => RosFile.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _messages = json['messages'] is List
        ? (json['messages'] as List)
          .where((e) => e != null)
          .map((e) => Message.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'parent': _parent?.toJson(), 'subRequests': _subRequests?.map((Request? e) => e?.toJson()).toList(), 'title': _title, 'content': _content, 'status': enumToString(_status), 'rosProviderId': _rosProviderId, 'user': _user?.toJson(), 'service': _service?.toJson(), 'payment': _payment?.toJson(), 'assets': _assets?.map((RosFile? e) => e?.toJson()).toList(), 'outputs': _outputs?.map((RosFile? e) => e?.toJson()).toList(), 'messages': _messages?.map((Message? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField PARENT = QueryField(
    fieldName: "parent",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Request).toString()));
  static final QueryField SUBREQUESTS = QueryField(
    fieldName: "subRequests",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Request).toString()));
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField CONTENT = QueryField(fieldName: "content");
  static final QueryField STATUS = QueryField(fieldName: "status");
  static final QueryField ROSPROVIDERID = QueryField(fieldName: "rosProviderId");
  static final QueryField USER = QueryField(
    fieldName: "user",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (User).toString()));
  static final QueryField SERVICE = QueryField(
    fieldName: "service",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Service).toString()));
  static final QueryField PAYMENT = QueryField(
    fieldName: "payment",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Payment).toString()));
  static final QueryField ASSETS = QueryField(fieldName: "assets");
  static final QueryField OUTPUTS = QueryField(fieldName: "outputs");
  static final QueryField MESSAGES = QueryField(fieldName: "messages");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Request";
    modelSchemaDefinition.pluralName = "Requests";
    
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Request.PARENT,
      isRequired: false,
      targetName: "parentId",
      ofModelName: (Request).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Request.SUBREQUESTS,
      isRequired: false,
      ofModelName: (Request).toString(),
      associatedKey: Request.PARENT
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Request.TITLE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Request.CONTENT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Request.STATUS,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Request.ROSPROVIDERID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Request.USER,
      isRequired: false,
      targetName: "userId",
      ofModelName: (User).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Request.SERVICE,
      isRequired: false,
      targetName: "serviceId",
      ofModelName: (Service).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Request.PAYMENT,
      isRequired: false,
      targetName: "paymentId",
      ofModelName: (Payment).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'assets',
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'RosFile')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'outputs',
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'RosFile')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'messages',
      isRequired: true,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'Message')
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

class _RequestModelType extends ModelType<Request> {
  const _RequestModelType();
  
  @override
  Request fromJson(Map<String, dynamic> jsonData) {
    return Request.fromJson(jsonData);
  }
}