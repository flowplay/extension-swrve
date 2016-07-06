# extension-swrve

An OpenFL Swrve extension that supports ios and android.   


## REMOVE TODOS
TODO: JWG
User Properties:
* user property update can happen any time
coin.balance
gem.balance
user.level
lastPlayedslot
mostPlayedslot

Custom Events:
play.slot  ->  payload slot_name=<slot_name>
play.<slot_name>
onboarding.intro
onboarding.<intermediate>
onboarding.finish

Swrve Events (different implementation than custom events, requires some params)
<IAP event name> (verified or unverified)
purchaseItem
currencyGiven



For payloads the plan is to convert Haxe Anonymous structure to json string in swrve extension haxe.Json.stringify(o); then encode that string in 
java with something like this:

// Haxe client
var payload = {
    'name': 'guy1',
    'event': 'drunk'
}

// Haxe Swrve Extension
// convert anonymous structure to fucking json
var jsonPayload = haxe.Json.stringify(payload);


// Java
Type type = new TypeToken<Map<String, String>>(){}.getType();
Map<String, String> myMap = gson.fromJson("{'k1':'apple','k2':'orange'}", type);


