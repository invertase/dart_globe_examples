/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class TextToSlugify extends _i1.SerializableEntity {
  TextToSlugify._({required this.text});

  factory TextToSlugify({required String text}) = _TextToSlugifyImpl;

  factory TextToSlugify.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return TextToSlugify(
        text: serializationManager
            .deserialize<String>(jsonSerialization['text']));
  }

  String text;

  TextToSlugify copyWith({String? text});
  @override
  Map<String, dynamic> toJson() {
    return {'text': text};
  }

  @override
  Map<String, dynamic> allToJson() {
    return {'text': text};
  }
}

class _TextToSlugifyImpl extends TextToSlugify {
  _TextToSlugifyImpl({required String text}) : super._(text: text);

  @override
  TextToSlugify copyWith({String? text}) {
    return TextToSlugify(text: text ?? this.text);
  }
}
