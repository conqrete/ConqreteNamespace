# Conqrete Namespace

![release](https://img.shields.io/github/v/release/conqrete/ConqreteNamespace?display_name=tag&sort=date)
![build & test](https://img.shields.io/github/workflow/status/conqrete/ConqreteNamespace/Build%20&%20Test?label=build%20%26%20test)
![platforms](https://img.shields.io/badge/platforms-iOS-lightgrey.svg)
![license](https://img.shields.io/github/license/conqrete/ConqreteNamespace)

Bottommost layer of **Conqrete** family that contains just Conqrete namespace:

```Swift
public enum Conqrete {}
```

# Installation

## Tuist

To install ConqreteNamespace as a dependency for yout project via **Tuist**, you should first add this to dependencies list at `Dependencies.swift` like this:

```Swift
// Dependencies.swift

import ProjectDescription

let dependencies = Dependencies(
    // ...
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .remote(
                url: "https://github.com/conqrete/ConqreteNamespace",
                requirement: .upToNextMajor(from: "0.9.0")
            )
            // ...
        ],
        // ...
    ),
    // ...
)
```

> If your Tuist project does not have any dependencies yet, please follow [official Tuist's documentation for adding external dependencies](https://docs.tuist.io/guides/third-party-dependencies).

## SPM

Also, you could use pure **SPM** to install ConqreteNamespace. Modify your `Package.swift` to add:

```Swift
// Package.swift

let package = Package(
    // ...
    dependencies: [
        .package(url: "https://github.com/conqrete/ConqreteNamespace", .upToNextMajor(from: "0.9.0")),
        // ...
    ],
    // ...
)
```

# Usage

Tou should use `ConqreteNamespace` when building another `Conqrete`-family framework, and it introduces any kind of tooling or new Namespaces domain-independent namespace. These tools should be nested in `Conqrete`.

Example from `ConqreteAnalytics` framework:

```Swift
//
// AnalyticsTools.swift
// ConqreteAnalytics
// 

import ConqreteNamespace

public extension Conqrete {

    public enum AnalyticsTools {}
}

public extension Conqrete.AnalyticsTools {

    public static func someAnalyticsTool() {
        // ...
    }
}
```

So the calling site will use it via namespace as well: 

```Swift
import ConqreteAnalytics

Conqrete.AnalyticsTools.someAnalyticsTool()
```
