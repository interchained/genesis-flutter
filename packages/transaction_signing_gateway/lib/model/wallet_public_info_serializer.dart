import "package:transaction_signing_gateway/model/wallet_public_info.dart";

class WalletPublicInfoSerializer {
  static const _nameKey = "name";
  static const _chainIdKey = "chain_id";
  static const _publicAddressKey = "public_address";
  static const _walletIdKey = "wallet_Id";

  static WalletPublicInfo fromMap(Map<String, dynamic> map) {
    return WalletPublicInfo(
      name: map[_nameKey] as String,
      publicAddress: map[_publicAddressKey] as String,
      walletId: map[_walletIdKey] as String,
      chainId: map[_chainIdKey] as String,
    );
  }

  static Map<String, dynamic> toMap(WalletPublicInfo info) {
    return {
      _nameKey: info.name,
      _publicAddressKey: info.publicAddress,
      _walletIdKey: info.walletId,
      _chainIdKey: info.chainId,
    };
  }
}
