//
//  SettingsDictionary.swift
//  ConqreteNamespace
//
//  Created by stilltimm on 13/08/2022.
//  Copyright © 2022 com.conqrete. All rights reserved.
//

import ProjectDescription

extension SettingsDictionary {

    func activeCompilationConditions(_ conditions: String...) -> SettingsDictionary {
        var result = self
        result["SWIFT_ACTIVE_COMPILATION_CONDITIONS"] = .array(conditions)
        return result
    }

    func gccPreprocessorDefinitions(_ conditions: String...) -> SettingsDictionary {
        var result = self
        result["GCC_PREPROCESSOR_DEFINITIONS"] = .array(conditions)
        return result
    }

    func currentLibraryVersion(_ version: String) -> SettingsDictionary {
        var result = self
        result["DYLIB_CURRENT_VERSION"] = .string(version)
        result["DYLIB_COMPATIBILITY_VERSION"] = .string(version)
        return result
    }

    func generateInfoPlistFile(_ generate: Bool) -> SettingsDictionary {
        var result = self
        result["GENERATE_INFOPLIST_FILE"] = generate ? .string("YES") : .string("NO")
        return result
    }

    func onlyAllowAppExtensionAPI(_ allow: Bool) -> SettingsDictionary {
        var result = self
        result["APPLICATION_EXTENSION_API_ONLY"] = allow ? .string("YES") : .string("NO")
        return result
    }

    /// Sets `"OTHER_LDFLAGS"` to flags
    func otherLinkerFlags(_ flags: String...) -> SettingsDictionary {
        var result = self
        result["OTHER_LDFLAGS"] = .array(flags)
        return result
    }
}
