//
//  Target.swift
//  ConqreteNamespace
//
//  Created by stilltimm on 13/08/2022.
//  Copyright © 2022 com.conqrete. All rights reserved.
//

import ProjectDescription

extension Target {

    // MARK: - Public Type Methods

    public static func frameworkTarget() -> Target {
        return makeTarget(
            name: ProjectConstants.frameworkTargetName,
            product: .framework,
            bundleId: ProjectConstants.frameworkBundleID,
            hasResources: false,
            hasHeaders: false,
            hasEntitlements: false,
            scripts: [
                .tuistLint(targetName: ProjectConstants.frameworkTargetName)
            ],
            dependencies: .frameworkDependencies(),
            settings: .anyFrameworkSettings(onlyAllowAppExtensionAPI: false)
        )
    }

    public static func frameworkTestsTarget() -> Target {
        return makeUnitTestsTarget(
            testTargetName: ProjectConstants.frameworkTestsTargetName,
            bundleId: ProjectConstants.frameworkTestsBundleIdentifier,
            scripts: [
                .tuistLint(targetName: ProjectConstants.frameworkTestsTargetName)
            ],
            dependencies: [
                .target(name: ProjectConstants.frameworkTargetName)
            ],
            settings: .anyFrameworkSettings(onlyAllowAppExtensionAPI: false)
        )
    }

    // MARK: - Private Type Methods

    private static func makeTarget(
        name: String,
        product: Product,
        bundleId: String,
        hasResources: Bool,
        hasHeaders: Bool,
        hasEntitlements: Bool,
        scripts: [TargetScript],
        dependencies: [TargetDependency],
        settings: Settings
    ) -> Target {
        var resources: ResourceFileElements?
        if hasResources {
            resources = ["\(name)/Resources/**"]
        }

        var headers: Headers?
        if hasHeaders {
            headers = .headers(
                public: "\(name)/Headers/Public/**",
                private: "\(name)/Headers/Private/**",
                project: nil,
                exclusionRule: .publicExcludesPrivateAndProject
            )
        }

        var entitlementsPath: Path?
        if hasEntitlements {
            entitlementsPath = "\(name)/SupportFiles/\(name).entitlements"
        }

        return Target(
            name: name,
            platform: .iOS,
            product: product,
            bundleId: bundleId,
            deploymentTarget: .iOS_14_iPhone(),
            infoPlist: .file(path: "\(name)/SupportFiles/Info.plist"),
            sources: ["\(name)/Sources/**/*.swift"],
            resources: resources,
            headers: headers,
            entitlements: entitlementsPath,
            scripts: scripts,
            dependencies: dependencies,
            settings: settings
        )
    }

    private static func makeUnitTestsTarget(
        testTargetName: String,
        bundleId: String,
        scripts: [TargetScript],
        dependencies: [TargetDependency],
        settings: Settings
    ) -> Target {
        return Target(
            name: testTargetName,
            platform: .iOS,
            product: .unitTests,
            bundleId: bundleId,
            deploymentTarget: .iOS_14_iPhone(),
            sources: ["\(testTargetName)/Sources/**/*.swift"],
            scripts: scripts,
            dependencies: dependencies
        )
    }
}
