import 'dart:io';

import 'package:content_calendar_frontend/model/status.dart';
import 'package:flutter/foundation.dart';

@immutable
class Content {
  final int id;
  final String title;
  final String desc;
  final Status status;
  final ContentType type;
  final String dateCreated;
  final String? dateUpdated;

  const Content({
    required this.id,
    required this.title,
    required this.desc,
    required this.status,
    required this.type,
    required this.dateCreated,
    this.dateUpdated,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'title': String title,
        'desc': String desc,
        'status': Status status,
        'type': ContentType type,
        'dateCreated': String dateCreated,
        'dateUpdated': String dateUpdated,
      } =>
        Content(
          id: id,
          title: title,
          desc: desc,
          status: status,
          type: type,
          dateCreated: dateCreated,
          dateUpdated: dateUpdated,
        ),
      _ => throw const FormatException('Failed to load content.'),
    };
  }
}
