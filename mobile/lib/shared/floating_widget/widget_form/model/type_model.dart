import 'dart:convert';

import '../../../../core/core.dart';

class TypeModel {
  final String title;
  final String placeholder;
  final String sourceImage;
  final String altImage;
  final String type;
  TypeModel({
    required this.title,
    required this.placeholder,
    required this.sourceImage,
    required this.altImage,
    required this.type,
  });

  TypeModel copyWith({
    String? title,
    String? placeholder,
    String? sourceImage,
    String? altImage,
    String? type,
  }) {
    return TypeModel(
      title: title ?? this.title,
      placeholder: placeholder ?? this.placeholder,
      sourceImage: sourceImage ?? this.sourceImage,
      altImage: altImage ?? this.altImage,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'placeholder': placeholder,
      'sourceImage': sourceImage,
      'altImage': altImage,
      'type': type,
    };
  }

  static List<String> feedbackTypes() =>
      listFeedbackTypes().map((e) => e.title).toList();

  static List<TypeModel> listFeedbackTypes() {
    Map<String, dynamic> feedbackMap = {
      "BUG": {
        "title": "Problema",
        "placeholder": "Algo não está funcionando bem? Queremos corrigir. "
            "Conte com detalhes o que está acontecendo...",
        "image": {
          "source": AppTheme.images.bug,
          "alt": "Imagem de um inseto",
        }
      },
      "IDEA": {
        "title": "Ideia",
        "placeholder": "Teve uma ideia de melhoria ou de nova funcionalidade? "
            "Conta pra gente!",
        "image": {
          "source": AppTheme.images.idea,
          "alt": "Imagem de uma lâmpada",
        }
      },
      "OTHER": {
        "title": "Outro",
        "placeholder": "Queremos te ouvir. O que você gostaria de nos dizer?",
        "image": {
          "source": AppTheme.images.thought,
          "alt": "Imagem de um balão de pensamento",
        }
      },
    };
    List<TypeModel> list = [];
    feedbackMap.forEach((key, value) {
      list.add(TypeModel.fromMapResponse(value, key));
    });
    return list;
  }

  factory TypeModel.fromMapResponse(Map<String, dynamic> map, String type) {
    return TypeModel(
      title: map['title'] ?? '',
      placeholder: map['placeholder'] ?? '',
      sourceImage: map['image']['source'] ?? '',
      altImage: map['image']['alt'] ?? '',
      type: type,
    );
  }

  factory TypeModel.fromMap(Map<String, dynamic> map) {
    return TypeModel(
      title: map['title'] ?? '',
      placeholder: map['placeholder'] ?? '',
      sourceImage: map['sourceImage'] ?? '',
      altImage: map['altImage'] ?? '',
      type: map['type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TypeModel.fromJson(String source) =>
      TypeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TypeModel(title: $title, placeholder: $placeholder, sourceImage: $sourceImage, altImage: $altImage, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TypeModel &&
        other.title == title &&
        other.placeholder == placeholder &&
        other.sourceImage == sourceImage &&
        other.altImage == altImage &&
        other.type == type;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        placeholder.hashCode ^
        sourceImage.hashCode ^
        altImage.hashCode ^
        type.hashCode;
  }
}
