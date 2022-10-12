// RNKakaoLogins.m

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RNKakaoLogins, NSObject)

RCT_EXTERN_METHOD(login:(RCTPromiseResolveBlock *)resolve rejecter:(RCTPromiseRejectBlock *)reject);
RCT_EXTERN_METHOD(loginWithKakaoAccount:(RCTPromiseResolveBlock *)resolve rejecter:(RCTPromiseRejectBlock *)reject);
RCT_EXTERN_METHOD(logout:(RCTPromiseResolveBlock *)resolve rejecter:(RCTPromiseRejectBlock *)reject);
RCT_EXTERN_METHOD(unlink:(RCTPromiseResolveBlock *)resolve rejecter:(RCTPromiseRejectBlock *)reject);
RCT_EXTERN_METHOD(getProfile:(RCTPromiseResolveBlock *)resolve rejecter:(RCTPromiseRejectBlock *)reject);
RCT_EXTERN_METHOD(getAccessToken:(RCTPromiseResolveBlock *)resolve rejecter:(RCTPromiseRejectBlock *)reject);
RCT_EXTERN_METHOD(addFriendsAccess:(RCTPromiseResolveBlock *)resolve rejecter:(RCTPromiseRejectBlock *)reject);
RCT_EXTERN_METHOD(sendCommerce:(NSDictionary *)dict withResolver:(RCTPromiseResolveBlock *)resolve withRejecter:(RCTPromiseRejectBlock *)reject)
RCT_EXTERN_METHOD(sendList:(NSDictionary *)dict withResolver:(RCTPromiseResolveBlock *)resolve withRejecter:(RCTPromiseRejectBlock *)reject)
RCT_EXTERN_METHOD(sendFeed:(NSDictionary *)dict withResolver:(RCTPromiseResolveBlock *)resolve withRejecter:(RCTPromiseRejectBlock *)reject)
RCT_EXTERN_METHOD(sendLocation:(NSDictionary *)dict withResolver:(RCTPromiseResolveBlock *)resolve withRejecter:(RCTPromiseRejectBlock *)reject)
RCT_EXTERN_METHOD(sendText:(NSDictionary *)dict withResolver:(RCTPromiseResolveBlock *)resolve withRejecter:(RCTPromiseRejectBlock *)reject)
RCT_EXTERN_METHOD(sendCustom:(NSDictionary *)dict withResolver:(RCTPromiseResolveBlock *)resolve withRejecter:(RCTPromiseRejectBlock *)reject)

@end
