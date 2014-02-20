Phobos is a Smalltalk framework that helps to create platform independent desktop applications using XULRunner. It uses Mozilla XULRunner for rendering of GUI components. Phobos has component-based architecture inspired by Seaside.

You need:
- Pharo virtual machine
- Pharo image with preloaded Phobos
- Mozilla XULRunner (https://developer.mozilla.org/en-US/docs/Mozilla/Projects/XULRunner)
- small JavaScript application and template files (git clone https://code.google.com/p/phobos-framework/)

OR 

You can download prebuild bundles from:
https://ci.inria.fr/pharo-contribution/view/Phobos/


| app |
app := PhobosDemo new.
app start.

app stop.
PhobosApplication allSubInstances do: #stop