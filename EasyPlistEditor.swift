//
//  EasyPlistEditor.swift
//  SwiftSampleFileManager
//
//  Created by Nadeeshan Jayawardana on 9/3/17.
//  Copyright © 2017 Nadeeshan Jayawardana (NEngineering). All rights reserved.
//

import UIKit

class EasyPlistEditor: NSObject {
    
    private var plistFileName = ""
    private var fileError = NSString()
    
    required init(plistName: NSString) {
        super.init()
        if plistName.length > 0 {
            plistFileName = plistName.appending(".plist") as String
            validatePlistFileDestinations()
        } else {
            print("Error: .plist name cannot be empty")
        }
    }
    
    // Validate .plist file path
    func validatePlistFileDestinations() {
        if !plistFileName.isEmpty {
            let fileManager = FileManager.default
            let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) [0].appending("/").appending(plistFileName)
            if !fileManager.fileExists(atPath: destinationPath) {
                let sourcePath = Bundle.main.resourcePath?.appending("/" + plistFileName)
                do {
                    try fileManager.copyItem(atPath: sourcePath!, toPath: destinationPath)
                } catch let error as NSError {
                    fileError = error.localizedDescription as NSString
                    print("Error: \(error)")
                }
            }
        } else {
            print("Error: .plist name cannot be nil")
        }
    }
    
    // Read .plist file function
    func readPlistFile() -> NSDictionary {
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) [0].appending("/").appending(plistFileName)
        return NSDictionary(contentsOfFile: destinationPath)!
    }
    
    // Write .plist file function
    func writePlistFileWithDictionary(source: NSDictionary) {
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) [0].appending("/").appending(plistFileName)
        source.write(toFile: destinationPath, atomically: true)
    }
    
    // return values using keys that exist within .plist file
    func dictionaryObjectForKey(source: NSDictionary, key: NSString) throws -> AnyObject {
        return source.object(forKey: key) as AnyObject
    }
    
    // Read Array Value From .plist resource
    func getArrayWithKey(key: NSString) -> NSArray {
        if fileError.length == 0 {
            if key.length > 0 {
                let source = readPlistFile()
                do {
                    let resource = try dictionaryObjectForKey(source: source, key: key)
                    if ((resource as? NSArray) != nil) {
                        return resource as! NSArray
                    }
                } catch let error as NSError {
                    print("Error: \(error)")
                }
            }
        }
        return []
    }
    
    // Read Dictionary Value From .plist resource
    func getDictionaryWithKey(key: NSString) -> NSDictionary {
        if fileError.length == 0 {
            if key.length > 0 {
                let source = readPlistFile()
                do {
                    let resource = try dictionaryObjectForKey(source: source, key: key)
                    if ((resource as? NSDictionary) != nil) {
                        return resource as! NSDictionary
                    }
                } catch let error as NSError {
                    print("Error: \(error)")
                }
            }
        }
        return [:]
    }
    
    // Read Boolean Value From .plist resource
    func getBooleanWithKey(key: NSString) -> Bool {
        if fileError.length == 0 {
            if key.length > 0 {
                let source = readPlistFile()
                do {
                    let resource = try dictionaryObjectForKey(source: source, key: key)
                    if ((resource as? Bool) != nil) {
//                        return resource as! integer_t > 0 ? true : false
                        return resource as! Bool
                    }
                } catch let error as NSError {
                    print("Error: \(error)")
                }
            }
        }
        return false
    }
    
    // Read Data Value From .plist resource
    func getDataWithKey(key: NSString) -> NSData {
        if fileError.length == 0 {
            if key.length > 0 {
                let source = readPlistFile()
                do {
                    let resource = try dictionaryObjectForKey(source: source, key: key)
                    if ((resource as? NSData) != nil) {
                        return resource as! NSData
                    }
                } catch let error as NSError {
                    print("Error: \(error)")
                }
            }
        }
        return NSData()
    }
    
    // Read Date Value From .plist resource
    func getDateWithKey(key: NSString) -> NSDate {
        if fileError.length == 0 {
            if key.length > 0 {
                let source = readPlistFile()
                do {
                    let resource = try dictionaryObjectForKey(source: source, key: key)
                    if ((resource as? NSDate) != nil) {
                        return resource as! NSDate
                    }
                } catch let error as NSError {
                    print("Error: \(error)")
                }
            }
        }
        return NSDate()
    }
    
    // Read Number Value From .plist resource
    func getNumberWithKey(key: NSString) -> NSNumber {
        if fileError.length == 0 {
            if key.length > 0 {
                let source = readPlistFile()
                // handel errors when return values using keys that doesnot exist within .plist file
                do {
                    let resource = try dictionaryObjectForKey(source: source, key: key)
                    if ((resource as? NSNumber) != nil) {
                        return resource as! NSNumber
                    }
                } catch let error as NSError {
                    print("Error: \(error)")
                }
            }
        }
        return 0;
    }
    
    // Read String Value From .plist resource
    func getStringWithKey(key: NSString) -> NSString {
        if fileError.length == 0 {
            if key.length > 0 {
                let source = readPlistFile()
                // handel errors when return values using keys that doesnot exist within .plist file
                do {
                    let resource = try dictionaryObjectForKey(source: source, key: key)
                    if ((resource as? String) != nil) {
                        return resource as! NSString
                    }
                } catch let error as NSError {
                    print("Error: \(error)")
                }
            }
        }
        return NSString()
    }
    
    // Write Array Value to .plist resource
    func setArray(value: NSArray, key: NSString) -> Bool {
        if fileError.length == 0 {
            if key.length > 0 && value.count > 0 {
                let resource = NSMutableDictionary(dictionary: readPlistFile())
                resource.setValue(value, forKey: key as String)
                writePlistFileWithDictionary(source: resource)
                return true;
            }
            print("Error: Null parameters not acceptable")
        }
        return false
    }
    
    // Write Dictionary Value to .plist resource
    func setDictionary(value: NSDictionary, key: NSString) -> Bool {
        if fileError.length == 0 {
            if key.length > 0 && value.count > 0 {
                let resource = NSMutableDictionary(dictionary: readPlistFile())
                resource.setValue(value, forKey: key as String)
                writePlistFileWithDictionary(source: resource)
                return true;
            }
            print("Error: Null parameters not acceptable")
        }
        return false
    }
    
    // Write Boolean Value to .plist resource
    func setBoolean(value: Bool, key: NSString) -> Bool {
        if fileError.length == 0 {
            if key.length > 0 {
                let resource = NSMutableDictionary(dictionary: readPlistFile())
                resource.setValue(value, forKey: key as String)
                writePlistFileWithDictionary(source: resource)
                return true;
            }
            print("Error: Null parameters not acceptable")
        }
        return false
    }
    
    // Write Data Value to .plist resource
    func setData(value: NSData, key: NSString) -> Bool {
        if fileError.length == 0 {
            if key.length > 0 {
                let resource = NSMutableDictionary(dictionary: readPlistFile())
                resource.setValue(value, forKey: key as String)
                writePlistFileWithDictionary(source: resource)
                return true;
            }
            print("Error: Null parameters not acceptable")
        }
        return false
    }
    
    // Write Date Value to .plist resource
    func setDate(value: NSDate, key: NSString) -> Bool {
        if fileError.length == 0 {
            if key.length > 0 {
                let resource = NSMutableDictionary(dictionary: readPlistFile())
                resource.setValue(value, forKey: key as String)
                writePlistFileWithDictionary(source: resource)
                return true;
            }
            print("Error: Null parameters not acceptable")
        }
        return false
    }
    
    // Write Number Value to .plist resource
    func setNumber(value: NSNumber, key: NSString) -> Bool {
        if fileError.length == 0 {
            if key.length > 0 {
                let resource = NSMutableDictionary(dictionary: readPlistFile())
                resource.setValue(value, forKey: key as String)
                writePlistFileWithDictionary(source: resource)
                return true;
            }
            print("Error: Null parameters not acceptable")
        }
        return false
    }
    
    // Write String Value to .plist resource
    func setString(value: NSString, key: NSString) -> Bool {
        if fileError.length == 0 {
            if key.length > 0 && value.length > 0 {
                let resource = NSMutableDictionary(dictionary: readPlistFile())
                resource.setValue(value, forKey: key as String)
                writePlistFileWithDictionary(source: resource)
                return true;
            }
            print("Error: Null parameters not acceptable")
        }
        return false
    }
}
