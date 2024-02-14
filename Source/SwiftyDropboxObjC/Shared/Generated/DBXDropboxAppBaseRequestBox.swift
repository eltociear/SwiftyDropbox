///
/// Copyright (c) 2022 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

import Foundation
import SwiftyDropbox

extension DropboxAppBaseRequestBox {
    var objc: DBXRequest {
        switch self {
        case .getThumbnailV2(let swift):
            return DBXFilesGetThumbnailDownloadRequestFileV2(swift: swift)
        default:
            fatalError("For Obj-C compatibility, add this route to the Objective-C compatibility module allow-list")
        }
    }
}
