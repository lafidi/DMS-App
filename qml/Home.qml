import QtQuick 2.2

//Start-Bildschirm für App
BasePage {
    height: parent.height; width: parent.width
    visible:false

    titel: "DMS-App"
    menuButtonsText: [ "weiter" ]

    //Inhalt (Logo und Text)
    Rectangle {
        anchors.fill: parent
        color: "lightcoral"

        Image {
            id: image
            anchors.centerIn: parent;
            source: "qrc:/static/logo.png";
            width: parent.width;
            fillMode: Image.PreserveAspectFit;
        }

        Text{
            anchors.top: image.bottom
            anchors.horizontalCenter: parent
            text:"DMS-App"
            font.pixelSize: 80;
            color: "white"
        }
    }

    onMenuButtonClicked: {
        if ( buttonIndex == 0 )
            mainStackView.push( categoryPage );
    }
}

