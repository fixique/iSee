//
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        setupCameraModule()
        checkKeychain()
        return true
    }

}

// MARK: - Configuration

private extension AppDelegate {

    func setupCameraModule() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let cameraVc = CameraModuleConfigurator().configure()
        window?.rootViewController = cameraVc
    }

    func checkKeychain() {
        guard !UserDefaults.standard.bool(forKey: "isFirstStart") else {
            return
        }
        UserDefaults.standard.set(true, forKey: "isFirstStart")
        DataStorage.shared.clear()
    }

}
