﻿using System;
using System.Runtime.Loader;
using BoDi;
using Deveroom.VisualStudio.SpecFlowConnector.Discovery.V30;
using TechTalk.SpecFlow.Infrastructure;
using TechTalk.SpecFlow.Plugins;

namespace Deveroom.VisualStudio.SpecFlowConnector.Discovery.V31
{
    public class SpecFlowV31Discoverer : SpecFlowV30P220Discoverer
    {
        public SpecFlowV31Discoverer(AssemblyLoadContext loadContext) : base(loadContext)
        {
        }

        protected override DefaultDependencyProvider CreateDefaultDependencyProvider()
        {
            return new SpecFlowV31DependencyProvider(_loadContext);
        }

        class SpecFlowV31DependencyProvider : NoInvokeDependencyProvider
        {
            private readonly AssemblyLoadContext _loadContext;

            public SpecFlowV31DependencyProvider(AssemblyLoadContext loadContext)
            {
                _loadContext = loadContext;
            }

            public override void RegisterGlobalContainerDefaults(ObjectContainer globalContainer)
            {
                base.RegisterGlobalContainerDefaults(globalContainer);
                globalContainer.RegisterInstanceAs(_loadContext);
                globalContainer.RegisterTypeAs<LoadContextPluginLoader, IRuntimePluginLoader>();
            }
        }
    }
}
