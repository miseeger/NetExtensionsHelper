namespace FX.SalesLogix.NetExtensionsHelper
{
    public abstract class SlxServiceCommandDispatcher
    {
        protected abstract object DispatchServiceCommand(string command, object[] commandArgs);
        protected abstract void InitializeService();
    }

}