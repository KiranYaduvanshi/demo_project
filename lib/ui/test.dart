import 'dart:collection';

main(){
 linkedHashMap();
 hashMap();
}

 void linkedHashMap() {
   var ordered = new LinkedHashMap();
   ordered['32352'] = 'Alice';
   ordered['95594'] = 'Bob';

   for (var key in ordered.keys) {
     print(key);
   }
 }

 void hashMap(){
   print("------ Hash Map -----");

   var accounts = {'323525': 'John Smith', '588982': 'Alice Jones'};
   for (var key in accounts.keys) {
     print(key);
   }
 }

