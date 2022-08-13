//
//  DeploymentTarget.swift
//  ConqreteNamespace
//
//  Created by stilltimm on 13/08/2022.
//  Copyright © 2022 com.conqrete. All rights reserved.
//

import ProjectDescription

extension DeploymentTarget {

    public static func iOS_14_iPhone() -> DeploymentTarget {
        return DeploymentTarget.iOS(targetVersion: "14.0", devices: .iphone)
    }
}
