//
//  Config.swift
//  ConqreteNamespace
//
//  Created by stilltimm on 13/08/2022.
//  Copyright © 2022 com.conqrete. All rights reserved.
//

import ProjectDescription

let config = Config(
    swiftVersion: "5.5",
    plugins: [
        .git(url: "https://github.com/tuist/tuist-plugin-lint", tag: "0.3.0")
    ],
    generationOptions: .options(
        resolveDependenciesWithSystemScm: false,
        disablePackageVersionLocking: false
    )
)
