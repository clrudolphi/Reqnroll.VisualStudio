﻿Feature: Discovery - SpecFlow version compatibility

Scenario Outline: Discover bindings from a SpecFlow project on .NET Framework
	Given there is a simple SpecFlow project for <version>
	And the project is built
	When the binding discovery performed
	Then the discovery succeeds with several step definitions
	And the step definitions contain source file and line
Examples: 
	| case      | version  |
	| line-v3.6 | v3.6.23  |
	| line-v3.5 | v3.5.14  |
	| line-v3.4 | v3.4.31  |
	| line-v3.3 | v3.3.74  |
	| line-v3.1 | v3.1.97  |
	| line-v3.0 | v3.0.225 |
	| line-v2.4 | v2.4.1   |
	| line-v2.3 | v2.3.2   |
	| line-v2.2 | v2.2.1   |
	| line-v2.1 | v2.1.0   |
	| line-v2.0 | v2.0.0   |
	| line-v1.9 | v1.9.0   |

Scenario Outline: Discover bindings from a SpecFlow project on .NET Core
	Given there is a simple SpecFlow project for <version>
	And the project format is new
	And the target framework is netcoreapp2.1
	And the project is built
	When the binding discovery performed
	Then the discovery succeeds with several step definitions
Examples: 
	| case      | version |
	| line-v3.6 | v3.6.23 |
	| line-v3.5 | v3.5.14 |
	| line-v3.4 | v3.4.31 |
	| line-v3.3 | v3.3.74 |
