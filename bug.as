function handleComplete(event:Event):void {
  //Check if the loader has loaded successfully.
  if (event.target.loaderInfo.success) {
    //Get the XML data.
    var xml:XML = new XML(event.target.data);

    //Get the 'item' elements from the XML data.  This will not work if the XML is not formatted as such.
    var items:XMLList = xml..item;

    //Loop through each item.
    for each (var item:XML in items) {
      //Create a new MovieClip.
      var mc:MovieClip = new MovieClip();

      //Set properties of the MovieClip based on the item's attributes.
      mc.name = item.@name;
      mc.x = item.@x;
      mc.y = item.@y;

      //Add the MovieClip to the display list.
      addChild(mc);
    }
  }
}