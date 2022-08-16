//
//  Dependencies.swift
//  ConqreteNamespace
//
//  Created by stilltimm on 13/08/2022.
//  Copyright © 2022 com.conqrete. All rights reserved.
//

import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: SwiftPackageManagerDependencies(
        [],
        baseSettings: .dependenciesBaseSettings()
    ),
    platforms: [.iOS]
)

extension Settings {

    public static func defaultSettings(
        base baseSettings: SettingsDictionary = SettingsDictionary(),
        debug debugSettings: SettingsDictionary = SettingsDictionary(),
        release releaseSettings: SettingsDictionary = SettingsDictionary()
    ) -> Settings {
        let debugConfiguration = Configuration.debug(name: .debug, settings: debugSettings)
        let releaseConfiguration = Configuration.release(name: .release, settings: releaseSettings)
        return .settings(
            base: baseSettings,
            configurations: [
                debugConfiguration,
                releaseConfiguration
            ]
        )
    }

    public static func dependenciesBaseSettings() -> Settings {
        var baseSettings = SettingsDictionary()
            .swiftVersion("5.5")
        baseSettings["IPHONEOS_DEPLOYMENT_TARGET"] = "14.0"
        return .defaultSettings(
            base: baseSettings
        )
    }
}
