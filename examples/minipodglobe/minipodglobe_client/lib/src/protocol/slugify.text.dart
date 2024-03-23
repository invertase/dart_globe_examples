/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class SlugifiedText extends _i1.SerializableEntity {
  SlugifiedText._({required this.slug});

  factory SlugifiedText({required String slug}) = _SlugifiedTextImpl;

  factory SlugifiedText.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return SlugifiedText(
        slug: serializationManager
            .deserialize<String>(jsonSerialization['slug']));
  }

  String slug;

  SlugifiedText copyWith({String? slug});
  @override
  Map<String, dynamic> toJson() {
    return {'slug': slug};
  }
}

class _SlugifiedTextImpl extends SlugifiedText {
  _SlugifiedTextImpl({required String slug}) : super._(slug: slug);

  @override
  SlugifiedText copyWith({String? slug}) {
    return SlugifiedText(slug: slug ?? this.slug);
  }
}
