//
//  ProjectConstants.swift
//  ConqreteNamespace
//
//  Created by stilltimm on 13/08/2022.
//  Copyright © 2022 com.conqrete. All rights reserved.
//

import Foundation
import ProjectDescription

public enum ProjectConstants {

    public static let currentProjectVersion: String = {
        let versionString = Environment[dynamicMember: "projectVersion"].getString(default: "1")
        return versionString.trimmingCharacters(in: .whitespacesAndNewlines)
    }()

    public static let developmentTeam: String = "TGW2AJCC32"
    public static let organizationName: String = "com.conqrete"

    public static let projectName: String = "ConqreteNamespace"

    public static let frameworkTargetName: String = projectName
    public static let frameworkBundleID: String = "\(organizationName).\(frameworkTargetName)"

    public static let frameworkTestsTargetName: String = "\(projectName)Tests"
    public static let frameworkTestsBundleIdentifier: String = "\(frameworkBundleID)Tests"
}