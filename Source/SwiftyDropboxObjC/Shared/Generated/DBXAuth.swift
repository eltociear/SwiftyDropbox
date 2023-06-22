///
/// Copyright (c) 2022 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

import Foundation
import SwiftyDropbox

/// Objective-C compatible datatypes for the auth namespace
/// For Swift see auth

/// Error occurred because the account doesn't have permission to access the resource.
@objc
public class DBXAuthAccessError: NSObject {
    let swift: Auth.AccessError

    public init(swift: Auth.AccessError) {
        self.swift = swift
    }

    public static func factory(swift: Auth.AccessError) -> DBXAuthAccessError {
        switch swift {
        case .invalidAccountType(let swiftArg):
            let arg = DBXAuthInvalidAccountTypeError(swift: swiftArg)
            return DBXAuthAccessErrorInvalidAccountType(arg)
        case .paperAccessDenied(let swiftArg):
            let arg = DBXAuthPaperAccessError(swift: swiftArg)
            return DBXAuthAccessErrorPaperAccessDenied(arg)
        case .other:
            return DBXAuthAccessErrorOther()
        }
    }

    @objc
    public override var description: String { swift.description }

    @objc
    public var asInvalidAccountType: DBXAuthAccessErrorInvalidAccountType? {
        self as? DBXAuthAccessErrorInvalidAccountType
    }

    @objc
    public var asPaperAccessDenied: DBXAuthAccessErrorPaperAccessDenied? {
        self as? DBXAuthAccessErrorPaperAccessDenied
    }

    @objc
    public var asOther: DBXAuthAccessErrorOther? {
        self as? DBXAuthAccessErrorOther
    }
}

/// Current account type cannot access the resource.
@objc
public class DBXAuthAccessErrorInvalidAccountType: DBXAuthAccessError {
    @objc
    public var invalidAccountType: DBXAuthInvalidAccountTypeError

    @objc
    public init(_ arg: DBXAuthInvalidAccountTypeError) {
        self.invalidAccountType = arg
        let swift = Auth.AccessError.invalidAccountType(arg.swift)
        super.init(swift: swift)
    }
}

/// Current account cannot access Paper.
@objc
public class DBXAuthAccessErrorPaperAccessDenied: DBXAuthAccessError {
    @objc
    public var paperAccessDenied: DBXAuthPaperAccessError

    @objc
    public init(_ arg: DBXAuthPaperAccessError) {
        self.paperAccessDenied = arg
        let swift = Auth.AccessError.paperAccessDenied(arg.swift)
        super.init(swift: swift)
    }
}

/// An unspecified error.
@objc
public class DBXAuthAccessErrorOther: DBXAuthAccessError {
    @objc
    public init() {
        let swift = Auth.AccessError.other
        super.init(swift: swift)
    }
}

/// Errors occurred during authentication.
@objc
public class DBXAuthAuthError: NSObject {
    let swift: Auth.AuthError

    public init(swift: Auth.AuthError) {
        self.swift = swift
    }

    public static func factory(swift: Auth.AuthError) -> DBXAuthAuthError {
        switch swift {
        case .invalidAccessToken:
            return DBXAuthAuthErrorInvalidAccessToken()
        case .invalidSelectUser:
            return DBXAuthAuthErrorInvalidSelectUser()
        case .invalidSelectAdmin:
            return DBXAuthAuthErrorInvalidSelectAdmin()
        case .userSuspended:
            return DBXAuthAuthErrorUserSuspended()
        case .expiredAccessToken:
            return DBXAuthAuthErrorExpiredAccessToken()
        case .missingScope(let swiftArg):
            let arg = DBXAuthTokenScopeError(swift: swiftArg)
            return DBXAuthAuthErrorMissingScope(arg)
        case .routeAccessDenied:
            return DBXAuthAuthErrorRouteAccessDenied()
        case .other:
            return DBXAuthAuthErrorOther()
        }
    }

    @objc
    public override var description: String { swift.description }

    @objc
    public var asInvalidAccessToken: DBXAuthAuthErrorInvalidAccessToken? {
        self as? DBXAuthAuthErrorInvalidAccessToken
    }

    @objc
    public var asInvalidSelectUser: DBXAuthAuthErrorInvalidSelectUser? {
        self as? DBXAuthAuthErrorInvalidSelectUser
    }

    @objc
    public var asInvalidSelectAdmin: DBXAuthAuthErrorInvalidSelectAdmin? {
        self as? DBXAuthAuthErrorInvalidSelectAdmin
    }

    @objc
    public var asUserSuspended: DBXAuthAuthErrorUserSuspended? {
        self as? DBXAuthAuthErrorUserSuspended
    }

    @objc
    public var asExpiredAccessToken: DBXAuthAuthErrorExpiredAccessToken? {
        self as? DBXAuthAuthErrorExpiredAccessToken
    }

    @objc
    public var asMissingScope: DBXAuthAuthErrorMissingScope? {
        self as? DBXAuthAuthErrorMissingScope
    }

    @objc
    public var asRouteAccessDenied: DBXAuthAuthErrorRouteAccessDenied? {
        self as? DBXAuthAuthErrorRouteAccessDenied
    }

    @objc
    public var asOther: DBXAuthAuthErrorOther? {
        self as? DBXAuthAuthErrorOther
    }
}

/// The access token is invalid.
@objc
public class DBXAuthAuthErrorInvalidAccessToken: DBXAuthAuthError {
    @objc
    public init() {
        let swift = Auth.AuthError.invalidAccessToken
        super.init(swift: swift)
    }
}

/// The user specified in 'Dropbox-API-Select-User' is no longer on the team.
@objc
public class DBXAuthAuthErrorInvalidSelectUser: DBXAuthAuthError {
    @objc
    public init() {
        let swift = Auth.AuthError.invalidSelectUser
        super.init(swift: swift)
    }
}

/// The user specified in 'Dropbox-API-Select-Admin' is not a Dropbox Business team admin.
@objc
public class DBXAuthAuthErrorInvalidSelectAdmin: DBXAuthAuthError {
    @objc
    public init() {
        let swift = Auth.AuthError.invalidSelectAdmin
        super.init(swift: swift)
    }
}

/// The user has been suspended.
@objc
public class DBXAuthAuthErrorUserSuspended: DBXAuthAuthError {
    @objc
    public init() {
        let swift = Auth.AuthError.userSuspended
        super.init(swift: swift)
    }
}

/// The access token has expired.
@objc
public class DBXAuthAuthErrorExpiredAccessToken: DBXAuthAuthError {
    @objc
    public init() {
        let swift = Auth.AuthError.expiredAccessToken
        super.init(swift: swift)
    }
}

/// The access token does not have the required scope to access the route.
@objc
public class DBXAuthAuthErrorMissingScope: DBXAuthAuthError {
    @objc
    public var missingScope: DBXAuthTokenScopeError

    @objc
    public init(_ arg: DBXAuthTokenScopeError) {
        self.missingScope = arg
        let swift = Auth.AuthError.missingScope(arg.swift)
        super.init(swift: swift)
    }
}

/// The route is not available to public.
@objc
public class DBXAuthAuthErrorRouteAccessDenied: DBXAuthAuthError {
    @objc
    public init() {
        let swift = Auth.AuthError.routeAccessDenied
        super.init(swift: swift)
    }
}

/// An unspecified error.
@objc
public class DBXAuthAuthErrorOther: DBXAuthAuthError {
    @objc
    public init() {
        let swift = Auth.AuthError.other
        super.init(swift: swift)
    }
}

/// Objective-C compatible InvalidAccountTypeError union
@objc
public class DBXAuthInvalidAccountTypeError: NSObject {
    let swift: Auth.InvalidAccountTypeError

    public init(swift: Auth.InvalidAccountTypeError) {
        self.swift = swift
    }

    public static func factory(swift: Auth.InvalidAccountTypeError) -> DBXAuthInvalidAccountTypeError {
        switch swift {
        case .endpoint:
            return DBXAuthInvalidAccountTypeErrorEndpoint()
        case .feature:
            return DBXAuthInvalidAccountTypeErrorFeature()
        case .other:
            return DBXAuthInvalidAccountTypeErrorOther()
        }
    }

    @objc
    public override var description: String { swift.description }

    @objc
    public var asEndpoint: DBXAuthInvalidAccountTypeErrorEndpoint? {
        self as? DBXAuthInvalidAccountTypeErrorEndpoint
    }

    @objc
    public var asFeature: DBXAuthInvalidAccountTypeErrorFeature? {
        self as? DBXAuthInvalidAccountTypeErrorFeature
    }

    @objc
    public var asOther: DBXAuthInvalidAccountTypeErrorOther? {
        self as? DBXAuthInvalidAccountTypeErrorOther
    }
}

/// Current account type doesn't have permission to access this route endpoint.
@objc
public class DBXAuthInvalidAccountTypeErrorEndpoint: DBXAuthInvalidAccountTypeError {
    @objc
    public init() {
        let swift = Auth.InvalidAccountTypeError.endpoint
        super.init(swift: swift)
    }
}

/// Current account type doesn't have permission to access this feature.
@objc
public class DBXAuthInvalidAccountTypeErrorFeature: DBXAuthInvalidAccountTypeError {
    @objc
    public init() {
        let swift = Auth.InvalidAccountTypeError.feature
        super.init(swift: swift)
    }
}

/// An unspecified error.
@objc
public class DBXAuthInvalidAccountTypeErrorOther: DBXAuthInvalidAccountTypeError {
    @objc
    public init() {
        let swift = Auth.InvalidAccountTypeError.other
        super.init(swift: swift)
    }
}

/// Objective-C compatible PaperAccessError union
@objc
public class DBXAuthPaperAccessError: NSObject {
    let swift: Auth.PaperAccessError

    public init(swift: Auth.PaperAccessError) {
        self.swift = swift
    }

    public static func factory(swift: Auth.PaperAccessError) -> DBXAuthPaperAccessError {
        switch swift {
        case .paperDisabled:
            return DBXAuthPaperAccessErrorPaperDisabled()
        case .notPaperUser:
            return DBXAuthPaperAccessErrorNotPaperUser()
        case .other:
            return DBXAuthPaperAccessErrorOther()
        }
    }

    @objc
    public override var description: String { swift.description }

    @objc
    public var asPaperDisabled: DBXAuthPaperAccessErrorPaperDisabled? {
        self as? DBXAuthPaperAccessErrorPaperDisabled
    }

    @objc
    public var asNotPaperUser: DBXAuthPaperAccessErrorNotPaperUser? {
        self as? DBXAuthPaperAccessErrorNotPaperUser
    }

    @objc
    public var asOther: DBXAuthPaperAccessErrorOther? {
        self as? DBXAuthPaperAccessErrorOther
    }
}

/// Paper is disabled.
@objc
public class DBXAuthPaperAccessErrorPaperDisabled: DBXAuthPaperAccessError {
    @objc
    public init() {
        let swift = Auth.PaperAccessError.paperDisabled
        super.init(swift: swift)
    }
}

/// The provided user has not used Paper yet.
@objc
public class DBXAuthPaperAccessErrorNotPaperUser: DBXAuthPaperAccessError {
    @objc
    public init() {
        let swift = Auth.PaperAccessError.notPaperUser
        super.init(swift: swift)
    }
}

/// An unspecified error.
@objc
public class DBXAuthPaperAccessErrorOther: DBXAuthPaperAccessError {
    @objc
    public init() {
        let swift = Auth.PaperAccessError.other
        super.init(swift: swift)
    }
}

/// Error occurred because the app is being rate limited.
@objc
public class DBXAuthRateLimitError: NSObject {
    /// The reason why the app is being rate limited.
    @objc
    public var reason: DBXAuthRateLimitReason { DBXAuthRateLimitReason(swift: swift.reason) }
    /// The number of seconds that the app should wait before making another request.
    @objc
    public var retryAfter: NSNumber { swift.retryAfter as NSNumber }

    @objc
    public init(reason: DBXAuthRateLimitReason, retryAfter: NSNumber) {
        self.swift = Auth.RateLimitError(reason: reason.swift, retryAfter: retryAfter.uint64Value)
    }

    let swift: Auth.RateLimitError

    public init(swift: Auth.RateLimitError) {
        self.swift = swift
    }

    @objc
    public override var description: String { swift.description }
}

/// Objective-C compatible RateLimitReason union
@objc
public class DBXAuthRateLimitReason: NSObject {
    let swift: Auth.RateLimitReason

    public init(swift: Auth.RateLimitReason) {
        self.swift = swift
    }

    public static func factory(swift: Auth.RateLimitReason) -> DBXAuthRateLimitReason {
        switch swift {
        case .tooManyRequests:
            return DBXAuthRateLimitReasonTooManyRequests()
        case .tooManyWriteOperations:
            return DBXAuthRateLimitReasonTooManyWriteOperations()
        case .other:
            return DBXAuthRateLimitReasonOther()
        }
    }

    @objc
    public override var description: String { swift.description }

    @objc
    public var asTooManyRequests: DBXAuthRateLimitReasonTooManyRequests? {
        self as? DBXAuthRateLimitReasonTooManyRequests
    }

    @objc
    public var asTooManyWriteOperations: DBXAuthRateLimitReasonTooManyWriteOperations? {
        self as? DBXAuthRateLimitReasonTooManyWriteOperations
    }

    @objc
    public var asOther: DBXAuthRateLimitReasonOther? {
        self as? DBXAuthRateLimitReasonOther
    }
}

/// You are making too many requests in the past few minutes.
@objc
public class DBXAuthRateLimitReasonTooManyRequests: DBXAuthRateLimitReason {
    @objc
    public init() {
        let swift = Auth.RateLimitReason.tooManyRequests
        super.init(swift: swift)
    }
}

/// There are currently too many write operations happening in the user's Dropbox.
@objc
public class DBXAuthRateLimitReasonTooManyWriteOperations: DBXAuthRateLimitReason {
    @objc
    public init() {
        let swift = Auth.RateLimitReason.tooManyWriteOperations
        super.init(swift: swift)
    }
}

/// An unspecified error.
@objc
public class DBXAuthRateLimitReasonOther: DBXAuthRateLimitReason {
    @objc
    public init() {
        let swift = Auth.RateLimitReason.other
        super.init(swift: swift)
    }
}

/// Objective-C compatible TokenFromOAuth1Arg struct
@objc
public class DBXAuthTokenFromOAuth1Arg: NSObject {
    /// The supplied OAuth 1.0 access token.
    @objc
    public var oauth1Token: String { swift.oauth1Token }
    /// The token secret associated with the supplied access token.
    @objc
    public var oauth1TokenSecret: String { swift.oauth1TokenSecret }

    @objc
    public init(oauth1Token: String, oauth1TokenSecret: String) {
        self.swift = Auth.TokenFromOAuth1Arg(oauth1Token: oauth1Token, oauth1TokenSecret: oauth1TokenSecret)
    }

    let swift: Auth.TokenFromOAuth1Arg

    public init(swift: Auth.TokenFromOAuth1Arg) {
        self.swift = swift
    }

    @objc
    public override var description: String { swift.description }
}

/// Objective-C compatible TokenFromOAuth1Error union
@objc
public class DBXAuthTokenFromOAuth1Error: NSObject {
    let swift: Auth.TokenFromOAuth1Error

    public init(swift: Auth.TokenFromOAuth1Error) {
        self.swift = swift
    }

    public static func factory(swift: Auth.TokenFromOAuth1Error) -> DBXAuthTokenFromOAuth1Error {
        switch swift {
        case .invalidOauth1TokenInfo:
            return DBXAuthTokenFromOAuth1ErrorInvalidOauth1TokenInfo()
        case .appIdMismatch:
            return DBXAuthTokenFromOAuth1ErrorAppIdMismatch()
        case .other:
            return DBXAuthTokenFromOAuth1ErrorOther()
        }
    }

    @objc
    public override var description: String { swift.description }

    @objc
    public var asInvalidOauth1TokenInfo: DBXAuthTokenFromOAuth1ErrorInvalidOauth1TokenInfo? {
        self as? DBXAuthTokenFromOAuth1ErrorInvalidOauth1TokenInfo
    }

    @objc
    public var asAppIdMismatch: DBXAuthTokenFromOAuth1ErrorAppIdMismatch? {
        self as? DBXAuthTokenFromOAuth1ErrorAppIdMismatch
    }

    @objc
    public var asOther: DBXAuthTokenFromOAuth1ErrorOther? {
        self as? DBXAuthTokenFromOAuth1ErrorOther
    }
}

/// Part or all of the OAuth 1.0 access token info is invalid.
@objc
public class DBXAuthTokenFromOAuth1ErrorInvalidOauth1TokenInfo: DBXAuthTokenFromOAuth1Error {
    @objc
    public init() {
        let swift = Auth.TokenFromOAuth1Error.invalidOauth1TokenInfo
        super.init(swift: swift)
    }
}

/// The authorized app does not match the app associated with the supplied access token.
@objc
public class DBXAuthTokenFromOAuth1ErrorAppIdMismatch: DBXAuthTokenFromOAuth1Error {
    @objc
    public init() {
        let swift = Auth.TokenFromOAuth1Error.appIdMismatch
        super.init(swift: swift)
    }
}

/// An unspecified error.
@objc
public class DBXAuthTokenFromOAuth1ErrorOther: DBXAuthTokenFromOAuth1Error {
    @objc
    public init() {
        let swift = Auth.TokenFromOAuth1Error.other
        super.init(swift: swift)
    }
}

/// Objective-C compatible TokenFromOAuth1Result struct
@objc
public class DBXAuthTokenFromOAuth1Result: NSObject {
    /// The OAuth 2.0 token generated from the supplied OAuth 1.0 token.
    @objc
    public var oauth2Token: String { swift.oauth2Token }

    @objc
    public init(oauth2Token: String) {
        self.swift = Auth.TokenFromOAuth1Result(oauth2Token: oauth2Token)
    }

    let swift: Auth.TokenFromOAuth1Result

    public init(swift: Auth.TokenFromOAuth1Result) {
        self.swift = swift
    }

    @objc
    public override var description: String { swift.description }
}

/// Objective-C compatible TokenScopeError struct
@objc
public class DBXAuthTokenScopeError: NSObject {
    /// The required scope to access the route.
    @objc
    public var requiredScope: String { swift.requiredScope }

    @objc
    public init(requiredScope: String) {
        self.swift = Auth.TokenScopeError(requiredScope: requiredScope)
    }

    let swift: Auth.TokenScopeError

    public init(swift: Auth.TokenScopeError) {
        self.swift = swift
    }

    @objc
    public override var description: String { swift.description }
}
