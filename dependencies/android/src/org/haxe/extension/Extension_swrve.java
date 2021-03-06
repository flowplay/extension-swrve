package org.haxe.extension;


import android.app.Activity;
import android.content.res.AssetManager;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.util.Log;
import com.swrve.sdk.SwrveSDK;
import com.swrve.sdk.config.SwrveConfig;
import java.util.HashMap;
import java.util.Map;
import java.lang.Override;
import com.google.gson.Gson;
import java.lang.reflect.Type;
import com.google.gson.reflect.TypeToken;
import com.swrve.sdk.conversations.engine.GsonHelper;
import com.swrve.sdk.SwrveIAPRewards;
import jdk.nashorn.internal.runtime.Debug;


/* 
	You can use the Android Extension class in order to hook
	into the Android activity lifecycle. This is not required
	for standard Java code, this is designed for when you need
	deeper integration.
	
	You can access additional references from the Extension class,
	depending on your needs:
	
	- Extension.assetManager (android.content.res.AssetManager)
	- Extension.callbackHandler (android.os.Handler)
	- Extension.mainActivity (android.app.Activity)
	- Extension.mainContext (android.content.Context)
	- Extension.mainView (android.view.View)
	
	You can also make references to static or instance methods
	and properties on Java classes. These classes can be included 
	as single files using <java path="to/File.java" /> within your
	project, or use the full Android Library Project format (such
	as this example) in order to include your own AndroidManifest
	data, additional dependencies, etc.
	
	These are also optional, though this example shows a static
	function for performing a single task, like returning a value
	back to Haxe from Java.
*/
public class Extension_swrve extends Extension {

	private static int _appId = 3943;

	private static Map<String, String> getPayloadFromJson(String jsonString) {
		Type type = new TypeToken<Map<String, String>>(){}.getType();
		Gson gson = GsonHelper.getConfiguredGson();
		Map<String, String> payload = gson.fromJson(jsonString, type);
		return payload;
	}

	public static void userUpdate (String jsonPayload) {
		if(SwrveSDK.getInstance() != null) {
			SwrveSDK.userUpdate(getPayloadFromJson(jsonPayload));
		}
	}

	public static void customEvent (String eventName, String jsonPayload) {
		if(SwrveSDK.getInstance() != null) {
			SwrveSDK.event(eventName, getPayloadFromJson(jsonPayload));
		}
	}

	public static void currencyGiven (String currency, int amount) {
		//Log.d("SwrveDemo", "currencyGiven " + currency + " " + amount);
		SwrveSDK.currencyGiven(currency, (double) amount);
	}

	public static void virtualItemPurchaseComplete (String sku, String currency, int cost, int quantity) {
		//Log.d("SwrveDemo", "virtualItemPurchaseComplete " + sku);
		//SwrveIAPRewards purchaseRewards = new SwrveIAPRewards();
		//purchaseRewards.addItem(sku, quantity);
		//SwrveSDK.iap(quantity, productId, localCost, localCurrency, purchaseRewards);
		//SwrveSDK.iap(quantity, productId, localCost, localCurrency);
		SwrveSDK.purchase(sku, currency, cost, quantity);
	}

	public static void iapPurchaseComplete (int quantity, String localCurrency, double localCost, String productId) {
		//Log.d("SwrveDemo", "todo implement virtualCurrencyPurchaseComplete " + currency + " " + quantity);
		SwrveIAPRewards purchaseRewards = new SwrveIAPRewards();
		// todo: implement rewards once they make any sense at all
		//purchaseRewards.addCurrency(currency, quantity);
		//SwrveSDK.iap(quantity, currency, localCost, localCurrency, purchaseRewards);
		SwrveSDK.iap(quantity, productId, localCost, localCurrency, purchaseRewards);

	}

	/**
	 * Called when an activity you launched exits, giving you the requestCode
	 * you started it with, the resultCode it returned, and any additional data
	 * from it.
	 */
	public boolean onActivityResult (int requestCode, int resultCode, Intent data) {

		return true;

	}


	/**
	 * Called when the activity is starting.
	 */
	public void onCreate (Bundle savedInstanceState) {

		try {
			if(SwrveSDK.getInstance() == null) {
				Log.d("swrve", "*********** creating swrve instance.");
				SwrveConfig config = new SwrveConfig();
				//config.setUserId(userId);
				config.setAppVersion("::APP_BUILD_NUMBER::");
				config.setSenderId("::config.swrve.senderId::");
				SwrveSDK.createInstance(Extension.mainActivity, ::config.swrve.appId::, "::config.swrve.apiKey::", config);
			} else {
				Log.d("swrve", "*********** swrve instance already created");
			}
			SwrveSDK.onCreate(Extension.mainActivity);
		} catch (IllegalArgumentException exp) {
			Log.e("SwrveDemo", "*********** Could not initialize the Swrve SDK", exp);
		}
	}


	/**
	 * Perform any final cleanup before an activity is destroyed.
	 */
	public void onDestroy () {
		if(SwrveSDK.getInstance() != null) {
			SwrveSDK.onDestroy(Extension.mainActivity);
		}
	}


	/**
	 * Called as part of the activity lifecycle when an activity is going into
	 * the background, but has not (yet) been killed.
	 */
	public void onPause() {
		if(SwrveSDK.getInstance() != null) {
			SwrveSDK.onPause();
		}

	}


	/**
	 * Called after {@link #onStop} when the current activity is being
	 * re-displayed to the user (the user has navigated back to it).
	 */
	public void onRestart () {



	}


	/**
	 * Called after {@link #onRestart}, or {@link #onPause}, for your activity
	 * to start interacting with the user.
	 */
	public void onResume() {
		if(SwrveSDK.getInstance() != null) {
			Log.d("swrve", "on resume. have sdk instance");
			SwrveSDK.onResume(Extension.mainActivity);
		} else {
			Log.d("swrve", "on resume. have NO sdk instance");
		}
	}


	/**
	 * Called after {@link #onCreate} &mdash; or after {@link #onRestart} when
	 * the activity had been stopped, but is now again being displayed to the
	 * user.
	 */
	public void onStart () {



	}


	/**
	 * Called when the activity is no longer visible to the user, because
	 * another activity has been resumed and is covering this one.
	 */
	public void onStop () {



	}

	public void onNewIntent(Intent intent) {
		if(SwrveSDK.getInstance() != null) {
			SwrveSDK.onNewIntent(intent);
			Log.d("swrve", "onNewIntent. have sdk instance");
		} else {
			Log.d("swrve", "onNewIntent. have NO sdk instance");
		}
	}

	/*
	 @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        SwrveSDK.onCreate(this);
    }

    @Override
    protected void onPause() {
        super.onPause();
        SwrveSDK.onPause();
    }

    @Override
    protected void onResume() {
        super.onResume();
        SwrveSDK.onResume(this);
    }

    @Override
    protected void onDestroy() {
        SwrveSDK.onDestroy(this);
        super.onDestroy();
    }

    @Override
    public void onLowMemory() {
        super.onLowMemory();
        SwrveSDK.onLowMemory();
    }

    @Override
    public void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        SwrveSDK.onNewIntent(intent);
    }
	 */
	
	
}