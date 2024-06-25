import Flutter
import UIKit
import Foundation
import Vision
import CoreML

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    private let CHANNEL = "image_transfer_channel"
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        
        // Set up the MethodChannel with the same name as defined in Dart
                if let flutterViewController = window?.rootViewController as? FlutterViewController {
                    let methodChannel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: flutterViewController.binaryMessenger)
                    
                    methodChannel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult)  -> Void in
                        if call.method == "getDataFromNative" {
                            if let args = call.arguments as? Dictionary<String, Any>, 
                                let image = args["image"] as? String {
                                
                                // Perform platform-specific operations and obtain the result
                                //let data = self?.getDataFromNative(result: flutterResult, image: image)
                                let data = self?.getDataFromNative(image: image)
                                // Send the result back to Flutter
                                result(data)
                            } else {
                                result(FlutterError.init(code: "errorSet", message: "image field not found or invalid input format error.", details: nil))
                                return
                            }
                        } else {
                            result(FlutterMethodNotImplemented)
                            return
                        }
                    }
                }
        
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
//    private func getDataFromNative(result: FlutterResult, image: String) -> String {
    private func getDataFromNative(image: String) -> String {
        print("========testing!!!!!!!!!!!")
        return "Data from Native" + image
    }
}
