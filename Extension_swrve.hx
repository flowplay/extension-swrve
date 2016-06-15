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
	
	
	public static function sampleMethod (inputValue:Int):Int {
		
		#if (android)
		
		var resultJNI = extension_swrve_sample_method_jni(inputValue);
		var resultNative = extension_swrve_sample_method(inputValue);
		
		if (resultJNI != resultNative) {
			
			throw "Fuzzy math!";
			
		}
		
		return resultNative;
		
		#else
		
		return extension_swrve_sample_method(inputValue);
		
		#end
		
	}
	
	
	#if (android || cpp)
	private static var extension_swrve_init = JNI.createStaticMethod ("org.haxe.extension.Extension_swrve", "initSwrve", "(I)I");
	#elseif cpp
	private static var extension_swrve_init = Lib.load ("flowplayextension", "flowplayextension_init", 1);
	#end
	
	
}