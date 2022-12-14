import System
import System.Diagnostics
import Cirrious.CrossCore.Platform

namespace $rootnamespace$
	
	public class DebugTrace implements IMvxTrace
		
		public method Trace, void
			level, MvxTraceLevel 
			tag, string 
			message, @Func<string> 
			endparams
		proc
			Debug.WriteLine(tag + ":" + level + ":" + message())
		endmethod
		
		public method Trace, void
			level, MvxTraceLevel 
			tag, string 
			message, string 
			endparams
		proc
			Debug.WriteLine(tag + ":" + level + ":" + message)
		endmethod
		
		public method Trace, void
			level, MvxTraceLevel 
			tag, string 
			message, string 
			in args, [#]@object 
			endparams
		proc
			try
			begin
				Debug.WriteLine(string.Format(tag + ":" + level + ":" + message, args))
			end
			catch (syn_exception, @FormatException)
			begin
				;TODO: Needs fixing
				;Trace(MvxTraceLevel.Error, tag, "Exception during trace of {0} {1} {2}", level, message)
			end
			endtry
		endmethod

	endclass

endnamespace
