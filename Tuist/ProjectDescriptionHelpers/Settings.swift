//
//  Settings.swift
//  ConqreteNamespace
//
//  Created by stilltimm on 13/08/2022.
//  Copyright © 2022 com.conqrete. All rights reserved.
//

import ProjectDescription

extension Settings {

    // MARK: - Public Type Methods

    public static func projectSettings() -> Settings {
        let baseSettings = SettingsDictionary()
            .developmentTeam(ProjectConstants.developmentTeam)
            .swiftVersion("5.6")
            .appleGenericVersioningSystem()
            .currentProjectVersion(ProjectConstants.currentProjectVersion)
        let debugSettings = SettingsDictionary()
            .activeCompilationConditions("DEBUG")
            .gccPreprocessorDefinitions("DEBUG=1")
        let releaseSettings = SettingsDictionary()
            .swiftOptimizationLevel(.o)
            .swiftCompilationMode(.wholemodule)
            .activeCompilationConditions("RELEASE")
            .gccPreprocessorDefinitions("RELEASE=1")
        return .makeSettings(
            base: baseSettings,
            debug: debugSettings,
            release: releaseSettings
        )
    }

    public static func anyFrameworkSettings(onlyAllowAppExtensionAPI: Bool) -> Settings {
        let baseSettings = SettingsDictionary()
            .currentProjectVersion(ProjectConstants.currentProjectVersion)
            .currentLibraryVersion(ProjectConstants.currentProjectVersion)
            .automaticCodeSigning(devTeam: ProjectConstants.developmentTeam)
            .onlyAllowAppExtensionAPI(onlyAllowAppExtensionAPI)
        return .makeSettings(base: baseSettings)
    }

    // MARK: - Private Type Methods

    private static func makeSettings(
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
}
