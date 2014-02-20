Phobos is a Smalltalk framework that helps to create platform independent desktop applications using XULRunner. It uses Mozilla XULRunner for rendering of GUI components. Phobos has component-based architecture inspired by Seaside.


| app |
app := PhobosDemo new.
app start.


app stop.
PhobosApplication allSubInstances do: #stop