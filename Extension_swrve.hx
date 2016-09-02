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
	
	public static function swrveUserUpdate (payload:Dynamic):Void {
		#if (android || ios)
		trace('swrve: swrveUserUpdate ' + payload);
		userUpdate(haxe.Json.stringify(payload));
		#else
		trace('swrve userUpdate not supported on this platform');
		#end
	}

	public static function swrveCustomEvent (eventName:String, payload:Dynamic):Void {
		#if (android || ios)
		customEvent(eventName, haxe.Json.stringify(payload));
		#else
		trace('swrve customEvent not supported on this platform');
		#end
	}

	/*
	static void virtualCurrencyPurchaseComplete(value currency, value quantity, value localCost, value localCurrency);
	 */
	public static function swrveCurrencyGiven (currency:String, amount:Int):Void {
		#if (android || ios)
		currencyGiven(currency, amount);
		#else
		trace('swrve: swrveCurrencyGiven not supported on this platform');
		#end
	}
	public static function swrveVirtualItemPurchaseComplete (sku:String, currency:String, cost:Int, quantity:Int):Void {
		#if (android || ios)
		virtualItemPurchaseComplete(sku, currency, cost, quantity);
		#else
		trace('swrve swrveVirtualItemPurchaseComplete not supported on this platform');
		#end
	}

	public static function swrveIapPurchaseComplete (quantity:Int, localCurrency:String, localCost:Float, productId:String):Void {
		#if (android || ios)
		iapPurchaseComplete(quantity, localCurrency, localCost,  productId);
		#else
		trace('swrve swrveVirtualCurrencyPurchaseComplete not supported on this platform');
		#end
	}

	#if android
	private static var userUpdate = JNI.createStaticMethod ("org.haxe.extension.Extension_swrve", "userUpdate", "(Ljava/lang/String;)V");
	private static var customEvent = JNI.createStaticMethod ("org.haxe.extension.Extension_swrve", "customEvent", "(Ljava/lang/String;Ljava/lang/String;)V");
	private static var currencyGiven = JNI.createStaticMethod ("org.haxe.extension.Extension_swrve", "currencyGiven", "(Ljava/lang/String;I)V");
	private static var virtualItemPurchaseComplete = JNI.createStaticMethod ("org.haxe.extension.Extension_swrve", "virtualItemPurchaseComplete", "(Ljava/lang/String;Ljava/lang/String;II)V");
	private static var iapPurchaseComplete = JNI.createStaticMethod ("org.haxe.extension.Extension_swrve", "iapPurchaseComplete", "(ILjava/lang/String;DLjava/lang/String;)V");
	#elseif ios
	private static var userUpdate: Dynamic = Lib.load ("swrveExt", "userUpdate", 1);
	private static var customEvent: Dynamic = Lib.load ("swrveExt", "customEvent", 2);
	private static var currencyGiven: Dynamic = Lib.load ("swrveExt", "currencyGiven", 2);
	private static var virtualItemPurchaseComplete: Dynamic = Lib.load ("swrveExt", "virtualItemPurchaseComplete", 4);
	private static var iapPurchaseComplete: Dynamic = Lib.load ("swrveExt", "iapPurchaseComplete", 4);
	#end
	
	
}