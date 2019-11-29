//
//  Copyright © 2019 Vlad. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        setupCameraModule()
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

}
