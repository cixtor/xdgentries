Both the KDE and GNOME desktop environments have adopted a similar format for _"desktop entries"_, or configuration files describing how a particular program is to be launched, how it appears in menus, among other things. It is to the larger community's benefit that a unified standard be agreed upon by all parties such that interoperation between the two environments, and indeed any additional environments that implement the specification, becomes simpler.

### Basic format

Desktop entry files should have the `.desktop` extension, except for files of type directory which should have the `.directory` extension. Determining file type on basis of extension makes determining the file type very easy and quick. When no file extension is present, the desktop system should fall back to recognition via _"magic detection"_.

For applications, the part of the name of the desktop file (before the .desktop) should follow the _"reverse DNS"_ convention, e.g. `org.example.FooViewer.desktop`. Desktop entry files are encoded in _UTF-8_. A file is interpreted as a series of lines that are separated by linefeed characters. Case is significant everywhere in the file.

Lines beginning with a number sign and blank lines are considered comments and will be ignored, however they should be preserved across reads and writes of the desktop entry file. Comment lines are uninterpreted and may contain any character _(except for LF)_. However, using _UTF-8_ for comment lines that contain characters not in ASCII is encouraged.

### Credits

Description of the project and additional information comes from the [Desktop Entry Specification](http://standards.freedesktop.org/desktop-entry-spec/desktop-entry-spec-latest.html) last updated at `01/Apr/2014`. All the credits go to the original authors.
