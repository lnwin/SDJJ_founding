QT += quick charts
QT += network sql
CONFIG += c++11
QT += quick quickcontrols2
QT += charts
# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        camera.cpp \
        crc.cpp \
        main.cpp \
        mysql.cpp \
        mystruct.cpp \
        socket.cpp \
        threadpond.cpp

RESOURCES += qml.qrc \
    imagines.qrc\
    qtquickcontrols2.conf

TRANSLATIONS += \
    SD_Founding_zh_CN.ts

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    camera.h \
    crc.h \
    inlcude/DataType.h \
    inlcude/DecodeCardSdk.h \
    inlcude/HCNetSDK.h \
    inlcude/plaympeg4.h \
    mysql.h \
    mystruct.h \
    socket.h \
    threadpond.h

DISTFILES += \
    imagines/button-background-checked-hovered.9.png \
    imagines/button-background-checked-hovered@2x.9.png \
    imagines/button-background-checked.9.png \
    imagines/button-background-checked@2x.9.png \
    imagines/button-background-hovered.9.png \
    imagines/button-background-hovered@2x.9.png \
    imagines/button-background-pressed.9.png \
    imagines/button-background-pressed@2x.9.png \
    imagines/button-background.9.png \
    imagines/button-background@2x.9.png \
    imagines/rect1798.png \
    inlcude/AudioRender.dll \
    inlcude/EagleEyeRender.dll \
    inlcude/GdiPlus.dll \
    inlcude/GdiPlus.lib \
    inlcude/HCCore.dll \
    inlcude/HCCore.lib \
    inlcude/HCNetSDK.dll \
    inlcude/HCNetSDK.lib \
    inlcude/HCNetSDKCom/AnalyzeData.dll \
    inlcude/HCNetSDKCom/AudioIntercom.dll \
    inlcude/HCNetSDKCom/HCAlarm.dll \
    inlcude/HCNetSDKCom/HCAlarm.lib \
    inlcude/HCNetSDKCom/HCCoreDevCfg.dll \
    inlcude/HCNetSDKCom/HCDisplay.dll \
    inlcude/HCNetSDKCom/HCGeneralCfgMgr.dll \
    inlcude/HCNetSDKCom/HCGeneralCfgMgr.lib \
    inlcude/HCNetSDKCom/HCIndustry.dll \
    inlcude/HCNetSDKCom/HCPlayBack.dll \
    inlcude/HCNetSDKCom/HCPreview.dll \
    inlcude/HCNetSDKCom/HCPreview.lib \
    inlcude/HCNetSDKCom/HCVoiceTalk.dll \
    inlcude/HCNetSDKCom/OpenAL32.dll \
    inlcude/HCNetSDKCom/StreamTransClient.dll \
    inlcude/HCNetSDKCom/SystemTransform.dll \
    inlcude/HCNetSDKCom/libiconv2.dll \
    inlcude/HXVA.dll \
    inlcude/MP_Render.dll \
    inlcude/NPQos.dll \
    inlcude/PlayCtrl.dll \
    inlcude/PlayCtrl.lib \
    inlcude/SuperRender.dll \
    inlcude/YUVProcess.dll \
    inlcude/hlog.dll \
    inlcude/hpr.dll \
    inlcude/libeay32.dll \
    inlcude/libmmd.dll \
    inlcude/log4cxx.properties \
    inlcude/ssleay32.dll \
    inlcude/zlib1.dll

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/inlcude/ -lHCCore
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/inlcude/ -lHCCored

INCLUDEPATH += $$PWD/inlcude
DEPENDPATH += $$PWD/inlcude


win32:CONFIG(release, debug|release): LIBS += -L$$PWD/inlcude/ -lGdiPlus
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/inlcude/ -lGdiPlusd

INCLUDEPATH += $$PWD/inlcude
DEPENDPATH += $$PWD/inlcude

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/inlcude/ -lHCNetSDK
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/inlcude/ -lHCNetSDKd

INCLUDEPATH += $$PWD/inlcude
DEPENDPATH += $$PWD/inlcude

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/inlcude/ -lPlayCtrl
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/inlcude/ -lPlayCtrld

INCLUDEPATH += $$PWD/inlcude
DEPENDPATH += $$PWD/inlcude
