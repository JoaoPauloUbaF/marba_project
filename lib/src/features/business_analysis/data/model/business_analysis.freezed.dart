// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_analysis.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BusinessAnalysis _$BusinessAnalysisFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'cpf':
      return CPFBusiness.fromJson(json);
    case 'mei':
      return MEIBusiness.fromJson(json);
    case 'cnpj':
      return CNPJBusiness.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'BusinessAnalysis',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$BusinessAnalysis {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String fullName,
            String cpf,
            String personalId,
            String address,
            String contactPhone,
            String email,
            String cpfPhotoUrl,
            String personalIdImageUrl,
            String residenceProofUrl,
            String statusCpf)
        cpf,
    required TResult Function(
            String id,
            String meiFullName,
            String cnpj,
            String address,
            String phoneNumber,
            String email,
            String meiCnpjPhotoURL,
            String residenceProofUrl,
            String debtCertificateUrl,
            String statusMei)
        mei,
    required TResult Function(
            String id,
            String companyName,
            String cnpj,
            String businessAddress,
            String businessContactPhone,
            String email,
            String cnpjPhotoUrl,
            String stateRegistrationPhotoUrl,
            String cityRegistrationImageUrl,
            String businessAddressProofUrl,
            String taxDebtsCertUrl,
            String statusCnpj)
        cnpj,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String fullName,
            String cpf,
            String personalId,
            String address,
            String contactPhone,
            String email,
            String cpfPhotoUrl,
            String personalIdImageUrl,
            String residenceProofUrl,
            String statusCpf)?
        cpf,
    TResult? Function(
            String id,
            String meiFullName,
            String cnpj,
            String address,
            String phoneNumber,
            String email,
            String meiCnpjPhotoURL,
            String residenceProofUrl,
            String debtCertificateUrl,
            String statusMei)?
        mei,
    TResult? Function(
            String id,
            String companyName,
            String cnpj,
            String businessAddress,
            String businessContactPhone,
            String email,
            String cnpjPhotoUrl,
            String stateRegistrationPhotoUrl,
            String cityRegistrationImageUrl,
            String businessAddressProofUrl,
            String taxDebtsCertUrl,
            String statusCnpj)?
        cnpj,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String fullName,
            String cpf,
            String personalId,
            String address,
            String contactPhone,
            String email,
            String cpfPhotoUrl,
            String personalIdImageUrl,
            String residenceProofUrl,
            String statusCpf)?
        cpf,
    TResult Function(
            String id,
            String meiFullName,
            String cnpj,
            String address,
            String phoneNumber,
            String email,
            String meiCnpjPhotoURL,
            String residenceProofUrl,
            String debtCertificateUrl,
            String statusMei)?
        mei,
    TResult Function(
            String id,
            String companyName,
            String cnpj,
            String businessAddress,
            String businessContactPhone,
            String email,
            String cnpjPhotoUrl,
            String stateRegistrationPhotoUrl,
            String cityRegistrationImageUrl,
            String businessAddressProofUrl,
            String taxDebtsCertUrl,
            String statusCnpj)?
        cnpj,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CPFBusiness value) cpf,
    required TResult Function(MEIBusiness value) mei,
    required TResult Function(CNPJBusiness value) cnpj,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CPFBusiness value)? cpf,
    TResult? Function(MEIBusiness value)? mei,
    TResult? Function(CNPJBusiness value)? cnpj,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CPFBusiness value)? cpf,
    TResult Function(MEIBusiness value)? mei,
    TResult Function(CNPJBusiness value)? cnpj,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this BusinessAnalysis to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BusinessAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BusinessAnalysisCopyWith<BusinessAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessAnalysisCopyWith<$Res> {
  factory $BusinessAnalysisCopyWith(
          BusinessAnalysis value, $Res Function(BusinessAnalysis) then) =
      _$BusinessAnalysisCopyWithImpl<$Res, BusinessAnalysis>;
  @useResult
  $Res call({String id, String email});
}

/// @nodoc
class _$BusinessAnalysisCopyWithImpl<$Res, $Val extends BusinessAnalysis>
    implements $BusinessAnalysisCopyWith<$Res> {
  _$BusinessAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BusinessAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CPFBusinessImplCopyWith<$Res>
    implements $BusinessAnalysisCopyWith<$Res> {
  factory _$$CPFBusinessImplCopyWith(
          _$CPFBusinessImpl value, $Res Function(_$CPFBusinessImpl) then) =
      __$$CPFBusinessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String fullName,
      String cpf,
      String personalId,
      String address,
      String contactPhone,
      String email,
      String cpfPhotoUrl,
      String personalIdImageUrl,
      String residenceProofUrl,
      String statusCpf});
}

/// @nodoc
class __$$CPFBusinessImplCopyWithImpl<$Res>
    extends _$BusinessAnalysisCopyWithImpl<$Res, _$CPFBusinessImpl>
    implements _$$CPFBusinessImplCopyWith<$Res> {
  __$$CPFBusinessImplCopyWithImpl(
      _$CPFBusinessImpl _value, $Res Function(_$CPFBusinessImpl) _then)
      : super(_value, _then);

  /// Create a copy of BusinessAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? cpf = null,
    Object? personalId = null,
    Object? address = null,
    Object? contactPhone = null,
    Object? email = null,
    Object? cpfPhotoUrl = null,
    Object? personalIdImageUrl = null,
    Object? residenceProofUrl = null,
    Object? statusCpf = null,
  }) {
    return _then(_$CPFBusinessImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      cpf: null == cpf
          ? _value.cpf
          : cpf // ignore: cast_nullable_to_non_nullable
              as String,
      personalId: null == personalId
          ? _value.personalId
          : personalId // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      contactPhone: null == contactPhone
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      cpfPhotoUrl: null == cpfPhotoUrl
          ? _value.cpfPhotoUrl
          : cpfPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      personalIdImageUrl: null == personalIdImageUrl
          ? _value.personalIdImageUrl
          : personalIdImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      residenceProofUrl: null == residenceProofUrl
          ? _value.residenceProofUrl
          : residenceProofUrl // ignore: cast_nullable_to_non_nullable
              as String,
      statusCpf: null == statusCpf
          ? _value.statusCpf
          : statusCpf // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CPFBusinessImpl implements CPFBusiness {
  const _$CPFBusinessImpl(
      {required this.id,
      required this.fullName,
      required this.cpf,
      required this.personalId,
      required this.address,
      required this.contactPhone,
      required this.email,
      required this.cpfPhotoUrl,
      required this.personalIdImageUrl,
      required this.residenceProofUrl,
      required this.statusCpf,
      final String? $type})
      : $type = $type ?? 'cpf';

  factory _$CPFBusinessImpl.fromJson(Map<String, dynamic> json) =>
      _$$CPFBusinessImplFromJson(json);

  @override
  final String id;
  @override
  final String fullName;
  @override
  final String cpf;
  @override
  final String personalId;
  @override
  final String address;
  @override
  final String contactPhone;
  @override
  final String email;
  @override
  final String cpfPhotoUrl;
  @override
  final String personalIdImageUrl;
  @override
  final String residenceProofUrl;
  @override
  final String statusCpf;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'BusinessAnalysis.cpf(id: $id, fullName: $fullName, cpf: $cpf, personalId: $personalId, address: $address, contactPhone: $contactPhone, email: $email, cpfPhotoUrl: $cpfPhotoUrl, personalIdImageUrl: $personalIdImageUrl, residenceProofUrl: $residenceProofUrl, statusCpf: $statusCpf)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CPFBusinessImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.cpf, cpf) || other.cpf == cpf) &&
            (identical(other.personalId, personalId) ||
                other.personalId == personalId) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.contactPhone, contactPhone) ||
                other.contactPhone == contactPhone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.cpfPhotoUrl, cpfPhotoUrl) ||
                other.cpfPhotoUrl == cpfPhotoUrl) &&
            (identical(other.personalIdImageUrl, personalIdImageUrl) ||
                other.personalIdImageUrl == personalIdImageUrl) &&
            (identical(other.residenceProofUrl, residenceProofUrl) ||
                other.residenceProofUrl == residenceProofUrl) &&
            (identical(other.statusCpf, statusCpf) ||
                other.statusCpf == statusCpf));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      fullName,
      cpf,
      personalId,
      address,
      contactPhone,
      email,
      cpfPhotoUrl,
      personalIdImageUrl,
      residenceProofUrl,
      statusCpf);

  /// Create a copy of BusinessAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CPFBusinessImplCopyWith<_$CPFBusinessImpl> get copyWith =>
      __$$CPFBusinessImplCopyWithImpl<_$CPFBusinessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String fullName,
            String cpf,
            String personalId,
            String address,
            String contactPhone,
            String email,
            String cpfPhotoUrl,
            String personalIdImageUrl,
            String residenceProofUrl,
            String statusCpf)
        cpf,
    required TResult Function(
            String id,
            String meiFullName,
            String cnpj,
            String address,
            String phoneNumber,
            String email,
            String meiCnpjPhotoURL,
            String residenceProofUrl,
            String debtCertificateUrl,
            String statusMei)
        mei,
    required TResult Function(
            String id,
            String companyName,
            String cnpj,
            String businessAddress,
            String businessContactPhone,
            String email,
            String cnpjPhotoUrl,
            String stateRegistrationPhotoUrl,
            String cityRegistrationImageUrl,
            String businessAddressProofUrl,
            String taxDebtsCertUrl,
            String statusCnpj)
        cnpj,
  }) {
    return cpf(id, fullName, this.cpf, personalId, address, contactPhone, email,
        cpfPhotoUrl, personalIdImageUrl, residenceProofUrl, statusCpf);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String fullName,
            String cpf,
            String personalId,
            String address,
            String contactPhone,
            String email,
            String cpfPhotoUrl,
            String personalIdImageUrl,
            String residenceProofUrl,
            String statusCpf)?
        cpf,
    TResult? Function(
            String id,
            String meiFullName,
            String cnpj,
            String address,
            String phoneNumber,
            String email,
            String meiCnpjPhotoURL,
            String residenceProofUrl,
            String debtCertificateUrl,
            String statusMei)?
        mei,
    TResult? Function(
            String id,
            String companyName,
            String cnpj,
            String businessAddress,
            String businessContactPhone,
            String email,
            String cnpjPhotoUrl,
            String stateRegistrationPhotoUrl,
            String cityRegistrationImageUrl,
            String businessAddressProofUrl,
            String taxDebtsCertUrl,
            String statusCnpj)?
        cnpj,
  }) {
    return cpf?.call(id, fullName, this.cpf, personalId, address, contactPhone,
        email, cpfPhotoUrl, personalIdImageUrl, residenceProofUrl, statusCpf);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String fullName,
            String cpf,
            String personalId,
            String address,
            String contactPhone,
            String email,
            String cpfPhotoUrl,
            String personalIdImageUrl,
            String residenceProofUrl,
            String statusCpf)?
        cpf,
    TResult Function(
            String id,
            String meiFullName,
            String cnpj,
            String address,
            String phoneNumber,
            String email,
            String meiCnpjPhotoURL,
            String residenceProofUrl,
            String debtCertificateUrl,
            String statusMei)?
        mei,
    TResult Function(
            String id,
            String companyName,
            String cnpj,
            String businessAddress,
            String businessContactPhone,
            String email,
            String cnpjPhotoUrl,
            String stateRegistrationPhotoUrl,
            String cityRegistrationImageUrl,
            String businessAddressProofUrl,
            String taxDebtsCertUrl,
            String statusCnpj)?
        cnpj,
    required TResult orElse(),
  }) {
    if (cpf != null) {
      return cpf(id, fullName, this.cpf, personalId, address, contactPhone,
          email, cpfPhotoUrl, personalIdImageUrl, residenceProofUrl, statusCpf);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CPFBusiness value) cpf,
    required TResult Function(MEIBusiness value) mei,
    required TResult Function(CNPJBusiness value) cnpj,
  }) {
    return cpf(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CPFBusiness value)? cpf,
    TResult? Function(MEIBusiness value)? mei,
    TResult? Function(CNPJBusiness value)? cnpj,
  }) {
    return cpf?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CPFBusiness value)? cpf,
    TResult Function(MEIBusiness value)? mei,
    TResult Function(CNPJBusiness value)? cnpj,
    required TResult orElse(),
  }) {
    if (cpf != null) {
      return cpf(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CPFBusinessImplToJson(
      this,
    );
  }
}

abstract class CPFBusiness implements BusinessAnalysis {
  const factory CPFBusiness(
      {required final String id,
      required final String fullName,
      required final String cpf,
      required final String personalId,
      required final String address,
      required final String contactPhone,
      required final String email,
      required final String cpfPhotoUrl,
      required final String personalIdImageUrl,
      required final String residenceProofUrl,
      required final String statusCpf}) = _$CPFBusinessImpl;

  factory CPFBusiness.fromJson(Map<String, dynamic> json) =
      _$CPFBusinessImpl.fromJson;

  @override
  String get id;
  String get fullName;
  String get cpf;
  String get personalId;
  String get address;
  String get contactPhone;
  @override
  String get email;
  String get cpfPhotoUrl;
  String get personalIdImageUrl;
  String get residenceProofUrl;
  String get statusCpf;

  /// Create a copy of BusinessAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CPFBusinessImplCopyWith<_$CPFBusinessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MEIBusinessImplCopyWith<$Res>
    implements $BusinessAnalysisCopyWith<$Res> {
  factory _$$MEIBusinessImplCopyWith(
          _$MEIBusinessImpl value, $Res Function(_$MEIBusinessImpl) then) =
      __$$MEIBusinessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String meiFullName,
      String cnpj,
      String address,
      String phoneNumber,
      String email,
      String meiCnpjPhotoURL,
      String residenceProofUrl,
      String debtCertificateUrl,
      String statusMei});
}

/// @nodoc
class __$$MEIBusinessImplCopyWithImpl<$Res>
    extends _$BusinessAnalysisCopyWithImpl<$Res, _$MEIBusinessImpl>
    implements _$$MEIBusinessImplCopyWith<$Res> {
  __$$MEIBusinessImplCopyWithImpl(
      _$MEIBusinessImpl _value, $Res Function(_$MEIBusinessImpl) _then)
      : super(_value, _then);

  /// Create a copy of BusinessAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? meiFullName = null,
    Object? cnpj = null,
    Object? address = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? meiCnpjPhotoURL = null,
    Object? residenceProofUrl = null,
    Object? debtCertificateUrl = null,
    Object? statusMei = null,
  }) {
    return _then(_$MEIBusinessImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      meiFullName: null == meiFullName
          ? _value.meiFullName
          : meiFullName // ignore: cast_nullable_to_non_nullable
              as String,
      cnpj: null == cnpj
          ? _value.cnpj
          : cnpj // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      meiCnpjPhotoURL: null == meiCnpjPhotoURL
          ? _value.meiCnpjPhotoURL
          : meiCnpjPhotoURL // ignore: cast_nullable_to_non_nullable
              as String,
      residenceProofUrl: null == residenceProofUrl
          ? _value.residenceProofUrl
          : residenceProofUrl // ignore: cast_nullable_to_non_nullable
              as String,
      debtCertificateUrl: null == debtCertificateUrl
          ? _value.debtCertificateUrl
          : debtCertificateUrl // ignore: cast_nullable_to_non_nullable
              as String,
      statusMei: null == statusMei
          ? _value.statusMei
          : statusMei // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MEIBusinessImpl implements MEIBusiness {
  const _$MEIBusinessImpl(
      {required this.id,
      required this.meiFullName,
      required this.cnpj,
      required this.address,
      required this.phoneNumber,
      required this.email,
      required this.meiCnpjPhotoURL,
      required this.residenceProofUrl,
      required this.debtCertificateUrl,
      required this.statusMei,
      final String? $type})
      : $type = $type ?? 'mei';

  factory _$MEIBusinessImpl.fromJson(Map<String, dynamic> json) =>
      _$$MEIBusinessImplFromJson(json);

  @override
  final String id;
  @override
  final String meiFullName;
  @override
  final String cnpj;
  @override
  final String address;
  @override
  final String phoneNumber;
  @override
  final String email;
  @override
  final String meiCnpjPhotoURL;
  @override
  final String residenceProofUrl;
  @override
  final String debtCertificateUrl;
  @override
  final String statusMei;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'BusinessAnalysis.mei(id: $id, meiFullName: $meiFullName, cnpj: $cnpj, address: $address, phoneNumber: $phoneNumber, email: $email, meiCnpjPhotoURL: $meiCnpjPhotoURL, residenceProofUrl: $residenceProofUrl, debtCertificateUrl: $debtCertificateUrl, statusMei: $statusMei)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MEIBusinessImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.meiFullName, meiFullName) ||
                other.meiFullName == meiFullName) &&
            (identical(other.cnpj, cnpj) || other.cnpj == cnpj) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.meiCnpjPhotoURL, meiCnpjPhotoURL) ||
                other.meiCnpjPhotoURL == meiCnpjPhotoURL) &&
            (identical(other.residenceProofUrl, residenceProofUrl) ||
                other.residenceProofUrl == residenceProofUrl) &&
            (identical(other.debtCertificateUrl, debtCertificateUrl) ||
                other.debtCertificateUrl == debtCertificateUrl) &&
            (identical(other.statusMei, statusMei) ||
                other.statusMei == statusMei));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      meiFullName,
      cnpj,
      address,
      phoneNumber,
      email,
      meiCnpjPhotoURL,
      residenceProofUrl,
      debtCertificateUrl,
      statusMei);

  /// Create a copy of BusinessAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MEIBusinessImplCopyWith<_$MEIBusinessImpl> get copyWith =>
      __$$MEIBusinessImplCopyWithImpl<_$MEIBusinessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String fullName,
            String cpf,
            String personalId,
            String address,
            String contactPhone,
            String email,
            String cpfPhotoUrl,
            String personalIdImageUrl,
            String residenceProofUrl,
            String statusCpf)
        cpf,
    required TResult Function(
            String id,
            String meiFullName,
            String cnpj,
            String address,
            String phoneNumber,
            String email,
            String meiCnpjPhotoURL,
            String residenceProofUrl,
            String debtCertificateUrl,
            String statusMei)
        mei,
    required TResult Function(
            String id,
            String companyName,
            String cnpj,
            String businessAddress,
            String businessContactPhone,
            String email,
            String cnpjPhotoUrl,
            String stateRegistrationPhotoUrl,
            String cityRegistrationImageUrl,
            String businessAddressProofUrl,
            String taxDebtsCertUrl,
            String statusCnpj)
        cnpj,
  }) {
    return mei(id, meiFullName, this.cnpj, address, phoneNumber, email,
        meiCnpjPhotoURL, residenceProofUrl, debtCertificateUrl, statusMei);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String fullName,
            String cpf,
            String personalId,
            String address,
            String contactPhone,
            String email,
            String cpfPhotoUrl,
            String personalIdImageUrl,
            String residenceProofUrl,
            String statusCpf)?
        cpf,
    TResult? Function(
            String id,
            String meiFullName,
            String cnpj,
            String address,
            String phoneNumber,
            String email,
            String meiCnpjPhotoURL,
            String residenceProofUrl,
            String debtCertificateUrl,
            String statusMei)?
        mei,
    TResult? Function(
            String id,
            String companyName,
            String cnpj,
            String businessAddress,
            String businessContactPhone,
            String email,
            String cnpjPhotoUrl,
            String stateRegistrationPhotoUrl,
            String cityRegistrationImageUrl,
            String businessAddressProofUrl,
            String taxDebtsCertUrl,
            String statusCnpj)?
        cnpj,
  }) {
    return mei?.call(id, meiFullName, this.cnpj, address, phoneNumber, email,
        meiCnpjPhotoURL, residenceProofUrl, debtCertificateUrl, statusMei);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String fullName,
            String cpf,
            String personalId,
            String address,
            String contactPhone,
            String email,
            String cpfPhotoUrl,
            String personalIdImageUrl,
            String residenceProofUrl,
            String statusCpf)?
        cpf,
    TResult Function(
            String id,
            String meiFullName,
            String cnpj,
            String address,
            String phoneNumber,
            String email,
            String meiCnpjPhotoURL,
            String residenceProofUrl,
            String debtCertificateUrl,
            String statusMei)?
        mei,
    TResult Function(
            String id,
            String companyName,
            String cnpj,
            String businessAddress,
            String businessContactPhone,
            String email,
            String cnpjPhotoUrl,
            String stateRegistrationPhotoUrl,
            String cityRegistrationImageUrl,
            String businessAddressProofUrl,
            String taxDebtsCertUrl,
            String statusCnpj)?
        cnpj,
    required TResult orElse(),
  }) {
    if (mei != null) {
      return mei(id, meiFullName, this.cnpj, address, phoneNumber, email,
          meiCnpjPhotoURL, residenceProofUrl, debtCertificateUrl, statusMei);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CPFBusiness value) cpf,
    required TResult Function(MEIBusiness value) mei,
    required TResult Function(CNPJBusiness value) cnpj,
  }) {
    return mei(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CPFBusiness value)? cpf,
    TResult? Function(MEIBusiness value)? mei,
    TResult? Function(CNPJBusiness value)? cnpj,
  }) {
    return mei?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CPFBusiness value)? cpf,
    TResult Function(MEIBusiness value)? mei,
    TResult Function(CNPJBusiness value)? cnpj,
    required TResult orElse(),
  }) {
    if (mei != null) {
      return mei(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MEIBusinessImplToJson(
      this,
    );
  }
}

abstract class MEIBusiness implements BusinessAnalysis {
  const factory MEIBusiness(
      {required final String id,
      required final String meiFullName,
      required final String cnpj,
      required final String address,
      required final String phoneNumber,
      required final String email,
      required final String meiCnpjPhotoURL,
      required final String residenceProofUrl,
      required final String debtCertificateUrl,
      required final String statusMei}) = _$MEIBusinessImpl;

  factory MEIBusiness.fromJson(Map<String, dynamic> json) =
      _$MEIBusinessImpl.fromJson;

  @override
  String get id;
  String get meiFullName;
  String get cnpj;
  String get address;
  String get phoneNumber;
  @override
  String get email;
  String get meiCnpjPhotoURL;
  String get residenceProofUrl;
  String get debtCertificateUrl;
  String get statusMei;

  /// Create a copy of BusinessAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MEIBusinessImplCopyWith<_$MEIBusinessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CNPJBusinessImplCopyWith<$Res>
    implements $BusinessAnalysisCopyWith<$Res> {
  factory _$$CNPJBusinessImplCopyWith(
          _$CNPJBusinessImpl value, $Res Function(_$CNPJBusinessImpl) then) =
      __$$CNPJBusinessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String companyName,
      String cnpj,
      String businessAddress,
      String businessContactPhone,
      String email,
      String cnpjPhotoUrl,
      String stateRegistrationPhotoUrl,
      String cityRegistrationImageUrl,
      String businessAddressProofUrl,
      String taxDebtsCertUrl,
      String statusCnpj});
}

/// @nodoc
class __$$CNPJBusinessImplCopyWithImpl<$Res>
    extends _$BusinessAnalysisCopyWithImpl<$Res, _$CNPJBusinessImpl>
    implements _$$CNPJBusinessImplCopyWith<$Res> {
  __$$CNPJBusinessImplCopyWithImpl(
      _$CNPJBusinessImpl _value, $Res Function(_$CNPJBusinessImpl) _then)
      : super(_value, _then);

  /// Create a copy of BusinessAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? companyName = null,
    Object? cnpj = null,
    Object? businessAddress = null,
    Object? businessContactPhone = null,
    Object? email = null,
    Object? cnpjPhotoUrl = null,
    Object? stateRegistrationPhotoUrl = null,
    Object? cityRegistrationImageUrl = null,
    Object? businessAddressProofUrl = null,
    Object? taxDebtsCertUrl = null,
    Object? statusCnpj = null,
  }) {
    return _then(_$CNPJBusinessImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      cnpj: null == cnpj
          ? _value.cnpj
          : cnpj // ignore: cast_nullable_to_non_nullable
              as String,
      businessAddress: null == businessAddress
          ? _value.businessAddress
          : businessAddress // ignore: cast_nullable_to_non_nullable
              as String,
      businessContactPhone: null == businessContactPhone
          ? _value.businessContactPhone
          : businessContactPhone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      cnpjPhotoUrl: null == cnpjPhotoUrl
          ? _value.cnpjPhotoUrl
          : cnpjPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      stateRegistrationPhotoUrl: null == stateRegistrationPhotoUrl
          ? _value.stateRegistrationPhotoUrl
          : stateRegistrationPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      cityRegistrationImageUrl: null == cityRegistrationImageUrl
          ? _value.cityRegistrationImageUrl
          : cityRegistrationImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      businessAddressProofUrl: null == businessAddressProofUrl
          ? _value.businessAddressProofUrl
          : businessAddressProofUrl // ignore: cast_nullable_to_non_nullable
              as String,
      taxDebtsCertUrl: null == taxDebtsCertUrl
          ? _value.taxDebtsCertUrl
          : taxDebtsCertUrl // ignore: cast_nullable_to_non_nullable
              as String,
      statusCnpj: null == statusCnpj
          ? _value.statusCnpj
          : statusCnpj // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CNPJBusinessImpl implements CNPJBusiness {
  const _$CNPJBusinessImpl(
      {required this.id,
      required this.companyName,
      required this.cnpj,
      required this.businessAddress,
      required this.businessContactPhone,
      required this.email,
      required this.cnpjPhotoUrl,
      required this.stateRegistrationPhotoUrl,
      required this.cityRegistrationImageUrl,
      required this.businessAddressProofUrl,
      required this.taxDebtsCertUrl,
      required this.statusCnpj,
      final String? $type})
      : $type = $type ?? 'cnpj';

  factory _$CNPJBusinessImpl.fromJson(Map<String, dynamic> json) =>
      _$$CNPJBusinessImplFromJson(json);

  @override
  final String id;
  @override
  final String companyName;
  @override
  final String cnpj;
  @override
  final String businessAddress;
  @override
  final String businessContactPhone;
  @override
  final String email;
  @override
  final String cnpjPhotoUrl;
  @override
  final String stateRegistrationPhotoUrl;
  @override
  final String cityRegistrationImageUrl;
  @override
  final String businessAddressProofUrl;
  @override
  final String taxDebtsCertUrl;
  @override
  final String statusCnpj;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'BusinessAnalysis.cnpj(id: $id, companyName: $companyName, cnpj: $cnpj, businessAddress: $businessAddress, businessContactPhone: $businessContactPhone, email: $email, cnpjPhotoUrl: $cnpjPhotoUrl, stateRegistrationPhotoUrl: $stateRegistrationPhotoUrl, cityRegistrationImageUrl: $cityRegistrationImageUrl, businessAddressProofUrl: $businessAddressProofUrl, taxDebtsCertUrl: $taxDebtsCertUrl, statusCnpj: $statusCnpj)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CNPJBusinessImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.cnpj, cnpj) || other.cnpj == cnpj) &&
            (identical(other.businessAddress, businessAddress) ||
                other.businessAddress == businessAddress) &&
            (identical(other.businessContactPhone, businessContactPhone) ||
                other.businessContactPhone == businessContactPhone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.cnpjPhotoUrl, cnpjPhotoUrl) ||
                other.cnpjPhotoUrl == cnpjPhotoUrl) &&
            (identical(other.stateRegistrationPhotoUrl,
                    stateRegistrationPhotoUrl) ||
                other.stateRegistrationPhotoUrl == stateRegistrationPhotoUrl) &&
            (identical(
                    other.cityRegistrationImageUrl, cityRegistrationImageUrl) ||
                other.cityRegistrationImageUrl == cityRegistrationImageUrl) &&
            (identical(
                    other.businessAddressProofUrl, businessAddressProofUrl) ||
                other.businessAddressProofUrl == businessAddressProofUrl) &&
            (identical(other.taxDebtsCertUrl, taxDebtsCertUrl) ||
                other.taxDebtsCertUrl == taxDebtsCertUrl) &&
            (identical(other.statusCnpj, statusCnpj) ||
                other.statusCnpj == statusCnpj));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      companyName,
      cnpj,
      businessAddress,
      businessContactPhone,
      email,
      cnpjPhotoUrl,
      stateRegistrationPhotoUrl,
      cityRegistrationImageUrl,
      businessAddressProofUrl,
      taxDebtsCertUrl,
      statusCnpj);

  /// Create a copy of BusinessAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CNPJBusinessImplCopyWith<_$CNPJBusinessImpl> get copyWith =>
      __$$CNPJBusinessImplCopyWithImpl<_$CNPJBusinessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String fullName,
            String cpf,
            String personalId,
            String address,
            String contactPhone,
            String email,
            String cpfPhotoUrl,
            String personalIdImageUrl,
            String residenceProofUrl,
            String statusCpf)
        cpf,
    required TResult Function(
            String id,
            String meiFullName,
            String cnpj,
            String address,
            String phoneNumber,
            String email,
            String meiCnpjPhotoURL,
            String residenceProofUrl,
            String debtCertificateUrl,
            String statusMei)
        mei,
    required TResult Function(
            String id,
            String companyName,
            String cnpj,
            String businessAddress,
            String businessContactPhone,
            String email,
            String cnpjPhotoUrl,
            String stateRegistrationPhotoUrl,
            String cityRegistrationImageUrl,
            String businessAddressProofUrl,
            String taxDebtsCertUrl,
            String statusCnpj)
        cnpj,
  }) {
    return cnpj(
        id,
        companyName,
        this.cnpj,
        businessAddress,
        businessContactPhone,
        email,
        cnpjPhotoUrl,
        stateRegistrationPhotoUrl,
        cityRegistrationImageUrl,
        businessAddressProofUrl,
        taxDebtsCertUrl,
        statusCnpj);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String fullName,
            String cpf,
            String personalId,
            String address,
            String contactPhone,
            String email,
            String cpfPhotoUrl,
            String personalIdImageUrl,
            String residenceProofUrl,
            String statusCpf)?
        cpf,
    TResult? Function(
            String id,
            String meiFullName,
            String cnpj,
            String address,
            String phoneNumber,
            String email,
            String meiCnpjPhotoURL,
            String residenceProofUrl,
            String debtCertificateUrl,
            String statusMei)?
        mei,
    TResult? Function(
            String id,
            String companyName,
            String cnpj,
            String businessAddress,
            String businessContactPhone,
            String email,
            String cnpjPhotoUrl,
            String stateRegistrationPhotoUrl,
            String cityRegistrationImageUrl,
            String businessAddressProofUrl,
            String taxDebtsCertUrl,
            String statusCnpj)?
        cnpj,
  }) {
    return cnpj?.call(
        id,
        companyName,
        this.cnpj,
        businessAddress,
        businessContactPhone,
        email,
        cnpjPhotoUrl,
        stateRegistrationPhotoUrl,
        cityRegistrationImageUrl,
        businessAddressProofUrl,
        taxDebtsCertUrl,
        statusCnpj);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String fullName,
            String cpf,
            String personalId,
            String address,
            String contactPhone,
            String email,
            String cpfPhotoUrl,
            String personalIdImageUrl,
            String residenceProofUrl,
            String statusCpf)?
        cpf,
    TResult Function(
            String id,
            String meiFullName,
            String cnpj,
            String address,
            String phoneNumber,
            String email,
            String meiCnpjPhotoURL,
            String residenceProofUrl,
            String debtCertificateUrl,
            String statusMei)?
        mei,
    TResult Function(
            String id,
            String companyName,
            String cnpj,
            String businessAddress,
            String businessContactPhone,
            String email,
            String cnpjPhotoUrl,
            String stateRegistrationPhotoUrl,
            String cityRegistrationImageUrl,
            String businessAddressProofUrl,
            String taxDebtsCertUrl,
            String statusCnpj)?
        cnpj,
    required TResult orElse(),
  }) {
    if (cnpj != null) {
      return cnpj(
          id,
          companyName,
          this.cnpj,
          businessAddress,
          businessContactPhone,
          email,
          cnpjPhotoUrl,
          stateRegistrationPhotoUrl,
          cityRegistrationImageUrl,
          businessAddressProofUrl,
          taxDebtsCertUrl,
          statusCnpj);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CPFBusiness value) cpf,
    required TResult Function(MEIBusiness value) mei,
    required TResult Function(CNPJBusiness value) cnpj,
  }) {
    return cnpj(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CPFBusiness value)? cpf,
    TResult? Function(MEIBusiness value)? mei,
    TResult? Function(CNPJBusiness value)? cnpj,
  }) {
    return cnpj?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CPFBusiness value)? cpf,
    TResult Function(MEIBusiness value)? mei,
    TResult Function(CNPJBusiness value)? cnpj,
    required TResult orElse(),
  }) {
    if (cnpj != null) {
      return cnpj(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CNPJBusinessImplToJson(
      this,
    );
  }
}

abstract class CNPJBusiness implements BusinessAnalysis {
  const factory CNPJBusiness(
      {required final String id,
      required final String companyName,
      required final String cnpj,
      required final String businessAddress,
      required final String businessContactPhone,
      required final String email,
      required final String cnpjPhotoUrl,
      required final String stateRegistrationPhotoUrl,
      required final String cityRegistrationImageUrl,
      required final String businessAddressProofUrl,
      required final String taxDebtsCertUrl,
      required final String statusCnpj}) = _$CNPJBusinessImpl;

  factory CNPJBusiness.fromJson(Map<String, dynamic> json) =
      _$CNPJBusinessImpl.fromJson;

  @override
  String get id;
  String get companyName;
  String get cnpj;
  String get businessAddress;
  String get businessContactPhone;
  @override
  String get email;
  String get cnpjPhotoUrl;
  String get stateRegistrationPhotoUrl;
  String get cityRegistrationImageUrl;
  String get businessAddressProofUrl;
  String get taxDebtsCertUrl;
  String get statusCnpj;

  /// Create a copy of BusinessAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CNPJBusinessImplCopyWith<_$CNPJBusinessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
