import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
        [GMSServices provideAPIKey:@"AIzaSyAgi-mJ7qnfOjmnnq9Vb-Hd85hW8vth1ms"];
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
