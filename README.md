<h1>.NET Extension Helper</h1>

The .NET Extension Helper is a library that will do all the heavy lifting to embed controls in SalesLogix. All you do is have your UserControl inherit from the FX.SalesLogix.NetExtensionsHelper.SalesLogixControl and then use a script class in SalesLogix to load the control and set the record context.

This fork adds some enhancements to the original .NET Extension Helper classes like the capability to create .NET Extension Services which just run certain dotNet functionalities which are dispatched by the Command Dispatcher of the service. This could be sending an E-Mail or logging an Event using NLog or Log4Net, etc. In order to achieve that functionality the ExtensionProperties.SetProperties had to be extended. Furthermore the resize capability for UserControls was added in a style like ExtensionService commands are called. The VBS Script Helper for Controls was as well extended as the VBS Script Helper for ExtensionServices was added.

An example project for SLX.NET ExtensionServices will follow!

To have a short tutorial on how to create a SalesLogixControl have a look at <a href="https://github.com/CustomerFX/NetExtensionsHelper">the original project on github</a>.
