//
//  LiveErrorManager.swift
//  Live-IOS
//
//  Created by Kyle Chart on 22/02/2025.
//

import Foundation

enum LiveError: LocalizedError {
    case failedToSaveToKeyChain(OSStatus)
    case failedToDeleteKeyChainItem(OSStatus)
    case failedToUpdateKeyChainItem(OSStatus)
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .failedToSaveToKeyChain(let error):
            return "Failed To Save To Keychain: \(error)"
        case .failedToDeleteKeyChainItem(let error):
            return "Failed To Delete Keychain Item: \(error)"
        case .failedToUpdateKeyChainItem(let error):
            return "Failed To Update Keychain Item: \(error)"
        case .unknown(let error):
            return "Unknown Error: \(error)"
        }
    }
}
