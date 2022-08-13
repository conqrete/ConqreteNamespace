//
//  Project.swift
//  ConqreteNamespace
//
//  Created by stilltimm on 13/08/2022.
//  Copyright © 2022 com.conqrete. All rights reserved.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: ProjectConstants.projectName,
    organizationName: ProjectConstants.organizationName,
    options: .options(
        automaticSchemesOptions: .disabled,
        developmentRegion: "en",
        disableBundleAccessors: false,
        disableShowEnvironmentVarsInScriptPhases: false,
        disableSynthesizedResourceAccessors: false,
        textSettings: .textSettings(
            usesTabs: false,
            indentWidth: 4,
            tabWidth: 4,
            wrapsLines: false
        ),
        xcodeProjectName: ProjectConstants.projectName
    ),
    settings: .projectSettings(),
    targets: [
        .frameworkTarget(),
        .frameworkTestsTarget()
    ],
    schemes: [
        .frameworkScheme()
    ],
    additionalFiles: [],
    resourceSynthesizers: [
        .assets(),
        .strings(),
        .fonts()
    ]
)