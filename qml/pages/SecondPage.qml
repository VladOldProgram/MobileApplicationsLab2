import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    property int rounds: 3
    property int playerCount: 0
    property int computerCount: 0
    property int randomNumber: 0
    property string computerChoice: ""
    property string playerChoice: ""

    Label {
        id: playerRounds
        x: Theme.horizontalPageMargin
        y: 100
        width: parent.width / 3
        text: "Player: " + playerCount
        font.pixelSize: Theme.fontSizeMedium
    }
    Label {
        id: allRounds
        y: 100
        width: parent.width / 3
        anchors.left: playerRounds.right
        text: "Rounds: " + rounds
        font.pixelSize: Theme.fontSizeMedium
    }
    Label {
        id: computerRounds
        y: 100
        width: parent.width / 3
        anchors.left: allRounds.right
        text: "Computer: " + computerCount
        font.pixelSize: Theme.fontSizeMedium
    }

    Button {
        text: qsTr("Rock")
        x: Theme.horizontalPageMargin
        y: 200
        width: parent.width - 2 * x
        onClicked: {
            results.visible = false
            playerChoice = "Rock"
            randomNumber = Math.floor(Math.random() * 4)

            switch (randomNumber) {
            case (1):
                computerChoice = "Rock"
                rounds--
                allRounds.text = "Rounds: " + rounds
                break
            case (2):
                computerChoice = "Scissors"
                playerCount++
                playerRounds.text = "Player: " + playerCount
                rounds--
                allRounds.text = "Rounds: " + rounds
                break
            case (3):
                computerChoice = "Paper"
                computerCount++
                computerRounds.text = "Computer: " + computerCount
                rounds--
                allRounds.text = "Rounds: " + rounds
                break
            }

            if (rounds == 0) {
                results.visible = true
                if (playerCount > computerCount) {
                    results.text = "You have won"
                }
                else if (playerCount == computerCount) {
                    results.text = "You have a draw"
                }
                else {
                    results.text = "You have lost"
                }

                rounds = 3
                playerCount = 0
                computerCount = 0
                allRounds.text = "Rounds: " + rounds
                playerRounds.text = "Player: " + playerCount
                computerRounds.text = "Computer: " + computerCount
            }
        }
    }
    Button {
        text: qsTr("Scissors")
        x: Theme.horizontalPageMargin
        y: 300
        width: parent.width - 2 * x
        onClicked: {
            results.visible = false
            playerChoice = "Scissors"
            randomNumber = Math.floor(Math.random() * 4)

            switch (randomNumber) {
            case (1):
                computerChoice = "Rock"
                computerCount++
                computerRounds.text = "Computer: " + computerCount
                rounds--
                allRounds.text = "Rounds: " + rounds
                break
            case (2):
                computerChoice = "Scissors"
                rounds--
                allRounds.text = "Rounds: " + rounds
                break
            case (3):
                computerChoice = "Paper"
                playerCount++
                playerRounds.text = "Player: " + playerCount
                rounds--
                allRounds.text = "Rounds: " + rounds
                break
            }

            if (rounds == 0) {
                results.visible = true
                if (playerCount > computerCount) {
                    results.text = "You have won"
                }
                else if (playerCount == computerCount) {
                    results.text = "You have a draw"
                }
                else {
                    results.text = "You have lost"
                }

                rounds = 3
                playerCount = 0
                computerCount = 0
                allRounds.text = "Rounds: " + rounds
                playerRounds.text = "Player: " + playerCount
                computerRounds.text = "Computer: " + computerCount
            }
        }
    }
    Button {
        text: qsTr("Paper")
        x: Theme.horizontalPageMargin
        y: 400
        width: parent.width - 2 * x
        onClicked: {
            results.visible = false
            playerChoice = "Paper"
            randomNumber = Math.floor(Math.random() * 4)

            switch (randomNumber) {
            case (1):
                computerChoice = "Rock"
                playerCount++
                playerRounds.text = "Player: " + playerCount
                rounds--
                allRounds.text = "Rounds: " + rounds
                break
            case (2):
                computerChoice = "Scissors"
                computerCount++
                computerRounds.text = "Computer: " + computerCount
                rounds--
                allRounds.text = "Rounds: " + rounds
                break
            case (3):
                computerChoice = "Paper"
                rounds--
                allRounds.text = "Rounds: " + rounds
                break
            }

            if (rounds == 0) {
                results.visible = true
                if (playerCount > computerCount) {
                    results.text = "You have won"
                }
                else if (playerCount == computerCount) {
                    results.text = "You have a draw"
                }
                else {
                    results.text = "You have lost"
                }

                rounds = 3
                playerCount = 0
                computerCount = 0
                allRounds.text = "Rounds: " + rounds
                playerRounds.text = "Player: " + playerCount
                computerRounds.text = "Computer: " + computerCount
            }
        }
    }

    Label {
        id: your
        x: Theme.horizontalPageMargin
        y: 600
        width: parent.width / 2
        text: "You: " + playerChoice
        font.pixelSize: Theme.fontSizeMedium
    }
    Label {
        id: computers
        x: Theme.horizontalPageMargin
        y: 600
        width: parent.width / 2
        anchors.right: parent.right
        text: "Computer: " + computerChoice
        font.pixelSize: Theme.fontSizeMedium
    }

    Label {
        id: results
        x: Theme.horizontalPageMargin
        y: 800
        width: parent.width - 2 * x
        visible: false
        text: "Results"
        font.pixelSize: Theme.fontSizeMedium
    }

    Button {
        x: Theme.horizontalPageMargin
        y: 1100
        width: parent.width - 2 * x
        text: qsTr("Exit game menu")
        onClicked: pageStack.push(Qt.resolvedUrl("FirstPage.qml"))
    }
}
