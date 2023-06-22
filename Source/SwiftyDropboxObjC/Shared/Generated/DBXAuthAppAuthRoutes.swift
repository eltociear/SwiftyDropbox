///
/// Copyright (c) 2022 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

import Foundation
import SwiftyDropbox

/// Objective-C compatible routes for the auth namespace
/// For Swift routes see AuthAppAuthRoutes
@objc
public class DBXAuthAppAuthRoutes: NSObject {
    private let swift: AuthAppAuthRoutes
    init(swift: AuthAppAuthRoutes) {
        self.swift = swift
        self.client = swift.client.objc
    }

    public let client: DBXDropboxTransportClient

    /// Creates an OAuth 2.0 access token from the supplied OAuth 1.0 access token.
    ///
    /// - parameter oauth1Token: The supplied OAuth 1.0 access token.
    /// - parameter oauth1TokenSecret: The token secret associated with the supplied access token.
    ///
    /// - returns: Through the response callback, the caller will receive a `Auth.TokenFromOAuth1Result` object on
    /// success or a `Auth.TokenFromOAuth1Error` object on failure.
    @objc
    @discardableResult public func tokenFromOauth1(oauth1Token: String, oauth1TokenSecret: String) -> DBXAuthTokenFromOauth1RpcRequest {
        let swift = swift.tokenFromOauth1(oauth1Token: oauth1Token, oauth1TokenSecret: oauth1TokenSecret)
        return DBXAuthTokenFromOauth1RpcRequest(swift: swift)
    }
}

@objc
public class DBXAuthTokenFromOauth1RpcRequest: NSObject, DBXRequest {
    var swift: RpcRequest<Auth.TokenFromOAuth1ResultSerializer, Auth.TokenFromOAuth1ErrorSerializer>

    init(swift: RpcRequest<Auth.TokenFromOAuth1ResultSerializer, Auth.TokenFromOAuth1ErrorSerializer>) {
        self.swift = swift
    }

    @objc
    @discardableResult public func response(
        completionHandler: @escaping (DBXAuthTokenFromOAuth1Result?, DBXAuthTokenFromOAuth1Error?, DBXCallError?) -> Void
    ) -> Self {
        response(queue: nil, completionHandler: completionHandler)
    }

    @objc
    @discardableResult public func response(
        queue: DispatchQueue?,
        completionHandler: @escaping (DBXAuthTokenFromOAuth1Result?, DBXAuthTokenFromOAuth1Error?, DBXCallError?) -> Void
    ) -> Self {
        swift.response(queue: queue) { result, error in
            var routeError: DBXAuthTokenFromOAuth1Error?
            var callError: DBXCallError?
            switch error {
            case .routeError(let box, _, _, _):
                routeError = DBXAuthTokenFromOAuth1Error(swift: box.unboxed)
                callError = nil
            default:
                routeError = nil
                callError = error?.objc
            }

            var objc: DBXAuthTokenFromOAuth1Result?
            if let swift = result {
                objc = DBXAuthTokenFromOAuth1Result(swift: swift)
            }
            completionHandler(objc, routeError, callError)
        }
        return self
    }

    @objc
    public var clientPersistedString: String? { swift.clientPersistedString }

    @available(iOS 13.0, macOS 10.13, *)
    @objc
    public var earliestBeginDate: Date? { swift.earliestBeginDate }

    @objc
    public func persistingString(string: String?) -> Self {
        swift.persistingString(string: string)
        return self
    }

    @available(iOS 13.0, macOS 10.13, *)
    @objc
    public func settingEarliestBeginDate(date: Date?) -> Self {
        swift.settingEarliestBeginDate(date: date)
        return self
    }

    @objc
    public func cancel() {
        swift.cancel()
    }
}
