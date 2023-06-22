///
/// Copyright (c) 2022 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

import Foundation
import SwiftyDropbox

/// Objective-C compatible routes for the account namespace
/// For Swift routes see AccountRoutes
@objc
public class DBXAccountRoutes: NSObject {
    private let swift: AccountRoutes
    init(swift: AccountRoutes) {
        self.swift = swift
        self.client = swift.client.objc
    }

    public let client: DBXDropboxTransportClient

    /// Sets a user's profile photo.
    ///
    /// - scope: account_info.write
    ///
    /// - parameter photo: Image to set as the user's new profile photo.
    ///
    /// - returns: Through the response callback, the caller will receive a `Account.SetProfilePhotoResult` object on
    /// success or a `Account.SetProfilePhotoError` object on failure.
    @objc
    @discardableResult public func setProfilePhoto(photo: DBXAccountPhotoSourceArg) -> DBXAccountSetProfilePhotoRpcRequest {
        let swift = swift.setProfilePhoto(photo: photo.swift)
        return DBXAccountSetProfilePhotoRpcRequest(swift: swift)
    }
}

@objc
public class DBXAccountSetProfilePhotoRpcRequest: NSObject, DBXRequest {
    var swift: RpcRequest<Account.SetProfilePhotoResultSerializer, Account.SetProfilePhotoErrorSerializer>

    init(swift: RpcRequest<Account.SetProfilePhotoResultSerializer, Account.SetProfilePhotoErrorSerializer>) {
        self.swift = swift
    }

    @objc
    @discardableResult public func response(
        completionHandler: @escaping (DBXAccountSetProfilePhotoResult?, DBXAccountSetProfilePhotoError?, DBXCallError?) -> Void
    ) -> Self {
        response(queue: nil, completionHandler: completionHandler)
    }

    @objc
    @discardableResult public func response(
        queue: DispatchQueue?,
        completionHandler: @escaping (DBXAccountSetProfilePhotoResult?, DBXAccountSetProfilePhotoError?, DBXCallError?) -> Void
    ) -> Self {
        swift.response(queue: queue) { result, error in
            var routeError: DBXAccountSetProfilePhotoError?
            var callError: DBXCallError?
            switch error {
            case .routeError(let box, _, _, _):
                routeError = DBXAccountSetProfilePhotoError(swift: box.unboxed)
                callError = nil
            default:
                routeError = nil
                callError = error?.objc
            }

            var objc: DBXAccountSetProfilePhotoResult?
            if let swift = result {
                objc = DBXAccountSetProfilePhotoResult(swift: swift)
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
