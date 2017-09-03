EasyPlistEditor is a class that create to insert custom .plist file to your iOS project where will copy to application resource directory when the first time application run and access the custom .plist file anywhere from your application to read or write. the custom .plist file will remain on your application resource until the application remove from device or reset the device. You can create NSArray, NSDictonary, Boolean, Data, Date, NSNumber, NSString variables within your custom .plist file and assign, use NSArray, NSDictonary, Boolean, Data, Date, NSNumber, NSString values anywhere your application.

To create your custom “.plist” file please follow this steps

1. Create a “.plist” file in your project or Import (Drag and drop to XCode project) the “SampleService-Info.plist” file to your project.

2. Import (Drag and drop to XCode project) “EasyPlistEditor.swift” file to your project.

************************* Read to custom “.plist” file **********************************

Use following methods to read values from your custom “.plist” file

	// Read Array value form .plist file
	// func getArrayWithKey(key: NSString) -> NSArray

    	Ex: var value = EasyPlistEditor(plistName: "SampleService-Info").getArrayWithKey(key: "SampleArrayVariable") // SampleArrayVariable is a declared NSArray variable within SampleService-Info where use in sample project

	// Read Dictionary value form .plist file
	// func getDictionaryWithKey(key: NSString) -> NSDictionary

    	Ex: var value = EasyPlistEditor(plistName: "SampleService-Info").getDictionaryWithKey(key: "SampleDictonaryVariable") // SampleDictonaryVariable is a declared NSDictionary variable within SampleService-Info where use in sample project

	// Read Boolean value form .plist file
	// func getBooleanWithKey(key: NSString) -> Bool

    	Ex: var value = EasyPlistEditor(plistName: "SampleService-Info").getBooleanWithKey(key: "SampleBooleanVariable") // SampleBooleanVariable is a declared Boolean variable within SampleService-Info where use in sample project

	// Read NSData value form .plist file
	// func getDataWithKey(key: NSString) -> NSData

    	Ex: var value = EasyPlistEditor(plistName: "SampleService-Info").getDataWithKey(key: "SampleDataVariable") // SampleDataVariable is a declared NSData variable within SampleService-Info where use in sample project

	// Read NSDate value form .plist file
	// func getDateWithKey(key: NSString) -> NSDate

    	Ex: var value = EasyPlistEditor(plistName: "SampleService-Info").getDateWithKey(key: "SampleDateVariable") // SampleDateVariable is a declared NSDate variable within SampleService-Info where use in sample project

	// Read NSNumber value form .plist file
	// func getNumberWithKey(key: NSString) -> NSNumber

    	Ex: var value = EasyPlistEditor(plistName: "SampleService-Info").getNumberWithKey(key: "SampleNumberVariable") // SampleNumberVariable is a declared NSNumber variable within SampleService-Info where use in sample project

	// Read NSString value form .plist file
	// func getStringWithKey(key: NSString) -> NSString

    	Ex: var value = EasyPlistEditor(plistName: "SampleService-Info").getStringWithKey(key: "SampleStringVariable") // SampleStringVariable is a declared NSString variable within SampleService-Info where use in sample project

*****************************************************************************************

************************* Write to custom “.plist” file *********************************

	// Write to NSArray variable in .plist file
	// func setArray(value: NSArray, key: NSString) -> Bool

    	Ex: let sampleValueArray = ["SampleValueChange_1", "SampleValueChange_2", "SampleValueChange_3"]
    	    let arrayStatues = EasyPlistEditor(plistName: "SampleService-Info").setArray(value: sampleValueArray as NSArray, key: "SampleArrayVariable")
    	    if arrayStatues {
              print("Array value successfully set to .plist file")
          }

	// SampleArrayVariable is a declared NSArray variable within SampleService-Info where use in sample project


	
	// Write to NSDictionary variable in .plist file
	// func setDictionary(value: NSDictionary, key: NSString) -> Bool

    	Ex: let SampleValueDictionary = ["SampleKey_1" : "SampleValueChange_1", "SampleKey_2" : "SampleValueChange_2", "SampleKey_3" : "SampleValueChange_3"]
    		  let dictionaryStatues = EasyPlistEditor(plistName: "SampleService-Info").setDictionary(value: SampleValueDictionary as NSDictionary, key: "SampleDictonaryVariable")
    		  if dictionaryStatues {
              print("Dictonary value successfully set to .plist file")
          } 

	// SampleDictonaryVariable is a declared NSDictionary variable within SampleService-Info where use in sample project



	// Write to Boolean variable in .plist file
	// func setBoolean(value: Bool, key: NSString) -> Bool

    	Ex: let booleanStatues = EasyPlistEditor(plistName: "SampleService-Info").setBoolean(value: plistBooleanSegmentedControl.selectedSegmentIndex > 0 ? false : true, key: "SampleBooleanVariable")
          if booleanStatues {
              print("Boolean value successfully set to .plist file")
          }

	// SampleBooleanVariable is a declared Boolean variable within SampleService-Info where use in sample project



	// Write to NSData variable in .plist file
	// func setData(value: NSData, key: NSString) -> Bool

    	Ex: let SampleData = Data(bytes: [UInt32](repeating: 0, count: 2048).map { _ in arc4random() }, count: 2048)
          let dataStatues = EasyPlistEditor(plistName: "SampleService-Info").setData(value: SampleData as NSData, key: "SampleDataVariable")
          if dataStatues {
             print("Data value successfully set to .plist file")
          }

	// SampleDataVariable is a declared NSData variable within SampleService-Info where use in sample project



	// Write to NSDate variable in .plist file
	// func setDate(value: NSDate, key: NSString) -> Bool

    	Ex: let dateStatues = EasyPlistEditor(plistName: "SampleService-Info").setDate(value: Date() as NSDate, key: "SampleDateVariable")
          if dateStatues {
              print("Date value successfully set to .plist file")
          }

	// SampleDateVariable is a declared NSDate variable within SampleService-Info where use in sample project


	
	// Write to NSNumber variable in .plist file
	// func setNumber(value: NSNumber, key: NSString) -> Bool

    	Ex: let numberStatues = EasyPlistEditor(plistName: "SampleService-Info").setNumber(value: NSNumber.init(value: Int32(plistNumberTextField.text!)!), key: "SampleNumberVariable")
          if numberStatues {
              print("Number value successfully set to .plist file")
          }

	// SampleNumberVariable is a declared NSNumber variable within SampleService-Info where use in sample project



	// Write to NSString variable in .plist file
	// func setString(value: NSString, key: NSString) -> Bool

    	Ex: let stringStatues = EasyPlistEditor(plistName: "SampleService-Info").setString(value: plistStringTextField.text! as NSString, key: "SampleStringVariable")
          if stringStatues {
              print("String value successfully set to .plist file")
          }

	// SampleStringVariable is a declared NSString variable within SampleService-Info where use in sample project

*****************************************************************************************

Created by Nadeeshan Jayawardana.
