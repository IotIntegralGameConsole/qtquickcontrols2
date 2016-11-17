/****************************************************************************
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.7
import QtQuick.Controls 2.1

AbstractButton {
    id: delegate

    property alias remove: remove
    property alias edit: edit

    width: 300
    height: 50
    clip: true
    checkable: true
    autoExclusive: true

    Column {
        id: column1
        height: 400
        width: parent.width - 20
        spacing: 4

        Row {
            id: row1
            spacing: 10

            Label {
                text: fullName
                font.pointSize: 16
                anchors.verticalCenter: parent.verticalCenter
                font.bold: true
            }
        }

        Grid {
            id: grid
            opacity: 0

            x: 60
            spacing: 10
            columns: 2
            Label {
                text: qsTr("Address:")
                font.bold: true
                font.pixelSize: 16
            }

            Label {
                text: address
                font.pixelSize: 16
                font.bold: true
            }

            Label {
                text: qsTr("City:")
                font.pixelSize: 16
                font.bold: true
            }

            Label {
                text: city
                font.pixelSize: 16
                font.bold: true
            }

            Label {
                text: qsTr("Number:")
                font.pixelSize: 16
                font.bold: true
            }

            Label {
                text: number
                font.pixelSize: 16
                font.bold: true
            }
        }

        Row {
            id: row
            spacing: 12
            anchors.right: parent.right

            Button {
                id: remove
                width: 60
                height: 20
                text: "Remove"
            }

            Button {
                id: edit
                width: 60
                height: 20
                text: "Edit"
            }
        }

        MenuSeparator {
            id: separator
            opacity: 0
            padding: 0
            anchors.right: parent.right
            anchors.rightMargin: 4
            anchors.left: parent.left
            anchors.leftMargin: 4
        }
    }

    states: [
        State {
            name: "expanded"
            when: delegate.checked

            PropertyChanges {
                target: delegate
                height: 160
            }

            PropertyChanges {
                target: separator
                opacity: 1
            }

            PropertyChanges {
                target: grid
                opacity: 1
            }
        }
    ]
}