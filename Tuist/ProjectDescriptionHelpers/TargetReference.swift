//
//  TargetReference.swift
//  ConqreteNamespace
//
//  Created by stilltimm on 13/08/2022.
//  Copyright © 2022 com.conqrete. All rights reserved.
//

import ProjectDescription

extension TargetReference {

    public static func framework() -> TargetReference {
        return TargetReference(projectPath: nil, target: ProjectConstants.frameworkTargetName)
    }

    public static func frameworkTests() -> TargetReference {
        return TargetReference(projectPath: nil, target: ProjectConstants.frameworkTestsTargetName)
    }
}
