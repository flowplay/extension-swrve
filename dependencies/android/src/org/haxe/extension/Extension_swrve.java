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

import java.lang.Override;


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
	
	
	public static void initSwrve (int appId, String apiKey, String userId, String appVersion ) {
		try {
			SwrveConfig config = new SwrveConfig();
			config.setUserId(userId);
			config.setAppVersion(appVersion);
			SwrveSDK.createInstance(Extension.mainActivity, appId, apiKey, config);
			SwrveSDK.onCreate(Extension.mainActivity);
		} catch (IllegalArgumentException exp) {
			Log.e("SwrveDemo", "Could not initialize the Swrve SDK", exp);
		}
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
			SwrveSDK.onResume(Extension.mainActivity);
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