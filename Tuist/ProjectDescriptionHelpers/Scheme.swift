//
//  Scheme.swift
//  ConqreteNamespace
//
//  Created by stilltimm on 13/08/2022.
//  Copyright © 2022 com.conqrete. All rights reserved.
//

import ProjectDescription

extension Scheme {

    // MARK: - Public Type Methods

    public static func frameworkScheme() -> Scheme {
        return makeScheme(
            schemeName: ProjectConstants.frameworkTargetName,
            buildActionTargetReference: .framework(),
            testActionTargetReference: .frameworkTests()
        )
    }

    // MARK: - Private Type Methods

    static func makeScheme(
        schemeName: String,
        buildActionTargetReference: TargetReference,
        testActionTargetReference: TargetReference
    ) -> Scheme {
        let buildAction: BuildAction = .buildAction(
            targets: [buildActionTargetReference],
            preActions: [],
            postActions: [],
            runPostActionsOnFailure: false
        )
        let testableTarget: TestableTarget = TestableTarget(
            target: testActionTargetReference,
            parallelizable: true,
            randomExecutionOrdering: true
        )
        let testAction: TestAction = .targets(
            [
                testableTarget
            ],
            arguments: nil,
            configuration: .debug,
            attachDebugger: true,
            expandVariableFromTarget: buildActionTargetReference,
            preActions: [],
            postActions: [],
            options: .options(
                language: nil,
                region: nil,
                coverage: true,
                codeCoverageTargets: [buildActionTargetReference]
            ),
            diagnosticsOptions: [
                .mainThreadChecker
            ]
        )
        let analyzeAction: AnalyzeAction = .analyzeAction(configuration: .debug)
        let archiveAction: ArchiveAction = .archiveAction(
            configuration: .release,
            revealArchiveInOrganizer: true,
            customArchiveName: nil,
            preActions: [],
            postActions: []
        )

        return Scheme(
            name: schemeName,
            shared: true,
            hidden: false,
            buildAction: buildAction,
            testAction: testAction,
            runAction: nil,
            archiveAction: archiveAction,
            profileAction: nil,
            analyzeAction: analyzeAction
        )
    }
}
