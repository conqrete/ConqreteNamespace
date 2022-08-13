//
//  TargetDependency.swift
//  ConqreteNamespace
//
//  Created by stilltimm on 13/08/2022.
//  Copyright © 2022 com.conqrete. All rights reserved.
//


import ProjectDescription

extension Array where Element == TargetDependency {

    public static func frameworkDependencies() -> [TargetDependency] {
        return []
    }
}
