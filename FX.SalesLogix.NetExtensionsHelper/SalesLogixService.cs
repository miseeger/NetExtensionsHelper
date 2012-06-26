using Sage.SalesLogix.NetExtensions;
using Sage.SalesLogix.NetExtensions.Licensing;
using Sage.SalesLogix.NetExtensions.SalesLogix;

namespace FX.SalesLogix.NetExtensionsHelper
{

	public class ServiceResult
	{
		
		public const string Result_Ok = "OK";

		public string Message { get; set; }
		public string Exception { get; set; }
		public string Result { get; set; }
		public bool WithError { get; set; }
		
		public ServiceResult()
		{
			WithError = false;
			Result = Result_Ok;
		}
 
	}

	
	
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
        /// Object Initialization
        /// </summary>
        /// <param name="slxApplication">SLX Application object</param>
        /// <param name="licenseKeyManager">License key</param>
        public void Initialize(ISlxApplication slxApplication, ILicenseKeyManager licenseKeyManager)
        {
            SlxApplication      = slxApplication;
            LicenseKeyManager   = licenseKeyManager;
            ExtensionProperties = new ExtensionProperties();
            InitializeService();
        }


        /// <summary>
        /// Receives am argument Array of objects and forwards it to
        /// set the ExtensionProperties. If the arguments are identified
        /// as for a command to be executed they will again be forwarded to
        /// the command dispatcher to finally execute the service command.
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