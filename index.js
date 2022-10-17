var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
import { NativeModules } from 'react-native';
var RNKakaoLogins = NativeModules.RNKakaoLogins;
export var login = function () { return __awaiter(void 0, void 0, void 0, function () {
    var result, err_1;
    return __generator(this, function (_a) {
        switch (_a.label) {
            case 0:
                _a.trys.push([0, 2, , 3]);
                return [4 /*yield*/, RNKakaoLogins.login()];
            case 1:
                result = _a.sent();
                return [2 /*return*/, result];
            case 2:
                err_1 = _a.sent();
                throw err_1;
            case 3: return [2 /*return*/];
        }
    });
}); };
export var loginWithKakaoAccount = function () { return __awaiter(void 0, void 0, void 0, function () {
    var result, err_2;
    return __generator(this, function (_a) {
        switch (_a.label) {
            case 0:
                _a.trys.push([0, 2, , 3]);
                return [4 /*yield*/, RNKakaoLogins.loginWithKakaoAccount()];
            case 1:
                result = _a.sent();
                return [2 /*return*/, result];
            case 2:
                err_2 = _a.sent();
                throw err_2;
            case 3: return [2 /*return*/];
        }
    });
}); };
export var logout = function () { return __awaiter(void 0, void 0, void 0, function () {
    var result, err_3;
    return __generator(this, function (_a) {
        switch (_a.label) {
            case 0:
                _a.trys.push([0, 2, , 3]);
                return [4 /*yield*/, RNKakaoLogins.logout()];
            case 1:
                result = _a.sent();
                return [2 /*return*/, result];
            case 2:
                err_3 = _a.sent();
                throw err_3;
            case 3: return [2 /*return*/];
        }
    });
}); };
export var unlink = function () { return __awaiter(void 0, void 0, void 0, function () {
    var result, err_4;
    return __generator(this, function (_a) {
        switch (_a.label) {
            case 0:
                _a.trys.push([0, 2, , 3]);
                return [4 /*yield*/, RNKakaoLogins.unlink()];
            case 1:
                result = _a.sent();
                return [2 /*return*/, result];
            case 2:
                err_4 = _a.sent();
                throw err_4;
            case 3: return [2 /*return*/];
        }
    });
}); };
export var getProfile = function () { return __awaiter(void 0, void 0, void 0, function () {
    var result, err_5;
    return __generator(this, function (_a) {
        switch (_a.label) {
            case 0:
                _a.trys.push([0, 2, , 3]);
                return [4 /*yield*/, RNKakaoLogins.getProfile()];
            case 1:
                result = _a.sent();
                return [2 /*return*/, result];
            case 2:
                err_5 = _a.sent();
                throw err_5;
            case 3: return [2 /*return*/];
        }
    });
}); };
export var getAccessToken = function () { return __awaiter(void 0, void 0, void 0, function () {
    var result, err_6;
    return __generator(this, function (_a) {
        switch (_a.label) {
            case 0:
                _a.trys.push([0, 2, , 3]);
                return [4 /*yield*/, RNKakaoLogins.getAccessToken()];
            case 1:
                result = _a.sent();
                return [2 /*return*/, result];
            case 2:
                err_6 = _a.sent();
                throw err_6;
            case 3: return [2 /*return*/];
        }
    });
}); };
export var addFriendsAccess = function () { return __awaiter(void 0, void 0, void 0, function () {
    var result, err_7;
    return __generator(this, function (_a) {
        switch (_a.label) {
            case 0:
                _a.trys.push([0, 2, , 3]);
                return [4 /*yield*/, RNKakaoLogins.addFriendsAccess()];
            case 1:
                result = _a.sent();
                return [2 /*return*/, result];
            case 2:
                err_7 = _a.sent();
                throw err_7;
            case 3: return [2 /*return*/];
        }
    });
}); };
// share link part
// /**
//  * ContentType
//  * @description 카카오 링크 본문 내용 타입
//  * @property title        제목
//  * @property imageUrl     이미지 url
//  * @property link         클릭 시 열리는 링크
//  * @property description  설명 (Option)
//  * @property imageWidth   이미지 가로 길이 (Option)
//  * @property imageHeight  이미지 세로 길이 (Option)
//  */
// export type ContentType = {
//   title: string;
//   imageUrl: string;
//   link: LinkType;
//   description?: string;
//   imageWidth?: number;
//   imageHeight?: number;
// };
// /**
//  * ExecutionParamType
//  * @description ios, android 딥링크에 사용될 key, value
//  * @property key    딥링크 key
//  * @property value  딥링크 value
//  */
// export type ExecutionParamType = {
//   key: string;
//   value: string;
// };
// /**
//  * LinkType
//  * @description 클릭 시 열리는 링크 타입 (이 중 하나는 반드시 존재해야 함)
//  * @property webUrl                   웹 페이지 링크 (Option)
//  * @property mobileWebUrl             모바일일 경우 웹 페이지 링크 (Option)
//  * @property iosExecutionParams       ios 딥링크 (Option)
//  * @property androidExecutionParams   android 딥링크 (Option)
//  */
// export type LinkType = {
//   webUrl?: string;
//   mobileWebUrl?: string;
//   iosExecutionParams?: ExecutionParamType[];
//   androidExecutionParams?: ExecutionParamType[];
// };
// /**
//  * CommerceType
//  * @description 상품 타입
//  * @property regularPrice         정가
//  * @property discountPrice        할인된 가격 (Option)
//  * @property discountRate         할인율 (Option)
//  * @property fixedDiscountPrice   정액 할인 가격 (Option)
//  * @property productName          상품명 (Option)
//  */
// export type CommerceType = {
//   regularPrice: number;
//   discountPrice?: number;
//   discountRate?: number;
//   fixedDiscountPrice?: number;
//   productName?: string;
// };
// /**
//  * ButtonType
//  * @description 버튼 타입
//  * @property title  버튼 타이틀
//  * @property link   버튼 링크 타입
//  */
// export type ButtonType = {
//   title: string;
//   link: LinkType;
// };
// /**
//  * SocialType
//  * @description 소셜 타입
//  * @property commentCount     댓글 수 (Option)
//  * @property likeCount        좋아요 수 (Option)
//  * @property sharedCount      공유 수 (Option)
//  * @property subscriberCount  구독 수 (Option)
//  * @property viewCount        조회 수 (Option)
//  */
// export type SocialType = {
//   commentCount?: number;
//   likeCount?: number;
//   sharedCount?: number;
//   subscriberCount?: number;
//   viewCount?: number;
// };
// /**
//  * SendResultType
//  * @description 공유 결과 타입
//  * @property result   성공 여부
//  * @property intent   카카오 링크 정보 (android only)
//  * @property warning  경고 메세지 (android only)
//  * @property argument 카카오 링크 argument (android only)
//  * @property callback 카카오 링크 후 콜백 데이터 (android only)
//  */
// export type SendResultType = {
//   result: boolean;
//   intent?: string;
//   warning?: string;
//   argument?: string;
//   callback?: string;
// };
// /**
//  * CallbackType
//  * @description 카카오 링크 콜백 타입 (error, result 둘 중 하나만 존재)
//  * @property error    에러
//  * @property result   결과
//  */
// export type CallbackType = (error?: Error, result?: SendResultType) => void;
// /**
//  * CommerceTemplateType
//  * @description 상품 공유하기
//  * @property content      내용
//  * @property commerce     상품 정보
//  * @property buttons      버튼 배열 (Option)
//  * @property buttonTitle  버튼이 하나일 때 버튼의 타이틀 (Option)
//  */
// export type CommerceTemplateType = {
//   content: ContentType;
//   commerce: CommerceType;
//   buttons?: ButtonType[];
//   buttonTitle?: String;
// };
// /**
//  * ListTemplateType
//  * @description 리스트 공유하기
//  * @property headerTitle  리스트 헤더 타이틀
//  * @property headerLink   리스트 헤더 클릭 링크
//  * @property contents     리스트 각각의 내용
//  * @property buttons      버튼 배열 (Option)
//  * @property buttonTitle  버튼이 하나일 때 버튼의 타이틀 (Option)
//  */
// export type ListTemplateType = {
//   headerTitle: string;
//   headerLink: LinkType;
//   contents: ContentType[];
//   buttons?: ButtonType[];
//   buttonTitle?: string;
// };
// /**
//  * FeedTemplateType
//  * @description 피드 공유하기
//  * @property content      내용
//  * @property social       피드 정보 (Option)
//  * @property buttons      버튼 배열 (Option)
//  * @property buttonTitle  버튼이 하나일 때 버튼의 타이틀 (Option)
//  */
// export type FeedTemplateType = {
//   content: ContentType;
//   social?: SocialType;
//   buttons?: ButtonType[];
//   buttonTitle?: String;
// };
// /**
//  * LocationTemplateType
//  * @description 위치 공유하기
//  * @property address        상세 주소 (00구 00동 000-00)
//  * @property addressTitle   주소 명칭 (00아파트, 00상가)
//  * @property content        내용
//  * @property social         피드 정보 (Option)
//  * @property buttons        버튼 배열 (Option)
//  * @property buttonTitle    버튼이 하나일 때 버튼의 타이틀 (Option)
//  */
// export type LocationTemplateType = {
//   address: string;
//   addressTitle?: string;
//   content: ContentType;
//   social?: SocialType;
//   buttons?: ButtonType[];
//   buttonTitle?: string;
// };
// /**
//  * TextTemplateType
//  * @description 텍스트 공유하기
//  * @property text           텍스트
//  * @property link           링크 타입
//  * @property buttons        버튼 배열 (Option)
//  * @property buttonTitle    버튼이 하나일 때 버튼의 타이틀 (Option)
//  */
// export type TextTemplateType = {
//   text: string;
//   link: LinkType;
//   buttons?: ButtonType[];
//   buttonTitle?: string;
// };
// /**
//  * CustomTemplateType
//  * @description 사용자가 미리 생성한 메시지 템플릿 공유하기
//  * @property templateId   템플릿 id
//  * @property templateArgs 템플릿 args (key, value 형식) (Option)
//  */
// export type CustomTemplateType = {
//   templateId: number;
//   templateArgs?: ExecutionParamType[];
// };
// /**
//  * sendCommerce
//  * @param {CommerceTemplateType} commerceTemplate CommerceTemplate Item
//  * @param {CallbackType} [callback] callback function
//  * @returns {Promise<SendResultType>}
//  */
// export const sendCommerce = (
//   commerceTemplate: CommerceTemplateType,
//   callback?: CallbackType,
// ): Promise<SendResultType> => {
//   return RNKakaoLogins.sendCommerce(commerceTemplate)
//     .then((result: SendResultType) => {
//       if (callback && typeof callback === 'function') {
//         callback(undefined, result);
//       }
//       return result;
//     })
//     .catch((error: Error) => {
//       if (callback && typeof callback === 'function') {
//         callback(error, undefined);
//       }
//       throw error;
//     });
// };
// /**
//  * sendList
//  * @param {ListTemplateType} listTemplate ListTemplate Item
//  * @param {CallbackType} [callback] callback function
//  * @returns {Promise<SendResultType>}
//  */
// export const sendList = (
//   listTemplate: ListTemplateType,
//   callback?: CallbackType,
// ): Promise<SendResultType> => {
//   return RNKakaoLogins.sendList(listTemplate)
//     .then((result: SendResultType) => {
//       if (callback && typeof callback === 'function') {
//         callback(undefined, result);
//       }
//       return result;
//     })
//     .catch((error: Error) => {
//       if (callback && typeof callback === 'function') {
//         callback(error, undefined);
//       }
//       throw error;
//     });
// };
// /**
//  * sendFeed
//  * @param {FeedTemplateType} feedTemplate FeedTemplate Item
//  * @param {CallbackType} [callback] callback function
//  * @returns {Promise<SendResultType>}
//  */
// export const sendFeed = (
//   feedTemplate: FeedTemplateType,
//   callback?: CallbackType,
// ): Promise<SendResultType> => {
//   return RNKakaoLogins.sendFeed(feedTemplate)
//     .then((result: SendResultType) => {
//       if (callback && typeof callback === 'function') {
//         callback(undefined, result);
//       }
//       return result;
//     })
//     .catch((error: Error) => {
//       if (callback && typeof callback === 'function') {
//         callback(error, undefined);
//       }
//       throw error;
//     });
// };
// /**
//  * sendText
//  * @param {TextTemplateType} textTemplate TextTemplate Item
//  * @param {CallbackType} [callback] callback function
//  * @returns {Promise<SendResultType>}
//  */
// export const sendText = (
//   textTemplate: TextTemplateType,
//   callback?: CallbackType,
// ): Promise<SendResultType> => {
//   return RNKakaoLogins.sendText(textTemplate)
//     .then((result: SendResultType) => {
//       if (callback && typeof callback === 'function') {
//         callback(undefined, result);
//       }
//       return result;
//     })
//     .catch((error: Error) => {
//       if (callback && typeof callback === 'function') {
//         callback(error, undefined);
//       }
//       throw error;
//     });
// };
// /**
//  * sendLocation
//  * @param {LocationTemplateType} locationTemplate LocationTemplate Item
//  * @param {CallbackType} [callback] callback function
//  * @returns {Promise<SendResultType>}
//  */
// export const sendLocation = (
//   locationTemplate: LocationTemplateType,
//   callback?: CallbackType,
// ): Promise<SendResultType> => {
//   return RNKakaoLogins.sendLocation(locationTemplate)
//     .then((result: SendResultType) => {
//       if (callback && typeof callback === 'function') {
//         callback(undefined, result);
//       }
//       return result;
//     })
//     .catch((error: Error) => {
//       if (callback && typeof callback === 'function') {
//         callback(error, undefined);
//       }
//       throw error;
//     });
// };
// /**
//  * sendCustom
//  * @param {CustomTemplateType} customTemplate CustomTemplate Item
//  * @param {CallbackType} [callback] callback function
//  * @returns {Promise<SendResultType>}
//  */
// export const sendCustom = (
//   customTemplate: CustomTemplateType,
//   callback?: CallbackType,
// ): Promise<SendResultType> => {
//   return RNKakaoLogins.sendCustom(customTemplate)
//     .then((result: SendResultType) => {
//       if (callback && typeof callback === 'function') {
//         callback(undefined, result);
//       }
//       return result;
//     })
//     .catch((error: Error) => {
//       if (callback && typeof callback === 'function') {
//         callback(error, undefined);
//       }
//       throw error;
//     });
// };
// export type KakaoShareLinkType = {
//   sendCommerce: typeof sendCommerce;
//   sendList: typeof sendList;
//   sendFeed: typeof sendFeed;
//   sendText: typeof sendText;
//   sendLocation: typeof sendLocation;
//   sendCustom: typeof sendCustom;
// };
