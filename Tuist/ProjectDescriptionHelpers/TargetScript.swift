//
//  TargetScript.swift
//  ConqreteNamespace
//
//  Created by stilltimm on 13/08/2022.
//  Copyright © 2022 com.conqrete. All rights reserved.
//

import ProjectDescription

extension TargetScript {

    public static func tuistLint(targetName: String) -> TargetScript {
        return .post(
            script: """
            if command -v tuist &> /dev/null
            then
              echo "Tuist found, will lint project"
              tuist lint \(targetName)
            else
              echo "Tuist could not be found, will skip linting project"
            fi
            """,
            name: "Tuist Lint If Available",
            runForInstallBuildsOnly: false
        )
    }
}
