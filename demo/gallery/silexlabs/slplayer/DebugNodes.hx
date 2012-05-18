package silexlabs.slplayer;

import slplayer.ui.DisplayObject;
import slplayer.core.SLPlayer;

import js.Lib;
import js.Dom;

/**
 * ...
 * @author Thomas Fétiveau
 */

class DebugNodes  extends DisplayObject
{
	static override var className = "debugnode";
	
	override public function init(e:Event):Void 
	{
		trace("DebugNodes component initialized");
		
		var debugButton = Lib.document.createElement("img");
		debugButton.setAttribute("src", "assets/debug.png");
		debugButton.onclick = callback(debugNodes);
		this.rootElement.appendChild(debugButton);
	}
	
	public function debugNodes(e : Event)
	{
		debugNode(Lib.document.body);
	}
	
	public function debugNode(node : HtmlDom)
	{
		for (cCount in 0...node.childNodes.length)
		{
			var elt : HtmlDom = cast(node.childNodes[cCount]);
			if (elt.className != null)
			{
				var tagName = untyped elt.nodeName;
				trace("tag " + tagName +
				" with class=" + elt.className +
				" has associated components : "+SLPlayer.getAssociatedComponents(elt));
			}
			if (node.childNodes[cCount].hasChildNodes())
				debugNode( elt );
		}
	}
}