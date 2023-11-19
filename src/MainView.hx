package;

import haxe.ui.containers.VBox;
import haxe.ui.events.MouseEvent;

@:build(haxe.ui.ComponentBuilder.build("assets/main-view.xml"))
class MainView extends VBox {
	public function new() {
		super();

		while (Main.fullname == "") {}

		var text = 'Welcome to ${Main.fullname}!';
		title.text = text;
		title.width = text.length * 13;
		tv.width = text.length * 13;

		cancel.onClick = (v) -> Sys.exit(0);
		finish.onClick = (v) -> {
			var packages = [];

			if (vivaldi.selected)
				packages.push("vivaldi");
			if (brave.selected)
				packages.push("brave-browser");
			if (chromium.selected)
				packages.push("chromium");

			if (libreoffice.selected)
				packages.push("libreoffice");

			if (vlc.selected)
				packages.push("vlc");
			if (audacity.selected)
				packages.push("audacity");
			if (obs.selected)
				packages.push("obs-studio");
			if (mpv.selected)
				packages.push("mpv");
			if (ffmpeg.selected)
				packages.push("ffmpeg");
			if (handbrake.selected)
				packages.push("handbrake");
			if (gimp.selected)
				packages.push("gimp");

			if (discord.selected)
				packages.push("discord");
			if (element.selected)
				packages.push("element");
			if (signal.selected)
				packages.push("signal-desktop");

			if (kdeconnect.selected)
				packages.push("kdeconnect");
			if (xarchiver.selected)
				packages.push("xarchiver");
			if (qalculateGtk.selected)
				packages.push("qalculate-gtk");

			if (keepassxc.selected)
				packages.push("keepassxc");

			if (baseDevel.selected)
				packages.push("base-devel");

			Sys.command("xfce4-terminal -x sudo pacman -Syu " + packages.join(" "));
			Sys.exit(0);
		};
	}
}
