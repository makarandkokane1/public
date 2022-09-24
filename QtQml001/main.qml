
/* Creating a Qt Quick project with images as resource files.
Create project -> Qt Quick Application -> qmake
Top project tree node -> Add New -> Qt -> Qt Resource File -> name: res1
Copy png files in top level folder.
res1.qrc -> Add Existing File.*/

import QtQuick
import QtQuick.Controls
import QtQuick.Window

Window
{
    visible: true
    visibility: "Maximized"
    title: "title"

    // Note: Button has a bug when used along with a background image.
    RoundButton
    {
        id: button1
        width: 150
        height: 150
        checkable: true
        radius: 8

        background: Item
        {
            anchors.fill: parent

            Image
            {
                x: 10
                y: 10
                width: 140
                source: "/blue.png"
                fillMode: Image.PreserveAspectFit
            }

            Rectangle
            {
                anchors.fill: parent

                border.color: button1.checked ? "#FF0000" : button1.hovered ? "#00FF00" : "#0000FF"
                border.width: 1

                radius: 8
                color: "transparent"
            }
        }

        onCheckedChanged:
        {
            console.log("button1 check changed: " + checked)
        }
    }
}
