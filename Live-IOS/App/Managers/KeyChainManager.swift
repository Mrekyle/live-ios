//
//  KeyChainManager.swift
//  Live-IOS
//
//  Created by Kyle Chart on 22/02/2025.
//

import Foundation

import Foundation
import Security

class KeyChainManager {
    
    ///Save items to the keyChain
    static func save(_ data: Data, service: String, account: String) throws {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecValueData as String: data as AnyObject,
            kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlock
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status == errSecDuplicateItem {
            let updateQuery: [String: AnyObject] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrService as String: service as AnyObject,
                kSecAttrAccount as String: account as AnyObject
            ]
            
            let attributesToUpdate: [String: AnyObject] = [
                kSecValueData as String: data as AnyObject
            ]
            
            let updateStatus = SecItemUpdate(updateQuery as CFDictionary, attributesToUpdate as CFDictionary)
            
            guard updateStatus == errSecSuccess else {
                throw LiveError.failedToUpdateKeyChainItem(OSStatus())
            }
        } else if status != errSecSuccess {
            throw LiveError.failedToSaveToKeyChain(OSStatus())
        }
    }
    
    ///Retreive items from the keychain
    static func retreive(service: String, account: String) throws -> Data {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecReturnData as String: kCFBooleanTrue,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        guard status == errSecSuccess else {
//            throw status == errSecItemNotFound ? OnarkenError.itemNotFound : OnarkenError.unknown(status)
        }
        
        guard let data = result as? Data else {
//            throw LiveError.unknown(status)
        }
        
        return data
    }
    
    ///Delete a single item in the keychain
    static func delete(service: String, account: String) throws {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        guard status == errSecSuccess || status == errSecItemNotFound else {
//            throw OnarkenError.failedToDelete(status)
        }
    }
    
    ///Delete all items inside of the keychain
    static func deleteAll(forService service: String) throws {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        guard status == errSecSuccess || status == errSecItemNotFound else {
//            throw OnarkenError.failedToDelete(status)
        }
    }
}
