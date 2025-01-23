function handleComplete(event:Event):void {
  //Check if the loader has loaded successfully.
  if (event.target.loaderInfo.success) {
    //Get the XML data.
    var xml:XML = new XML(event.target.data);

    //Check if the 'item' elements exist in the XML.
    if (xml.hasOwnProperty('item')) {
      //Get the 'item' elements from the XML data.
      var items:XMLList = xml..item;

      //Loop through each item.
      for each (var item:XML in items) {
        //Check if required attributes exist before accessing them.
        if (item.hasOwnProperty('@name') && item.hasOwnProperty('@x') && item.hasOwnProperty('@y')) {
          //Create a new MovieClip.
          var mc:MovieClip = new MovieClip();

          //Set properties of the MovieClip based on the item's attributes.
          mc.name = item.@name;
          mc.x = item.@x;
          mc.y = item.@y;

          //Add the MovieClip to the display list.
          addChild(mc);
        } else {
          trace('Warning: Missing attributes in XML item.');
        }
      }
    } else {
      trace('Warning: No items found in XML data.');
    }
  }
} 