
/* Creating a Qt Quick project with images as resource files.
Create project -> Qt Quick Application -> qmake
Top project tree node -> Add New -> Qt -> Qt Resource File -> name: res1
Copy png files in top level folder.
res1.qrc -> Add Existing File.*/

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window
import "qrc:/QmlModule1"

Window
{
    id: mainWindow
    visible: true
    visibility: "Maximized"
    title: "title"

    Component.onCompleted:
    {
        qobject1.setItem("mainWindow", mainWindow);
    }

    Connections
    {
        target: qobject1
        function onSignal1(param1)
        {
            console.log("qobject1.signal1 reached mainWindow. param1 = " + param1)
        }
    }

    ColumnLayout
    {
        MRoundButton
        {
            onSignal1: function(param1)
            {
                console.log("button1.signal1 reached mainWindow. param1 = " + param1)
            }
        }

        Rectangle
        {
            id: rectangle1
            implicitWidth: 150
            implicitHeight: 150
            color: "red"

            MouseArea
            {
                anchors.fill: parent
                onPressed: function(mouse)
                // onPressed: (mouse)=>     // works the same.
                {
                    console.log("rectangle1 mousearea pressed " + mouse.buttons)
                }
            }
        }
    }
}
