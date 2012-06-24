using Sage.SalesLogix.NetExtensions;
using Sage.SalesLogix.NetExtensions.Licensing;
using Sage.SalesLogix.NetExtensions.SalesLogix;
using Slx.NetExtensions.Base;

namespace FX.SalesLogix.NetExtensionsHelper
{

	public abstract class SlxServiceCommandDispatcher
    {
        protected abstract object DispatchServiceCommand(string command, object[] commandArgs);
        protected abstract void InitializeService();
    }
	
	
    public abstract class SalesLogixService: SlxServiceCommandDispatcher, IRunnable
    {

        public ExtensionProperties ExtensionProperties = null;
        public ISlxApplication     SlxApplication      = null;
        public ILicenseKeyManager  LicenseKeyManager   = null;


        /// <summary>
        /// Initialisierung des Objekts (über Slx interne Extension-Creation)
        /// </summary>
        /// <param name="slxApplication">Das Application-Objekt von SalesLogix</param>
        /// <param name="licenseKeyManager">Der Lizenzschlüssel</param>
        public void Initialize(ISlxApplication slxApplication, ILicenseKeyManager licenseKeyManager)
        {
            SlxApplication      = slxApplication;
            LicenseKeyManager   = licenseKeyManager;
            ExtensionProperties = new ExtensionProperties();
            InitializeService();
        }


        /// <summary>
        /// Empfängt ein Kommando gekennzeichnetes Argument und reicht dies an
        /// die Extensionproperties weiter. Wird das Argument als Kommando 
        /// identifiziert, wird es an den ServiceCommand-Dispatcher weitergeleitet,
        /// der dieses dann schlussendlich ausführt.
        /// </summary>
        /// <param name="args"></param>
        /// <returns></returns>
        public object Run(object[] args)
        {
            object result = null;

            ExtensionProperties.SetProperties(args);

            if (ExtensionProperties.ExtensionState == ExtensionState.ExcuteCommand)
            {
                var res = (ServiceResult)DispatchServiceCommand(ExtensionProperties.Command, ExtensionProperties.CommandArgs);
                result = res.Result;
            }

            return result;
        }

    }
}