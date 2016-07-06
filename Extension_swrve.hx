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
	public static function swrvePurchaseItem (item:String, currency:String, cost:Int, quantity:Int):Void {
		#if (android || ios)
		trace('swrve: swrvePurchaseItem ' + item);
		purchaseItem(item, currency, cost, quantity);
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

	public static function swrveVirtualItemPurchaseComplete (sku:String, quantity:Int, localCost:Int, localCurrency:String, productId:String):Void {
		#if (android || ios)
		virtualItemPurchaseComplete(sku, quantity, localCost, localCurrency, productId);
		#else
		trace('swrve swrveVirtualItemPurchaseComplete not supported on this platform');
		#end
	}

	public static function swrveVirtualCurrencyPurchaseComplete (currency:String, quantity:Int, localCost:Int, localCurrency:String):Void {
		#if (android || ios)
		trace('swrve: swrveVirtualCurrencyPurchaseComplete ' + currency + ' ' + quantity);
		virtualCurrencyPurchaseComplete(currency, quantity, localCost, localCurrency);
		#else
		trace('swrve swrveVirtualCurrencyPurchaseComplete not supported on this platform');
		#end
	}

	#if android
	private static var initSwrve = JNI.createStaticMethod ("org.haxe.extension.Extension_swrve", "initSwrve", "(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V");
	private static var userUpdate = JNI.createStaticMethod ("org.haxe.extension.Extension_swrve", "userUpdate", "(Ljava/lang/String;)V");
	private static var customEvent = JNI.createStaticMethod ("org.haxe.extension.Extension_swrve", "customEvent", "(Ljava/lang/String;Ljava/lang/String;)V");
	private static var purchaseItem = JNI.createStaticMethod ("org.haxe.extension.Extension_swrve", "purchaseItem", "(Ljava/lang/String;Ljava/lang/String;II)V");
	private static var currencyGiven = JNI.createStaticMethod ("org.haxe.extension.Extension_swrve", "currencyGiven", "(Ljava/lang/String;I)V");
	private static var virtualItemPurchaseComplete = JNI.createStaticMethod ("org.haxe.extension.Extension_swrve", "virtualItemPurchaseComplete", "(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V");
	private static var virtualCurrencyPurchaseComplete = JNI.createStaticMethod ("org.haxe.extension.Extension_swrve", "virtualCurrencyPurchaseComplete", "(Ljava/lang/String;IILjava/lang/String;)V");
	#elseif ios
	private static var initSwrve: Dynamic = Lib.load ("swrveExt", "initSwrve", 4);
	private static var userUpdate: Dynamic = Lib.load ("swrveExt", "userUpdate", 1);
	private static var customEvent: Dynamic = Lib.load ("swrveExt", "customEvent", 2);
	private static var purchaseItem: Dynamic = Lib.load ("swrveExt", "purchaseItem", 4);
	private static var currencyGiven: Dynamic = Lib.load ("swrveExt", "currencyGiven", 2);
	private static var virtualItemPurchaseComplete: Dynamic = Lib.load ("swrveExt", "virtualItemPurchaseComplete", 5);
	private static var virtualCurrencyPurchaseComplete: Dynamic = Lib.load ("swrveExt", "virtualCurrencyPurchaseComplete", 4);
	#end
	
	
}