import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import "sharedFunctions.js" as Functions

//Inhaltsobjekt
BasePage {
    property int userIDOrder: settings.userID
    property string userIDName: "dich"

    height: parent.height; width: parent.width

    titel: {if (userIDOrder === settings.userID) {"DMS-App"} else {"Fremdbestellung"}}

    menuButtonsText: if (userIDOrder === settings.userID) {[ "Fremdbestellung", "Einstellungen" ]} else {[ "zurück" ]}

    //Darstellung der Inhalte
    Rectangle {
        id: drinksPageView
        height: parent.height
        width: parent.width
        color: "#C0D5E5"

        //Anzeige der Nummern über Delegates
        ListView {
            id: view;
            anchors {top: parent.top; right: parent.right; left: parent.left; bottom: parent.bottom; margins: 2}
            delegate: DrinksDelegate{}
            spacing: mainWindow.width/20;
            cacheBuffer: 50;
        }

        //Wenn Objekte gezeichnet sind, dann werden Funktionen ausgeführt
        Component.onCompleted: {
            root.visible = true;
            Functions.readProducts();
        }
    }

    Timer {
        id: timer;
        interval: 5000;
        running: false;
        onTriggered: {
            titelText.text = "DMS-App";
            titelText.color = "black";
        }
    }

    onMenuButtonClicked: {
        if (userIDOrder === settings.userID) {
            switch ( buttonIndex ) {
                //Wechsel auf Einstellungs-Seite
            case 0: mainStackView.push( usersPage ); break;
            case 1: mainStackView.push( settingsPage ); break;
            default: //console.log("error")
            }
        } else {
            switch ( buttonIndex ) {
                //Wechsel auf Einstellungs-Seite
            case 0: mainStackView.pop(); mainStackView.pop(); userIDOrder = settings.userID; userIDName = "dich"; break;
            default: //console.log("error")
            }
        }
    }
}
