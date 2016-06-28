package;

#if cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#end

#if (android && openfl)
import openfl.utils.JNI;
#end


class Extension_swrve {
	
	
	public static function initializeSwrve (appId:Int, apiKey:String, userId:String, appVersion:String):Void {

		#if (android || ios || cpp || CPP)
		initSwrve(appId, apiKey, userId, appVersion);
		
		#else
		
		trace('swrve not supported on this platform');
		
		#end
		
	}
	
	
	#if android
	private static var initSwrve = JNI.createStaticMethod ("org.haxe.extension.Extension_swrve", "initSwrve", "(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V");
	private static var userUpdate = JNI.createStaticMethod ("org.haxe.extension.Extension_swrve", "userUpdate", "(Ljava/lang/String;Ljava/lang/String;)V");
	private static var sendEvent = JNI.createStaticMethod ("org.haxe.extension.Extension_swrve", "sendEvent", "(Ljava/lang/String;)V");
	#elseif (ios || cpp || CPP)
	private static var initSwrve: Dynamic = Lib.load ("swrveExt", "initSwrve", 4);
	#end
	
	
}