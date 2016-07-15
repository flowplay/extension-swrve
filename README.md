# extension-swrve

An OpenFL Swrve 4.4.0 extension that supports ios and android.   


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

# hard coded stuff
  
- swrve push requires manifest modification. todo make configurable packagename. packagename for vws is hard coded all over the place
- manifest issue, config for app title

- swrve senderid is hard coded <-- dont check this in dummy

- 
  
  