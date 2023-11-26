import sys.io.File;

class Translations {
	private static var map:Map<String, String>;

	public static function load() {
		final lang = File.getContent("/etc/locale.conf").split("=")[1].split(".")[0].toLowerCase();
		final translations = File.getContent("/etc/symmos/lang/symmos-welcome/$lang.lang").split("\n");
		map = new Map();
		for (translation in translations) {
			map.set(translation.split("=")[0], translation.split("=")[1]);
		}
	}

	public static function get(key:String):String {
		if (map.exists(key))
			return map.get(key);
		return key;
	}
}
