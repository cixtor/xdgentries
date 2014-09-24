Both the KDE and GNOME desktop environments have adopted a similar format for _"desktop entries"_, or configuration files describing how a particular program is to be launched, how it appears in menus, among other things. It is to the larger community's benefit that a unified standard be agreed upon by all parties such that interoperation between the two environments, and indeed any additional environments that implement the specification, becomes simpler.

### Basic format

Desktop entry files should have the `.desktop` extension, except for files of type directory which should have the `.directory` extension. Determining file type on basis of extension makes determining the file type very easy and quick. When no file extension is present, the desktop system should fall back to recognition via _"magic detection"_.

For applications, the part of the name of the desktop file (before the .desktop) should follow the _"reverse DNS"_ convention, e.g. `org.example.FooViewer.desktop`. Desktop entry files are encoded in _UTF-8_. A file is interpreted as a series of lines that are separated by linefeed characters. Case is significant everywhere in the file.

Lines beginning with a number sign and blank lines are considered comments and will be ignored, however they should be preserved across reads and writes of the desktop entry file. Comment lines are uninterpreted and may contain any character _(except for LF)_. However, using _UTF-8_ for comment lines that contain characters not in ASCII is encouraged.

### Entry keys

* Entries in the file are key-value pairs in the format `Key=Value`.
* Space before and after the equals sign should be ignored.
* The equal sign is the actual delimiter.
* Only the characters `A-Za-z0-9-` may be used in key names.
* As the case is significant, the keys `Name` and `NAME` are not equivalent.
* Multiple keys in the same group may not have the same name.
* Keys in different groups may have the same name.

### Entry values

* The value types recognized are string, localestring, boolean, and numeric.
* Values of type `string` may contain all ASCII characters except for control characters.
* Values of type `localestring` are user displayable, and are encoded in UTF-8.
* Values of type `boolean` must either be the string `true` or `false`.
* Values of type `numeric` must be a valid floating point number.
* These escape sequences are supported for values of type `string` and `localestring`: ASCII space, newline, tab, carriage return, and backslash.

Some keys can have multiple values. In such a case, the value of the key is specified as a plural: for example, string(s). The multiple values should be separated by a semicolon and the value of the key may be optionally terminated by a semicolon. Trailing empty strings must always be terminated with a semicolon. Semicolons in these values need to be escaped.

### Example

```
[Desktop Entry]
Version=1.0
Type=Application
Name=Foo Viewer
Comment=The best viewer for Foo objects available!
TryExec=fooview
Exec=fooview %F
Icon=fooview
MimeType=image/x-foo;
Actions=Gallery;Create;

[Desktop Action Gallery]
Exec=fooview --gallery
Name=Browse Gallery

[Desktop Action Create]
Exec=fooview --create-new
Name=Create a new Foo!
Icon=fooview-new
```

### Credits

Description of the project and additional information comes from the [Desktop Entry Specification](http://standards.freedesktop.org/desktop-entry-spec/desktop-entry-spec-latest.html) last updated at `01/Apr/2014`. All the credits go to the original authors.
