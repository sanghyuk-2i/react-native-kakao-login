//
//  RNKakaoLogins.swift
//  RNKakaoLogins
//
//  Created by hyochan on 2021/03/18.
//  Copyright © 2021 Facebook. All rights reserved.
//

import Foundation

import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser
import KakaoSDKLink
import KakaoSDKTemplate

import SafariServices

@objc(RNKakaoLogins)
class RNKakaoLogins: NSObject {

    public override init() {
        let appKey: String? = Bundle.main.object(forInfoDictionaryKey: "KAKAO_APP_KEY") as? String
        KakaoSDK.initSDK(appKey: appKey!)
    }

    // share link part 
    private func createExecutionParams(dict: NSDictionary, key: String) -> Dictionary<String, String>? {
        if let dictArr = dict[key] {
            var returnDict: [String: String] = [:]
            for item in (dictArr as! NSArray) {
                if let returnKey = (item as! NSDictionary)["key"], let returnValue = (item as! NSDictionary)["value"] {
                    returnDict[returnKey as! String] = (returnValue as! String)
                }
            }
            return returnDict
        }
        return nil
    }

    private func createURL(dict: NSDictionary, key: String) -> URL? {
        if let value = dict[key] {
            return URL(string: (value as! String))
        }
        return nil
    }

    private func createLink(dict: NSDictionary, key: String) -> Link {
        if let linkDict = dict[key] {
            let lDict = (linkDict as! NSDictionary)
            let webUrl = createURL(dict: lDict, key: "webUrl")
            let mobileWebUrl = createURL(dict: lDict, key: "mobileWebUrl")
            let iosExecutionParams = createExecutionParams(dict: lDict, key: "iosExecutionParams")
            let androidExecutionParams = createExecutionParams(dict: lDict, key: "androidExecutionParams")
            return Link(webUrl: webUrl, mobileWebUrl: mobileWebUrl, androidExecutionParams: androidExecutionParams, iosExecutionParams: iosExecutionParams)
        }
        return Link(webUrl: nil, mobileWebUrl: nil, androidExecutionParams: nil, iosExecutionParams: nil)
    }

    private func createButton(dict: NSDictionary) -> Button {
        let title = dict["title"] != nil ? dict["title"] : ""
        let link = createLink(dict: dict, key: "link")
        return Button(title: (title as! String), link: link)
    }

    private func createButtons(dict: NSDictionary) -> Array<Button>? {
        if let dictArr = dict["buttons"] {
            var buttons: [Button] = []
            for item in (dictArr as! NSArray) {
                buttons.append(createButton(dict: (item as! NSDictionary)))
            }
            return buttons
        }
        return nil
    }

    private func createSocial(dict: NSDictionary) -> Social? {
        if let socialDict = dict["social"] {
            let sDict = socialDict as! NSDictionary
            let commentCount = (sDict["commentCount"] as? Int)
            let likeCount = (sDict["likeCount"] as? Int)
            let sharedCount = (sDict["sharedCount"] as? Int)
            let subscriberCount = (sDict["subscriberCount"] as? Int)
            let viewCount = (sDict["viewCount"] as? Int)
            return Social(likeCount: likeCount, commentCount: commentCount, sharedCount: sharedCount, viewCount: viewCount, subscriberCount: subscriberCount)
        }
        return nil
    }

    private func createContent(dict: NSDictionary) -> Content {
        let title = dict["title"] != nil ? (dict["title"] as! String) : ""
        let imageUrl = dict["imageUrl"] != nil ? createURL(dict: dict, key: "imageUrl")! : URL(string: "http://monthly.chosun.com/up_fd/Mdaily/2017-09/bimg_thumb/2017042000056_0.jpg")!
        let link = createLink(dict: dict, key: "link")
        let description = (dict["description"] as? String)
        let imageWidth = (dict["imageWidth"] as? Int)
        let imageHeight = (dict["imageHeight"] as? Int)
        return Content(title: title, imageUrl: imageUrl, imageWidth: imageWidth, imageHeight: imageHeight, description: description, link: link)
    }

    private func createContents(dictArr: NSArray) -> Array<Content> {
        var contents: [Content] = []
        for item in dictArr {
            contents.append(createContent(dict: (item as! NSDictionary)))
        }
        return contents
    }

    private func createCommerce(dict: NSDictionary) -> CommerceDetail {
        let regularPrice = (dict["regularPrice"] as! Int)
        let discountPrice = (dict["discountPrice"] as? Int)
        let discountRate = (dict["discountRate"] as? Int)
        let fixedDiscountPrice = (dict["fixedDiscountPrice"] as? Int)
        return CommerceDetail(regularPrice: regularPrice, discountPrice: discountPrice, discountRate: discountRate, fixedDiscountPrice: fixedDiscountPrice)
    }

    @objc
    static func requiresMainQueueSetup() -> Bool {
      return true
    }

    @objc(isKakaoTalkLoginUrl:)
    public static func isKakaoTalkLoginUrl(url:URL) -> Bool {

        let appKey = try? KakaoSDK.shared.appKey();

        if (appKey != nil) {
            return AuthApi.isKakaoTalkLoginUrl(url)
        }
        return false
    }

    @objc(handleOpenUrl:)
    public static func handleOpenUrl(url:URL) -> Bool {
        return AuthController.handleOpenUrl(url: url)
    }

    @objc(login:rejecter:)
    func login(_ resolve: @escaping RCTPromiseResolveBlock,
                rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
        DispatchQueue.main.async {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss";

            if (UserApi.isKakaoTalkLoginAvailable()) {
                UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                    if let error = error {
                        reject("RNKakaoLogins", error.localizedDescription, nil)
                    }
                    else {
                        resolve([
                            "accessToken": oauthToken?.accessToken ?? "",
                            "refreshToken": oauthToken?.refreshToken ?? "" as Any,
                            "idToken": oauthToken?.idToken ?? "",
                            "accessTokenExpiresAt": dateFormatter.string(from: oauthToken!.expiredAt),
                            "refreshTokenExpiresAt": dateFormatter.string(from: oauthToken!.refreshTokenExpiredAt),
                            "scopes": oauthToken?.scopes ?? "",
                        ])
                    }
                }
            } else {
                UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    if let error = error {
                        reject("RNKakaoLogins", error.localizedDescription, nil)
                    }
                    else {
                        resolve([
                            "accessToken": oauthToken?.accessToken ?? "",
                            "refreshToken": oauthToken?.refreshToken ?? "" as Any,
                            "idToken": oauthToken?.idToken ?? "",
                            "accessTokenExpiresAt": dateFormatter.string(from: oauthToken!.expiredAt),
                            "refreshTokenExpiresAt": dateFormatter.string(from: oauthToken!.refreshTokenExpiredAt),
                            "scopes": oauthToken?.scopes ?? "",
                        ]);
                    }
                }
            }
        }
    }

    @objc(loginWithKakaoAccount:rejecter:)
    func loginWithKakaoAccount(_ resolve: @escaping RCTPromiseResolveBlock,
                rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
        DispatchQueue.main.async {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss";
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    reject("RNKakaoLogins", error.localizedDescription, nil)
                }
                else {
                    resolve([
                        "accessToken": oauthToken?.accessToken ?? "",
                        "refreshToken": oauthToken?.refreshToken ?? "" as Any,
                        "idToken": oauthToken?.idToken ?? "",
                        "accessTokenExpiresAt": dateFormatter.string(from: oauthToken!.expiredAt),
                        "refreshTokenExpiresAt": dateFormatter.string(from: oauthToken!.refreshTokenExpiredAt),
                        "scopes": oauthToken?.scopes ?? "",
                    ]);
                }
            }
        }
    }

    @objc(logout:rejecter:)
    func logout(_ resolve: @escaping RCTPromiseResolveBlock,
               rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
        DispatchQueue.main.async {
            UserApi.shared.logout {(error) in
                if let error = error {
                    reject("RNKakaoLogins", error.localizedDescription, nil)
                }
                else {
                    resolve("Successfully logged out")
                }
            }
        }
    }

    @objc(unlink:rejecter:)
    func unlink(_ resolve: @escaping RCTPromiseResolveBlock,
               rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
        DispatchQueue.main.async {
            UserApi.shared.unlink {(error) in
                if let error = error {
                    reject("RNKakaoLogins", error.localizedDescription, nil)
                }
                else {
                    resolve("Successfully unlinked")
                }
            }
        }
    }

    @objc(getAccessToken:rejecter:)
    func getAccessToken(_ resolve: @escaping RCTPromiseResolveBlock,
               rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
        DispatchQueue.main.async {
            UserApi.shared.accessTokenInfo {(accessTokenInfo, error) in
                if let error = error {
                    reject("RNKakaoLogins", error.localizedDescription, nil)
                }
                else {
                    resolve([
                        "accessToken": TokenManager.manager.getToken()?.accessToken,
                        "expiresIn": accessTokenInfo?.expiresIn,
                    ])
                }
            }
        }
    }

    @objc(getProfile:rejecter:)
    func getProfile(_ resolve: @escaping RCTPromiseResolveBlock,
               rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
        DispatchQueue.main.async {
            UserApi.shared.me() {(user, error) in
                if let error = error {
                    reject("RNKakaoLogins", error.localizedDescription, nil)
                }
                else {
                    resolve([
                        "id": user?.id as Any,
                        "email": user?.kakaoAccount?.email as Any,
                        "nickname": user?.kakaoAccount?.profile?.nickname as Any,
                        "profileImageUrl": user?.kakaoAccount?.profile?.profileImageUrl?.absoluteString as Any,
                        "thumbnailImageUrl": user?.kakaoAccount?.profile?.thumbnailImageUrl?.absoluteString as Any,
                        "phoneNumber": user?.kakaoAccount?.phoneNumber as Any,
                        "ageRange": user?.kakaoAccount?.ageRange?.rawValue as Any,
                        "birthday": user?.kakaoAccount?.birthday as Any,
                        "birthdayType": user?.kakaoAccount?.birthdayType as Any,
                        "birthyear": user?.kakaoAccount?.birthyear as Any,
                        "gender": user?.kakaoAccount?.gender?.rawValue as Any,
                        "isEmailValid": user?.kakaoAccount?.isEmailValid as Any,
                        "isEmailVerified": user?.kakaoAccount?.isEmailVerified as Any,
                        "isKorean": user?.kakaoAccount?.isKorean as Any,
                        "ageRangeNeedsAgreement": user?.kakaoAccount?.ageRangeNeedsAgreement as Any,
                        "birthdayNeedsAgreement": user?.kakaoAccount?.birthdayNeedsAgreement as Any,
                        "birthyearNeedsAgreement": user?.kakaoAccount?.birthyearNeedsAgreement as Any,
                        "emailNeedsAgreement": user?.kakaoAccount?.emailNeedsAgreement as Any,
                        "genderNeedsAgreement": user?.kakaoAccount?.genderNeedsAgreement as Any,
                        "isKoreanNeedsAgreement": user?.kakaoAccount?.isKoreanNeedsAgreement as Any,
                        "phoneNumberNeedsAgreement": user?.kakaoAccount?.phoneNumberNeedsAgreement as Any,
                        "profileNeedsAgreement": user?.kakaoAccount?.profileNeedsAgreement as Any,
                    ])
                }
            }
        }
    }
    
    @objc(addFriendsAccess:rejecter:)
    func addFriendsAccess(_ resolve: @escaping RCTPromiseResolveBlock,
               rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
         DispatchQueue.main.async {
            UserApi.shared.me() { (user, error) in
                if let error = error {
                    reject("RNKakaoLogins", error.localizedDescription, nil)
                }
                else {
                    if let user = user {
                        var scopes = [String]()
                        scopes.append("friends")
                        
                        if scopes.count > 0 {
                            //scope 목록을 전달하여 카카오 로그인 요청
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss";
                            UserApi.shared.loginWithKakaoAccount(scopes: scopes) { (oauthToken, error) in
                                if let error = error {
                                    reject("RNKakaoLogins", error.localizedDescription, nil)
                                    print(error)
                                }
                                else {
                                    _ = user
                                    resolve([
                                        "accessToken": oauthToken?.accessToken ?? "",
                                        "refreshToken": oauthToken?.refreshToken ?? "" as Any,
                                        "idToken": oauthToken?.idToken ?? "",
                                        "accessTokenExpiresAt": dateFormatter.string(from: oauthToken!.expiredAt),
                                        "refreshTokenExpiresAt": dateFormatter.string(from: oauthToken!.refreshTokenExpiredAt),
                                        "scopes": oauthToken?.scopes ?? "",
                                    ]);
                                }
                            }
                        }
                        else {
                            resolve("사용자의 추가 동의가 필요하지 않습니다.")
                            print("사용자의 추가 동의가 필요하지 않습니다.")
                        }
                    }
                }
            }
         }
    } 


    // share link part
    @objc(sendCommerce:withResolver:withRejecter:)
    func sendCommerce(dict:NSDictionary,resolve:@escaping RCTPromiseResolveBlock,reject:@escaping RCTPromiseRejectBlock) -> Void {
        let buttons = createButtons(dict: dict)
        let buttonTitle = (dict["buttonTitle"] as? String)
        let commerceTemplate = CommerceTemplate(content: createContent(dict: (dict["content"] as! NSDictionary)), commerce: createCommerce(dict: (dict["commerce"] as! NSDictionary)), buttonTitle: buttonTitle, buttons: buttons)
        if let commerceTemplateJsonData = (try? SdkJSONEncoder.custom.encode(commerceTemplate)) {
            if let templateJsonObject = SdkUtils.toJsonObject(commerceTemplateJsonData) {
                if LinkApi.isKakaoLinkAvailable() == true {
                    LinkApi.shared.defaultLink(templateObject:templateJsonObject) {(linkResult, error) in
                        if let error = error {
                            reject("E_Kakao_Link", error.localizedDescription, nil)
                        }
                        else {
                            //do something
                            guard let linkResult = linkResult else { return }
                            UIApplication.shared.open(linkResult.url, options: [:], completionHandler: nil)
                            resolve(["result": true])
                        }
                    }
                } else {
                    if let url = LinkApi.shared.makeSharerUrlforDefaultLink(templateObject: templateJsonObject) {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            resolve(["result": true])
                        } else {
                            reject("E_KAKAO_BROWSER_ERROR", "", nil)
                            return
                        }
                    }
                }
            }
        }
    }
    @objc(sendList:withResolver:withRejecter:)
    func sendList(dict:NSDictionary,resolve:@escaping RCTPromiseResolveBlock,reject:@escaping RCTPromiseRejectBlock) -> Void {
        let buttons = createButtons(dict: dict)
        let buttonTitle = (dict["buttonTitle"] as? String)
        let headerTitle = (dict["headerTitle"] as! String)
        let listTemplate = ListTemplate(headerTitle: headerTitle, headerLink: createLink(dict: dict, key: "headerLink"), contents: createContents(dictArr: (dict["contents"] as! NSArray)), buttonTitle: buttonTitle, buttons: buttons)
        if let listTemplateJsonData = (try? SdkJSONEncoder.custom.encode(listTemplate)) {
            if let templateJsonObject = SdkUtils.toJsonObject(listTemplateJsonData) {
                if LinkApi.isKakaoLinkAvailable() == true {
                    LinkApi.shared.defaultLink(templateObject:templateJsonObject) {(linkResult, error) in
                        if let error = error {
                            reject("E_Kakao_Link", error.localizedDescription, nil)
                        }
                        else {
                            //do something
                            guard let linkResult = linkResult else { return }
                            UIApplication.shared.open(linkResult.url, options: [:], completionHandler: nil)
                            resolve(["result": true])
                        }
                    }
                } else {
                    if let url = LinkApi.shared.makeSharerUrlforDefaultLink(templateObject: templateJsonObject) {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            resolve(["result": true])
                        } else {
                            reject("E_KAKAO_BROWSER_ERROR", "", nil)
                            return
                        }
                    }
                }
            }
        }
    }
    @objc(sendFeed:withResolver:withRejecter:)
    func sendFeed(dict:NSDictionary,resolve:@escaping RCTPromiseResolveBlock,reject:@escaping RCTPromiseRejectBlock) -> Void {
        let buttons = createButtons(dict: dict)
        let buttonTitle = (dict["buttonTitle"] as? String)
        let feedTemplate = FeedTemplate(content: createContent(dict: (dict["content"] as! NSDictionary)), social: createSocial(dict: dict), buttonTitle: buttonTitle, buttons: buttons)
        if let feedTemplateJsonData = (try? SdkJSONEncoder.custom.encode(feedTemplate)) {
            if let templateJsonObject = SdkUtils.toJsonObject(feedTemplateJsonData) {
                if LinkApi.isKakaoLinkAvailable() == true {
                    LinkApi.shared.defaultLink(templateObject:templateJsonObject) {(linkResult, error) in
                        if let error = error {
                            reject("E_Kakao_Link", error.localizedDescription, nil)
                        }
                        else {
                            //do something
                            guard let linkResult = linkResult else { return }
                            UIApplication.shared.open(linkResult.url, options: [:], completionHandler: nil)
                            resolve(["result": true])
                        }
                    }
                } else {
                    if let url = LinkApi.shared.makeSharerUrlforDefaultLink(templateObject: templateJsonObject) {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            resolve(["result": true])
                        } else {
                            reject("E_KAKAO_BROWSER_ERROR", "", nil)
                            return
                        }
                    }
                }
            }
        }
    }
    @objc(sendLocation:withResolver:withRejecter:)
    func sendLocation(dict:NSDictionary,resolve:@escaping RCTPromiseResolveBlock,reject:@escaping RCTPromiseRejectBlock) -> Void {
        let buttons = createButtons(dict: dict)
        let buttonTitle = (dict["buttonTitle"] as? String)
        let locationTemplate = LocationTemplate(address: (dict["address"] as! String), addressTitle: (dict["addressTitle"] as? String), content: createContent(dict: (dict["content"] as! NSDictionary)), social: createSocial(dict: dict), buttonTitle: buttonTitle, buttons: buttons)
        if let locationTemplateJsonData = (try? SdkJSONEncoder.custom.encode(locationTemplate)) {
            if let templateJsonObject = SdkUtils.toJsonObject(locationTemplateJsonData) {
                if LinkApi.isKakaoLinkAvailable() == true {
                    LinkApi.shared.defaultLink(templateObject:templateJsonObject) {(linkResult, error) in
                        if let error = error {
                            reject("E_Kakao_Link", error.localizedDescription, nil)
                        }
                        else {
                            //do something
                            guard let linkResult = linkResult else { return }
                            UIApplication.shared.open(linkResult.url, options: [:], completionHandler: nil)
                            resolve(["result": true])
                        }
                    }
                } else {
                    if let url = LinkApi.shared.makeSharerUrlforDefaultLink(templateObject: templateJsonObject) {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            resolve(["result": true])
                        } else {
                            reject("E_KAKAO_BROWSER_ERROR", "", nil)
                            return
                        }
                    }
                }
            }
        }
    }
    @objc(sendText:withResolver:withRejecter:)
    func sendText(dict:NSDictionary,resolve:@escaping RCTPromiseResolveBlock,reject:@escaping RCTPromiseRejectBlock) -> Void {
        let buttons = createButtons(dict: dict)
        let buttonTitle = (dict["buttonTitle"] as? String)
        let textTemplate = TextTemplate(text: (dict["text"] as! String), link: createLink(dict: dict, key: "link"), buttonTitle: buttonTitle, buttons: buttons)
        if let textTemplateJsonData = (try? SdkJSONEncoder.custom.encode(textTemplate)) {
            if let templateJsonObject = SdkUtils.toJsonObject(textTemplateJsonData) {
                if LinkApi.isKakaoLinkAvailable() == true {
                    LinkApi.shared.defaultLink(templateObject:templateJsonObject) {(linkResult, error) in
                        if let error = error {
                            reject("E_Kakao_Link", error.localizedDescription, nil)
                        }
                        else {
                            //do something
                            guard let linkResult = linkResult else { return }
                            UIApplication.shared.open(linkResult.url, options: [:], completionHandler: nil)
                            resolve(["result": true])
                        }
                    }
                } else {
                    if let url = LinkApi.shared.makeSharerUrlforDefaultLink(templateObject: templateJsonObject) {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            resolve(["result": true])
                        } else {
                            reject("E_KAKAO_BROWSER_ERROR", "", nil)
                            return
                        }
                    }
                }
            }
        }
    }
    @objc(sendCustom:withResolver:withRejecter:)
    func sendCustom(dict:NSDictionary,resolve:@escaping RCTPromiseResolveBlock,reject:@escaping RCTPromiseRejectBlock) -> Void {
        let templateId = Int64(dict["templateId"] as! Int)
        let templateArgs = createExecutionParams(dict: dict, key: "templateArgs")
        if LinkApi.isKakaoLinkAvailable() == true {
            LinkApi.shared.customLink(templateId: templateId, templateArgs: templateArgs) {(linkResult, error) in
                if let error = error {
                    reject("E_Kakao_Link", error.localizedDescription, nil)
                }
                else {
                    //do something
                    guard let linkResult = linkResult else { return }
                    UIApplication.shared.open(linkResult.url, options: [:], completionHandler: nil)
                    resolve(["result": true])
                }
            }
        } else {
            if let url = LinkApi.shared.makeSharerUrlforCustomLink(templateId: templateId, templateArgs:templateArgs) {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    resolve(["result": true])
                } else {
                    reject("E_KAKAO_BROWSER_ERROR", "", nil)
                    return
                }
            }

        }
    }
}
