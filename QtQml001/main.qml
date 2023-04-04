
/* Creating a Qt Quick project with images as resource files.
Create project -> Qt Quick Application -> qmake
Top project tree node -> Add New -> Qt -> Qt Resource File -> name: res1
Copy png files in top level folder.
res1.qrc -> Add Existing File.*/

import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14
import QtQuick.Window 2.14
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
        function onSignal1(input)
        {
            console.log("qobject1.signal1 reached mainWindow. param1 = " + input)
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

                onWheel: function(wheel)
                {
                    console.log("rectangle1 mousearea wheel " + wheel)
                }

                onClicked: function(mouse) {
                    console.log("rectangle1 mousearea clicked " + mouse)
                }

                onDoubleClicked: function(mouse) {
                    console.log("rectangle1 mousearea double-clicked " + mouse)
                }
            }
        }

        // Docked floating item.
        Rectangle
        {
            id: containerItem
            implicitWidth: 150
            implicitHeight: 150
            color: "#ffdddd"

            Rectangle
            {
                id: containedItem
                width: 50; height: 50
                color: "red"
                opacity: (150.0 - containedItem.x) / 150

                MouseArea
                {
                    anchors.fill: parent
                    drag
                    {
                        target: containedItem
                        axis: Drag.XAndYAxis
                        minimumX: 0
                        maximumX: containerItem.width - containedItem.width
                        minimumY: 0
                        maximumY: containerItem.height - containedItem.height
                    }
                    cursorShape: Qt.OpenHandCursor
                }
            }
        }

        Grid
        {
            id: checkerboard
            width: 150
            height: 150
            property int u: 5

            rows: height / u
            columns: width / u

            Repeater
            {
                model: checkerboard.rows * checkerboard.columns

                Rectangle
                {
                    property int rowNumber: index / checkerboard.columns
                    property int columnNumber: index - rowNumber * checkerboard.columns

                    width: checkerboard.u
                    height: checkerboard.u

                    color:
                    {
                        if (rowNumber === 0 || rowNumber === checkerboard.rows - 1 ||
                            columnNumber === 0 || columnNumber === checkerboard.columns - 1)
                        {
                            return "red"
                        }
                        return ((rowNumber + columnNumber) % 2 == 0) ? "black" : "white"
                    }

                    radius:
                    {
                        let hEdge = rowNumber === 1 || rowNumber === checkerboard.rows - 2
                        let vEdge = columnNumber === 1 || columnNumber === checkerboard.columns - 2
                        if (vEdge && hEdge)
                        {
                            return 2
                        }
                        hEdge = rowNumber === 0 || rowNumber === checkerboard.rows - 1
                        vEdge = columnNumber === 0 || columnNumber === checkerboard.columns - 1
                        if (vEdge && hEdge)
                        {
                            return 4
                        }
                        return 0
                    }
                }
            }
        }
    }
    Popup {
        width: 300
        height: 300
        visible: true
        modal: true
        //padding: 50
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
        MouseArea {
            anchors.fill: parent
            onDoubleClicked: console.log("m1")
        }
        Component.onCompleted: {
            console.log(padding)
            console.log(bottomPadding)
            console.log(topPadding)
            console.log(leftPadding)
            console.log(rightPadding)
            console.log(verticalPadding)
            console.log(horizontalPadding)

            console.log(margins)
            console.log(leftMargin)
            console.log(rightMargin)
            console.log(topMargin)
            console.log(bottomMargin)

            console.log(topInset)
            console.log(bottomInset)
            console.log(leftInset)
            console.log(rightInset)
        }
    }
    MouseArea {
        anchors.fill: parent
        z:1000

        onDoubleClicked: {
            console.log("makarand7")
            if (parent.visibility === Window.Maximized) {
                parent.showNormal()
            }
            else {
                parent.showMaximized()
            }
        }
    }

}
