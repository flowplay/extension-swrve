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
	
	
	public static function init (appId:Int, apiKey:String):Void {
		
		#if (android || CPP)
		
		extension_swrve_init(appId, apiKey);
		
		#else
		
		trace('swrve not supported on this platform');
		
		#end
		
	}
	
	
	#if android
	private static var extension_swrve_init = JNI.createStaticMethod ("org.haxe.extension.Extension_swrve", "initSwrve", "(ILjava/lang/String;)V");
	#elseif cpp
	private static var extension_swrve_init = Lib.load ("extension_swrve", "extension_swrve_init", 2);
	#end
	
	
}