import QtQuick 2.14
import QtQuick.Controls 2.14

// Note: Button has a bug when used along with a background image.
RoundButton
{
    id: button1
    implicitWidth: 150
    implicitHeight: 150
    checkable: true
    radius: 8

    signal signal1(string param1)

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
        if (checked)
        {
            qobject1.emitSignal1()
        }
        else
        {
            console.log("Emitting button1.signal1")
            button1.signal1("button1.signal1")
        }
    }
}
