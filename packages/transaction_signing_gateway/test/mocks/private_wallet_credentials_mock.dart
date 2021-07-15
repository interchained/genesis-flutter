import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:transaction_signing_gateway/model/credentials_storage_failure.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials_serializer.dart';

class PrivateWalletCredentialsMock extends Equatable implements PrivateWalletCredentials {
  @override
  final String mnemonic;
  @override
  final String chainId;
  @override
  final String walletId;

  @override
  String get serializerIdentifier => TestPrivateCredentialsSerializer.sIdentifier;

  const PrivateWalletCredentialsMock({
    required this.mnemonic,
    required this.chainId,
    required this.walletId,
  });

  @override
  List<Object?> get props => [
        mnemonic,
        chainId,
        walletId,
        serializerIdentifier,
      ];
}

class TestPrivateCredentialsSerializer implements PrivateWalletCredentialsSerializer {
  static const String sIdentifier = "TestPrivateCredentialsSerializer";

  @override
  Either<CredentialsStorageFailure, PrivateWalletCredentials> fromJson(
    Map<String, dynamic> json,
  ) {
    try {
      return right(PrivateWalletCredentialsMock(
        chainId: json['chainId'] as String,
        walletId: json['walletId'] as String,
        mnemonic: json['mnemonic'] as String,
      ));
    } catch (e) {
      return left(CredentialsStorageFailure("could not parse json:\n$json"));
    }
  }

  @override
  String get identifier => sIdentifier;

  @override
  Either<CredentialsStorageFailure, Map<String, dynamic>> toJson(
    PrivateWalletCredentials credentials,
  ) =>
      right({
        'chainId': credentials.chainId,
        'walletId': credentials.walletId,
        'mnemonic': credentials.mnemonic,
      });
}