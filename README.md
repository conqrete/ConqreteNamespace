# Conqrete Namespace

![release](https://img.shields.io/github/v/release/conqrete/ConqreteNamespace?display_name=tag&sort=date)
![build & test](https://img.shields.io/github/workflow/status/conqrete/ConqreteNamespace/Build%20&%20Test?label=build%20%26%20test)
![platforms](https://img.shields.io/badge/platforms-iOS-lightgrey.svg)
![license](https://img.shields.io/github/license/conqrete/ConqreteNamespace)

Bottommost layer of **Conqrete** family that contains just Conqrete namespace:

```Swift
public enum Conqrete {}
```

## When to use

Use this dependency when building another Conqrete family framework that should introduce any kind of tooling or new Namespaces. These tools should be nested in `Conqrete` namespace like this:

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