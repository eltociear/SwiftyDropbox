///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

import Foundation

/// Datatypes and serializers for the account namespace
public class Account {
    /// The PhotoSourceArg union
    public enum PhotoSourceArg: CustomStringConvertible {
        /// Image data in base64-encoded bytes.
        case base64Data(String)
        /// An unspecified error.
        case other

        public var description: String {
            do {
                return "\(SerializeUtil.prepareJSONForSerialization(try PhotoSourceArgSerializer().serialize(self)))"
            } catch {
                return "\(self)"
            }
        }
    }

    public class PhotoSourceArgSerializer: JSONSerializer {
        public init() {}
        public func serialize(_ value: PhotoSourceArg) throws -> JSON {
            switch value {
            case .base64Data(let arg):
                var d = try ["base64_data": Serialization._StringSerializer.serialize(arg)]
                d[".tag"] = .str("base64_data")
                return .dictionary(d)
            case .other:
                var d = [String: JSON]()
                d[".tag"] = .str("other")
                return .dictionary(d)
            }
        }

        public func deserialize(_ json: JSON) throws -> PhotoSourceArg {
            switch json {
            case .dictionary(let d):
                let tag = try Serialization.getTag(d)
                switch tag {
                case "base64_data":
                    let v = try Serialization._StringSerializer.deserialize(d["base64_data"] ?? .null)
                    return PhotoSourceArg.base64Data(v)
                case "other":
                    return PhotoSourceArg.other
                default:
                    return PhotoSourceArg.other
                }
            default:
                throw JSONSerializerError.deserializeError(type: PhotoSourceArg.self, json: json)
            }
        }
    }

    /// The SetProfilePhotoArg struct
    public class SetProfilePhotoArg: CustomStringConvertible {
        /// Image to set as the user's new profile photo.
        public let photo: Account.PhotoSourceArg
        public init(photo: Account.PhotoSourceArg) {
            self.photo = photo
        }

        public var description: String {
            do {
                return "\(SerializeUtil.prepareJSONForSerialization(try SetProfilePhotoArgSerializer().serialize(self)))"
            } catch {
                return "\(self)"
            }
        }
    }

    public class SetProfilePhotoArgSerializer: JSONSerializer {
        public init() {}
        public func serialize(_ value: SetProfilePhotoArg) throws -> JSON {
            let output = [
                "photo": try Account.PhotoSourceArgSerializer().serialize(value.photo),
            ]
            return .dictionary(output)
        }

        public func deserialize(_ json: JSON) throws -> SetProfilePhotoArg {
            switch json {
            case .dictionary(let dict):
                let photo = try Account.PhotoSourceArgSerializer().deserialize(dict["photo"] ?? .null)
                return SetProfilePhotoArg(photo: photo)
            default:
                throw JSONSerializerError.deserializeError(type: SetProfilePhotoArg.self, json: json)
            }
        }
    }

    /// The SetProfilePhotoError union
    public enum SetProfilePhotoError: CustomStringConvertible {
        /// File cannot be set as profile photo.
        case fileTypeError
        /// File cannot exceed 10 MB.
        case fileSizeError
        /// Image must be larger than 128 x 128.
        case dimensionError
        /// Image could not be thumbnailed.
        case thumbnailError
        /// Temporary infrastructure failure, please retry.
        case transientError
        /// An unspecified error.
        case other

        public var description: String {
            do {
                return "\(SerializeUtil.prepareJSONForSerialization(try SetProfilePhotoErrorSerializer().serialize(self)))"
            } catch {
                return "\(self)"
            }
        }
    }

    public class SetProfilePhotoErrorSerializer: JSONSerializer {
        public init() {}
        public func serialize(_ value: SetProfilePhotoError) throws -> JSON {
            switch value {
            case .fileTypeError:
                var d = [String: JSON]()
                d[".tag"] = .str("file_type_error")
                return .dictionary(d)
            case .fileSizeError:
                var d = [String: JSON]()
                d[".tag"] = .str("file_size_error")
                return .dictionary(d)
            case .dimensionError:
                var d = [String: JSON]()
                d[".tag"] = .str("dimension_error")
                return .dictionary(d)
            case .thumbnailError:
                var d = [String: JSON]()
                d[".tag"] = .str("thumbnail_error")
                return .dictionary(d)
            case .transientError:
                var d = [String: JSON]()
                d[".tag"] = .str("transient_error")
                return .dictionary(d)
            case .other:
                var d = [String: JSON]()
                d[".tag"] = .str("other")
                return .dictionary(d)
            }
        }

        public func deserialize(_ json: JSON) throws -> SetProfilePhotoError {
            switch json {
            case .dictionary(let d):
                let tag = try Serialization.getTag(d)
                switch tag {
                case "file_type_error":
                    return SetProfilePhotoError.fileTypeError
                case "file_size_error":
                    return SetProfilePhotoError.fileSizeError
                case "dimension_error":
                    return SetProfilePhotoError.dimensionError
                case "thumbnail_error":
                    return SetProfilePhotoError.thumbnailError
                case "transient_error":
                    return SetProfilePhotoError.transientError
                case "other":
                    return SetProfilePhotoError.other
                default:
                    return SetProfilePhotoError.other
                }
            default:
                throw JSONSerializerError.deserializeError(type: SetProfilePhotoError.self, json: json)
            }
        }
    }

    /// The SetProfilePhotoResult struct
    public class SetProfilePhotoResult: CustomStringConvertible {
        /// URL for the photo representing the user, if one is set.
        public let profilePhotoUrl: String
        public init(profilePhotoUrl: String) {
            stringValidator()(profilePhotoUrl)
            self.profilePhotoUrl = profilePhotoUrl
        }

        public var description: String {
            do {
                return "\(SerializeUtil.prepareJSONForSerialization(try SetProfilePhotoResultSerializer().serialize(self)))"
            } catch {
                return "\(self)"
            }
        }
    }

    public class SetProfilePhotoResultSerializer: JSONSerializer {
        public init() {}
        public func serialize(_ value: SetProfilePhotoResult) throws -> JSON {
            let output = [
                "profile_photo_url": try Serialization._StringSerializer.serialize(value.profilePhotoUrl),
            ]
            return .dictionary(output)
        }

        public func deserialize(_ json: JSON) throws -> SetProfilePhotoResult {
            switch json {
            case .dictionary(let dict):
                let profilePhotoUrl = try Serialization._StringSerializer.deserialize(dict["profile_photo_url"] ?? .null)
                return SetProfilePhotoResult(profilePhotoUrl: profilePhotoUrl)
            default:
                throw JSONSerializerError.deserializeError(type: SetProfilePhotoResult.self, json: json)
            }
        }
    }

    /// Stone Route Objects

    static let setProfilePhoto = Route(
        name: "set_profile_photo",
        version: 1,
        namespace: "account",
        deprecated: false,
        argSerializer: Account.SetProfilePhotoArgSerializer(),
        responseSerializer: Account.SetProfilePhotoResultSerializer(),
        errorSerializer: Account.SetProfilePhotoErrorSerializer(),
        attributes: RouteAttributes(
            auth: [.user],
            host: .api,
            style: .rpc
        )
    )
}
