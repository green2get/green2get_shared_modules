part of '../api.dart';

abstract class _AuthRegexHelper {
  static final _appUserAnnouncementRegex = RegExp("\\/v1\\/app-user-announcement(${[
    r"\/history-detail\/\{.*\}",
  ].join('|')})");
  static final _barcodeRegex = RegExp("\\/v1\\/barcode(${[
    r"/\{.*\}",
    r"/\{.*\}\/barcodeRecycleItem",
    r"/\brand-barcode\/\{.*\}",
    r"/\userItemBarcodeRecycle\/\{.*\}",
  ].join('|')})");
  static final _heroRegex = RegExp("\\/v1\\/hero(${[r"\/my-rating\/\{.*\}"].join('|')})");
  static final _loginRegex = RegExp("\\/v1\\/login(${[
    r"\/user\/verifyEmail\/\{.*\}",
    r"\/user\/verifyUpdatePhoneNumber\/\{.*\}",
  ].join('|')})");
  static final _userRegex = RegExp("\\/v1\\/user(${[
    r"\/\{.*\}\/location",
    r"\/detail\/\{.*\}",
  ].join('|')})");

  static bool canAcquireAuth(String endpoint) {
    return _appUserAnnouncementRegex.hasMatch(endpoint) ||
        _barcodeRegex.hasMatch(endpoint) ||
        _heroRegex.hasMatch(endpoint) ||
        _loginRegex.hasMatch(endpoint) ||
        _userRegex.hasMatch(endpoint);
  }
}

bool _canAcquireAuthorization(String endpoint) {
  endpoint = endpoint.replaceFirst(RegExp(r'\/+$'), "");

  switch (endpoint) {
    case "/v1/app-user-announcement/on-announce":
    case "/v1/app-user-announcement/history":
    case "/v1/app-user-announcement/user-reject":
    case "/v1/app-user-announcement/user-accept":
    case "/v1/app-user-announcement/scan-hero-qr":
    case "/v1/app-user-announcement/confirm-scan-hero-qr":
    case "/v1/app-user-announcement":
    case "/v1/barcode/add":
    case "/v1/barcode/bookmark":
    case "/v1/barcode/bookmark/remove":
    case "/v1/barcode/barcodeRecycle":
    case "/v1/barcode/barcodeRecycleImage":
    case "/v1/barcode/detail":
    case "/v1/barcode/recycleComment":
    case "/v1/barcode/recycleReaction":
    case "/v1/barcode/v2/my-scan":
    case "/v1/barcode/my-recycle":
    case "/v1/barcode/no-exit-recycle":
    case "/v1/bin/recycling":
    case "/v1/brand-activity/ranking":
    case "/v1/brand-activity/brandActivityListByUser":
    case "/v1/hero/nearby":
    case "/v1/hero/rating":
    case "/v1/hero/suggest":
    case "/v1/hero/suggest/image":
    case "/v1/login":
    case "/v1/login/checkSession":
    case "/v1/login/logout":
    case "/v1/login/toDelete":
    case "/v1/login/user/change-password":
    case "/v1/login/user/chat-token":
    case "/v1/login/user/verifyEmail":
    case "/v1/login/user/verifyPhoneNumber":
    case "/v1/login/user/update":
    case "/v1/login/user/checkVerifyPhoneNumber":
    case "/v1/notification/user":
    case "/v1/notification/user/config":
    case "/v1/notification/user/config/list":
    case "/v1/notification/user/history":
    case "/v1/notification/user/read":
    case "/v1/product/bookmark":
    case "/v1/product/updateLike":
    case "/v1/rank/top-10":
    case "/v1/rank/top-10/monthly-rank":
    case "/v1/recycle/by-barcode":
    case "/v1/recycle/by-barcode-material":
    case "/v1/recycle/by-material":
    case "/v1/recycle/by-materialList":
    case "/v1/recycle/delete-transaction":
    case "/v1/recycle/my-bill":
    case "/v1/recycle/my-recycle-material":
    case "/v1/recycle/scan-hero-qr":
    case "/v1/recycle/confirm-scan-hero-qr":
    case "/v1/recycle/brand-scan-hero-qr":
    case "/v1/recycle/barcode-scan-hero-qr":
    case "/v1/recycle/barcode-confirm-scan-hero-qr":
    case "/v1/reward/createAddress":
    case "/v1/reward/redeemHistory":
    case "/v1/reward/redeemReward":
    case "/v1/reward/updateAddress":
    case "/v1/reward/userAddress":
    case "/v1/user/all":
    case "/v1/user/existing":
    case "/v1/user/image-document":
    case "/v1/user/image-idcard":
    case "/v1/user/image-profile":
    case "/v1/user/info":
    case "/v1/user/location":
    case "/v1/user/me":
    case "/v1/user/reset-password":
    case "/v1/user/search-by-name":
    case "/v1/user/update-profile":
    case "/v1/user/user-image-document":
      return true;
    default:
      return _AuthRegexHelper.canAcquireAuth(endpoint);
  }
}
