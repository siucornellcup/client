/**
 *  Copyright © 2010 Digia Plc
 *  Copyright © 2010 Nokia Corporation
 *
 *  All rights reserved.
 *
 *  Nokia and Nokia Connecting People are registered trademarks of
 *  Nokia Corporation.
 *  Java and all Java-based marks are trademarks or registered
 *  trademarks of
 *  Sun Microsystems, Inc. Other product and company names
 *  mentioned herein may be
 *  trademarks or trade names of their respective owners.
 *
 *
 *  Subject to the conditions below, you may, without charge:
 *
 *  ·  Use, copy, modify and/or merge copies of this software and
 *     associated documentation files (the "Software")
 *
 *  ·  Publish, distribute, sub-licence and/or sell new software
 *     derived from or incorporating the Software.
 *
 *
 *  This file, unmodified, shall be included with all copies or
 *  substantial portions
 *  of the Software that are distributed in source code form.
 *
 *  The Software cannot constitute the primary value of any new
 *  software derived
 *  from or incorporating the Software.
 *
 *  Any person dealing with the Software shall not misrepresent
 *  the source of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
 *  KIND, EXPRESS OR IMPLIED,
 *  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 *  MERCHANTABILITY, FITNESS FOR A
 *  PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT
 *  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 *  WHETHER IN AN ACTION
 *  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 *  CONNECTION WITH THE
 *  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
import Qt 4.7
import "gradients"

Item {
    SystemPalette {id: palette}
    property color colorWhenDefault: "transparent"
    property color colorWhenPressed: palette.shadow
    property color colorWhenHovered: palette.mid
    property color colorWhenSelected: "transparent"
    property color textColor: "#404040"
    property real roundness: 0.5 // 0-1
    property real fontSize: 12
    property string fontFamily: "DroidSans"
    property string fontWeight: "DemiBold"
    property int borderWidth: 0
    property color borderColor: "transparent"
    property color borderColorWhenHovered: "transparent"
    property color borderColorWhenPressed: "transparent"
    property color borderColorWhenSelected: "transparent"
    property int borderWidthInner: 0
    property color borderColorInner: "transparent"
    property color borderColorInnerWhenHovered: "transparent"
    property color borderColorInnerWhenPressed: "transparent"
    property color bgColor: "transparent"
    property real itemRoundness: 0.00001
    property color selectionColor: "transparent"
    property color selectedTextColor: "transparent"
    property bool gradientActiveOn: false
    property bool gradientDefaultOn: true
    property bool gradientHoveredOn: false
    property bool gradientPressedOn: false
    property bool gradientBgOn: false
    property bool gradientCheckedOn: true;
    property bool gradientSelectedOn: true;
    property bool activeStateOn: true
    property bool hoveredStateOn: false
    property bool pressedStateOn: false
    property color borderColorWhenChecked: "transparent"
    property color colorWhenChecked: "transparent"
    property color borderColorWhenActive: palette.highlight
    property color colorWhenActive: palette.shadow
    property Gradient gradientBg: Gradient {
        GradientStop { position: 0; color: "transparent" }
        GradientStop { position: 1; color: "transparent" }
    }
    property Gradient gradientWhenDefault: Gradient {
        GradientStop { position: 0; color: "#3f3b3c" }
        GradientStop { position: 1; color: "#010103" }
    }
    property Gradient gradientWhenHovered:  Gradient {
        GradientStop { position: 0; color: "#4c4849" }
        GradientStop { position: 1; color: "#09091c" }
    }
    property Gradient gradientWhenPressed: Gradient {
        GradientStop { position: 0; color: "#3f3b3c" }
        GradientStop { position: 1; color: "#010103" }
    }
    property Gradient gradientWhenSelected: Red{}
    property Gradient gradientWhenChecked: gradientWhenDefault
    property Gradient gradientWhenActive: gradientWhenDefault
}
