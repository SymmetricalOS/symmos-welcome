package;

import sys.io.File;
import haxe.ui.HaxeUIApp;

using StringTools;

class Main {
	public static var name:String = "";
	public static var version:String = "";
	public static var fullname:String = "";

	public static function main() {
		var app = new HaxeUIApp();

		final osrelease = File.getContent("/etc/symmos-release").split("\n");

		name = osrelease[0];
		version = osrelease[1];
		fullname = osrelease[2];

		app.ready(function() {
			app.addComponent(new MainView());

			app.title = 'Welcome to $name';

			app.start();
		});
	}
}
