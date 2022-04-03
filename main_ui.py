# Import other python modules
import os

from PyQt5.QtCore import QThread, pyqtSignal
from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QFileDialog, QMessageBox
import sys
import main
import diffviewer.mainwindow as diffviewer
import subprocess

MAIN_WINDOW = None
KEYSTORE = ""
APK_NAME = ""
OBJECT_TYPE = ""

class Ui_MainWindow(object):
    # self.importFileButton.clicked.connect(self.importFile)
    def setupUi(self, MainWindow):
        global MAIN_WINDOW
        MAIN_WINDOW = MainWindow
        MainWindow.setObjectName("Android Obfuscator")
        MainWindow.resize(931, 775)
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.mainPanelImage = QtWidgets.QLabel(self.centralwidget)
        self.mainPanelImage.setGeometry(QtCore.QRect(0, 0, 931, 330))
        self.mainPanelImage.setText("")
        self.mainPanelImage.setPixmap(QtGui.QPixmap("resources/UI/Mainpanel.png"))
        self.mainPanelImage.setScaledContents(True)
        self.mainPanelImage.setObjectName("mainPanelImage")
        self.importFileButton = QtWidgets.QPushButton(self.centralwidget)
        self.importFileButton.setGeometry(QtCore.QRect(750, 370, 181, 61))
        font = QtGui.QFont()
        font.setFamily("Arial 12")
        font.setPointSize(11)
        font.setBold(False)
        font.setItalic(False)
        font.setWeight(9)
        self.importFileButton.setFont(font)
        self.importFileButton.setStyleSheet("background-color: rgb(34, 196, 255);\n"
                                            "font: 75 8pt \"Arial\" bold;\n"
                                            "border-radius: 15px;\n"
                                            "margin-right: 5px;\n"
                                            "margin-left: 5px;\n"
                                            "")
        self.importFileButton.setObjectName("importFileButton")
        self.importFileButton.clicked.connect(self.importFile)
        self.input_apk = QtWidgets.QLabel(self.centralwidget)
        self.input_apk.setGeometry(QtCore.QRect(0, 370, 751, 61))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        font.setBold(False)
        font.setItalic(False)
        font.setWeight(9)
        self.input_apk.setFont(font)
        self.input_apk.setStyleSheet("font: 75 8pt \"Arial\";\n"
                                     "border: 2px solid #73AD21;\n"
                                     "border-radius: 15px;\n"
                                     "background-color: rgb(255, 255, 255);\n"
                                     "margin-left: 5px;\n"
                                     "")

        self.input_apk.setObjectName("input_apk")
        self.input_apk.setMargin(10)
        self.input_keystore = QtWidgets.QLabel(self.centralwidget)
        self.input_keystore.setGeometry(QtCore.QRect(0, 470, 751, 61))
        self.input_keystore.setStyleSheet("font: 75 8t \"Arial\";\n"
                                     "border: 2px solid #73AD21;\n"
                                     "border-radius: 15px;\n"
                                     "background-color: rgb(255, 255, 255);\n"
                                     "margin-left: 5px;\n"
                                     "")
        self.input_keystore.setObjectName("input_keystore")
        self.input_keystore.setMargin(10)
        self.importKeyStore_button = QtWidgets.QPushButton(self.centralwidget)
        self.importKeyStore_button.setGeometry(QtCore.QRect(750, 470, 181, 61))
        self.importKeyStore_button.setStyleSheet("background-color: rgb(34, 196, 255);\n"
                                                 "font: 75 8pt \"Arial\" bold;\n"
                                                 "border-radius: 15px;\n"
                                                 "margin-right: 5px;\n"
                                                 "margin-left: 5px;\n"
                                                 "")
        self.importKeyStore_button.setObjectName("importKeyStore_button")
        self.importKeyStore_button.clicked.connect(self.importKeyStore)
        self.importKeyStore_button.setEnabled(False)
        self.keystore_label = QtWidgets.QLabel(self.centralwidget)
        self.keystore_label.setGeometry(QtCore.QRect(10, 439, 441, 21))
        font = QtGui.QFont()
        font.setPointSize(11)
        self.keystore_label.setFont(font)
        self.keystore_label.setObjectName("keystore_label")
        self.apk_Label = QtWidgets.QLabel(self.centralwidget)
        self.apk_Label.setGeometry(QtCore.QRect(10, 340, 451, 21))
        font = QtGui.QFont()
        font.setPointSize(11)
        self.apk_Label.setFont(font)
        self.apk_Label.setObjectName("apk_Label")
        self.algorithm_label = QtWidgets.QLabel(self.centralwidget)
        self.algorithm_label.setGeometry(QtCore.QRect(10, 540, 421, 31))
        font = QtGui.QFont()
        font.setPointSize(12)
        self.algorithm_label.setFont(font)
        self.algorithm_label.setObjectName("algorithm_label")

        self.radioButton_reflection = QtWidgets.QRadioButton(self.centralwidget)
        self.radioButton_reflection.setGeometry(QtCore.QRect(10, 580, 181, 21))
        font = QtGui.QFont()
        font.setPointSize(8)
        self.radioButton_reflection.setFont(font)
        self.radioButton_reflection.setAutoExclusive(False)
        self.radioButton_reflection.setObjectName("radioButton_reflection")
        self.radioButton_renaming = QtWidgets.QRadioButton(self.centralwidget)
        self.radioButton_renaming.setGeometry(QtCore.QRect(200, 580, 221, 21))
        font = QtGui.QFont()
        font.setPointSize(8)
        self.radioButton_renaming.setFont(font)
        self.radioButton_renaming.setAutoExclusive(False)
        self.radioButton_renaming.setObjectName("radioButton_renaming")
        self.radioButton_debugging = QtWidgets.QRadioButton(self.centralwidget)
        self.radioButton_debugging.setGeometry(QtCore.QRect(200, 610, 221, 21))
        font = QtGui.QFont()
        font.setPointSize(8)
        self.radioButton_debugging.setFont(font)
        self.radioButton_debugging.setAutoExclusive(False)
        self.radioButton_debugging.setObjectName("radioButton_debugging")
        self.radioButton_str_enc = QtWidgets.QRadioButton(self.centralwidget)
        self.radioButton_str_enc.setGeometry(QtCore.QRect(430, 580, 261, 21))
        font = QtGui.QFont()
        font.setPointSize(8)
        self.radioButton_str_enc.setFont(font)
        self.radioButton_str_enc.setAutoExclusive(False)
        self.radioButton_str_enc.setObjectName("radioButton_str_enc")
        self.radioButton_goto = QtWidgets.QRadioButton(self.centralwidget)
        self.radioButton_goto.setGeometry(QtCore.QRect(430, 610, 271, 21))
        font = QtGui.QFont()
        font.setPointSize(8)
        self.radioButton_goto.setFont(font)
        self.radioButton_goto.setAutoExclusive(False)
        self.radioButton_goto.setObjectName("radioButton_goto")
        self.radioButton_overloading = QtWidgets.QRadioButton(self.centralwidget)
        self.radioButton_overloading.setGeometry(QtCore.QRect(10, 610, 181, 21))
        font = QtGui.QFont()
        font.setPointSize(8)
        self.radioButton_overloading.setFont(font)
        self.radioButton_overloading.setAutoExclusive(False)
        self.radioButton_overloading.setObjectName("radioButton_overloading")
        self.radioButton_java_renaming_method = QtWidgets.QRadioButton(self.centralwidget)
        self.radioButton_java_renaming_method.setGeometry(QtCore.QRect(10, 670, 231, 21))
        font = QtGui.QFont()
        font.setPointSize(8)
        self.radioButton_java_renaming_method.setFont(font)
        self.radioButton_java_renaming_method.setAutoExclusive(False)
        self.radioButton_java_renaming_method.setObjectName("radioButton_java_renaming_method")
        self.radioButton_java_overloading = QtWidgets.QRadioButton(self.centralwidget)
        self.radioButton_java_overloading.setGeometry(QtCore.QRect(280, 670, 231, 21))
        font = QtGui.QFont()
        font.setPointSize(8)
        self.radioButton_java_overloading.setFont(font)
        self.radioButton_java_overloading.setAutoExclusive(False)
        self.radioButton_java_overloading.setObjectName("radioButton_java_overloading")
        self.radioButton_java_remove_empty_spaces = QtWidgets.QRadioButton(self.centralwidget)
        self.radioButton_java_remove_empty_spaces.setGeometry(QtCore.QRect(550, 670, 271, 21))
        font = QtGui.QFont()
        font.setPointSize(8)
        self.radioButton_java_remove_empty_spaces.setFont(font)
        self.radioButton_java_remove_empty_spaces.setAutoExclusive(False)
        self.radioButton_java_remove_empty_spaces.setObjectName("radioButton_java_remove_empty_spaces")
        self.radioButton_java_prodcdure = QtWidgets.QRadioButton(self.centralwidget)
        self.radioButton_java_prodcdure.setGeometry(QtCore.QRect(10, 700, 331, 21))
        font = QtGui.QFont()
        font.setPointSize(8)
        self.radioButton_java_prodcdure.setFont(font)
        self.radioButton_java_prodcdure.setAutoExclusive(False)
        self.radioButton_java_prodcdure.setObjectName("radioButton_java_prodcdure")
        self.line = QtWidgets.QFrame(self.centralwidget)
        self.line.setGeometry(QtCore.QRect(10, 640, 911, 21))
        self.line.setFrameShape(QtWidgets.QFrame.HLine)
        self.line.setFrameShadow(QtWidgets.QFrame.Sunken)
        self.line.setObjectName("line")
        self.buttonObfuscation = QtWidgets.QPushButton(self.centralwidget)
        self.buttonObfuscation.setGeometry(QtCore.QRect(10, 810, 921, 41))
        self.buttonObfuscation.setStyleSheet("background-color: rgb(0, 215, 104);\n"
                                             "font: 75 12pt \"Arial\" bold;\n"
                                              "border-radius: 15px;\n"
                                                "margin-right: 5px;\n"
                                                 "margin-left: 5px;\n"
                                             "")
        self.buttonObfuscation.setObjectName("buttonObfuscation")
        self.buttonObfuscation.hide()
        self.buttonObfuscation.clicked.connect(self.obfuscate)
        self.input_progression = QtWidgets.QLabel(self.centralwidget)
        self.input_progression.setGeometry(QtCore.QRect(10, 740, 921, 61))
        self.input_progression.setStyleSheet("font: 75 11pt \"Arial\";\n"
                                            "border: 2px solid #000000;\n"
                                     "border-radius: 15px;\n"
                                             "margin-right:5px;\n"
                                     "background-color: rgb(255, 255, 255);\n")
        self.input_progression.setObjectName("input_progression")
        self.input_progression.hide()
        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtWidgets.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 931, 21))
        self.menubar.setObjectName("menubar")
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QtWidgets.QStatusBar(MainWindow)
        self.statusbar.setObjectName("statusbar")
        MainWindow.setStatusBar(self.statusbar)

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)


    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "Android / JAVA Obfuscator"))
        self.importFileButton.setText(_translate("MainWindow", "Add File / Directory"))
        self.input_apk.setText(_translate("MainWindow", "Not File / Directory Selected."))
        self.input_keystore.setText(
            _translate("MainWindow", "Disabled. Only allowed when u select an apk. "))
        self.importKeyStore_button.setText(_translate("MainWindow", "Disabled."))
        self.keystore_label.setText(_translate("MainWindow", "Key Store"))
        self.apk_Label.setText(_translate("MainWindow", "APK / Directory"))
        self.algorithm_label.setText(_translate("MainWindow", "Algorithm Selected"))
        self.radioButton_reflection.setText(_translate("MainWindow", "Reflection"))
        self.radioButton_renaming.setText(_translate("MainWindow", "Renaming Field"))
        self.radioButton_debugging.setText(_translate("MainWindow", "Remove Debugging"))
        self.radioButton_str_enc.setText(_translate("MainWindow", "String Encryption"))
        self.radioButton_goto.setText(_translate("MainWindow", "Add GOTO Statement"))
        self.radioButton_overloading.setText(_translate("MainWindow", "Overloading"))
        self.radioButton_java_renaming_method.setText(_translate("MainWindow", "JAVA Renaming"))
        self.radioButton_java_overloading.setText(_translate("MainWindow", "JAVA Overloading"))
        self.radioButton_java_remove_empty_spaces.setText(_translate("MainWindow", "JAVA Remove Empty Spaces"))
        self.radioButton_java_prodcdure.setText(_translate("MainWindow", "JAVA Obfuscate Numeric Value"))
        self.buttonObfuscation.setText(_translate("MainWindow", "Obfuscate "))
        self.input_progression.setText(_translate("MainWindow", "Please click the button below."))


    def checkDirectoryOrFile(self):
        self.messageBox = QMessageBox()
        self.messageBox.setWindowTitle("Import Options")
        self.messageBox.setText("Are you importing a file or directory?")

        self.buttonoptionDirectory = self.messageBox.addButton("Directory", QMessageBox.YesRole)
        self.buttonoptionFile = self.messageBox.addButton("File", QMessageBox.AcceptRole)
        self.messageBox.setDefaultButton(self.buttonoptionFile)

        self.messageBox.exec_()
        if self.messageBox.clickedButton() == self.buttonoptionDirectory:
            return 0
        return 1

    def importFile(self):
        global MAIN_WINDOW
        print("Opening File Dialog...")
        importedItem = None
        if self.checkDirectoryOrFile():
            self.op_dir = QFileDialog.getOpenFileName(None, "Open a file", "",
                                                      "All Files (*.*)'")
            if self.op_dir != ('', ''):
                importedItem = self.op_dir[0].replace("/", r"\\")
                self.input_apk.setText(self.op_dir[0])

        else:
            self.op_dir = QtWidgets.QFileDialog.getExistingDirectory(None, 'Select project folder:', '',
                                                                     QtWidgets.QFileDialog.ShowDirsOnly)

            if self.op_dir != ('', ''):
                importedItem = self.op_dir.replace("/", r"\\")
                self.input_apk.setText(self.op_dir)



        self.importedItem = importedItem
        self.object_type = self.check_imported_item(str(importedItem))
        if self.object_type == None:
            self.input_apk.setText("Input wrong format file. Please double check.")
        else:
            self.disable_UI_checkbox(self.object_type)
            self.buttonObfuscation.show()
            self.input_progression.show()
            MAIN_WINDOW.resize(933, 900)


    def importKeyStore(self):
        global KEYSTORE
        self.op_dir = QFileDialog.getOpenFileName(None, "Open a file", "",
                                                  "All Files (*.*)'")
        if self.op_dir != ('', ''):
            importedKeyStore = self.op_dir[0].replace("/", r"\\")

            if (importedKeyStore.split('\\')[-1]).split('.')[-1] != 'keystore':
                print("Imported Key Store:", importedKeyStore)
                self.input_keystore.setText("Imported wrong file format. Please check if the file you importing")
            else:
                self.input_keystore.setText(self.op_dir[0])
                KEYSTORE = self.op_dir[0]


    def obfuscate(self):
        dict = {}

        if self.radioButton_goto.isChecked():
            dict['goto'] = True
        else:
            dict['goto'] = False

        if self.radioButton_debugging.isChecked():
            dict['debug'] = True
        else:
            dict['debug'] = False

        if self.radioButton_overloading.isChecked():
            dict['overloading'] = True
        else:
            dict['overloading'] = False

        if self.radioButton_reflection.isChecked():
            dict['reflection'] = True
        else:
            dict['reflection'] = False

        if self.radioButton_renaming.isChecked():
            dict['renaming_field'] = True
        else:
            dict['renaming_field'] = False

        if self.radioButton_str_enc.isChecked():
            dict['encrypt'] = True
        else:
            dict['encrypt'] = False

        if self.radioButton_java_renaming_method.isChecked():
            dict['renaming'] = True
        else:
            dict['renaming'] = False

        if self.radioButton_java_remove_empty_spaces.isChecked():
            dict['rm_empty_space'] = True
        else:
            dict['rm_empty_space'] = False

        if self.radioButton_java_prodcdure.isChecked():
            dict['numeric'] = True
        else:
            dict['numeric'] = False

        if self.radioButton_java_overloading.isChecked():
            dict['overloading_method'] = True
        else:
            dict['overloading_method'] = False

        print("Selected Algorithm: ",dict)
        if True in dict.values():
            self.worker = WorkerThreadProcessing(self.importedItem, dict)
            self.worker.start()
            self.worker.finished.connect(self.evt_worker_finished)
            self.worker.upgrade_progress.connect(self.evt_upgrade_progress)
        else:
            self.input_progression.setText("Please select an algorithm.")


    def disable_UI_checkbox(self, objectType):
        if objectType == "APK":
            self.radioButton_java_overloading.setDisabled(True)
            self.radioButton_java_prodcdure.setDisabled(True)
            self.radioButton_java_remove_empty_spaces.setDisabled(True)
            self.radioButton_java_renaming_method.setDisabled(True)

            self.radioButton_goto.setEnabled(True)
            self.radioButton_str_enc.setEnabled(True)
            self.radioButton_overloading.setEnabled(True)
            self.radioButton_debugging.setEnabled(True)
            self.radioButton_reflection.setEnabled(True)
            self.radioButton_renaming.setEnabled(True)

        elif objectType == "JAVA":
            self.radioButton_java_overloading.setEnabled(True)
            self.radioButton_java_prodcdure.setEnabled(True)
            self.radioButton_java_remove_empty_spaces.setEnabled(True)
            self.radioButton_java_renaming_method.setEnabled(True)

            self.radioButton_goto.setDisabled(True)
            self.radioButton_str_enc.setDisabled(True)
            self.radioButton_overloading.setDisabled(True)
            self.radioButton_debugging.setDisabled(True)
            self.radioButton_reflection.setDisabled(True)
            self.radioButton_renaming.setDisabled(True)
            self.input_keystore.setText("Disabled. Only available if you import an apk")
            self.importKeyStore_button.setText("Disabled")
        elif objectType == "DIR":
            self.radioButton_java_overloading.setEnabled(True)
            self.radioButton_java_prodcdure.setEnabled(True)
            self.radioButton_java_remove_empty_spaces.setEnabled(True)
            self.radioButton_java_renaming_method.setEnabled(True)

            self.radioButton_goto.setDisabled(True)
            self.radioButton_str_enc.setDisabled(True)
            self.radioButton_overloading.setDisabled(True)
            self.radioButton_debugging.setDisabled(True)
            self.radioButton_reflection.setDisabled(True)
            self.radioButton_renaming.setDisabled(True)
            self.input_keystore.setText("Disabled. Only available if you import an apk")
            self.importKeyStore_button.setText("Disabled")
        else:
            self.input_progression.setText("Please input an item.")
            self.input_apk.setText("Please input an item.")

    def check_imported_item(self, importedObj):
        """ This function check the imported file type. """
        global APK_NAME, OBJECT_TYPE, KEYSTORE
        print("Checking Imported Item", importedObj)
        try:
            imported_list = importedObj.split('.')
        except:
            pass
        if importedObj == 'None' or importedObj is None or len(imported_list) == 0:
            OBJECT_TYPE = None
            return None
        if len(imported_list) < 2 and importedObj is not None and importedObj != "None":
            self.importKeyStore_button.setEnabled(False)
            self.input_keystore.setText("Disabled. Only allowed when u select an apk. ")
            KEYSTORE = None
            APK_NAME = None
            OBJECT_TYPE = "DIR"
            return "DIR"
        if len(imported_list) > 1 and imported_list[-1] == 'apk':
            OBJECT_TYPE = "APK"
            APK_NAME = imported_list[0].split('\\\\')[-1]
            self.importKeyStore_button.setEnabled(True)
            self.importKeyStore_button.setText("Import Keystore")
            self.input_keystore.setText("If no keystore detect, default keystore will be loaded. ")
            return "APK"
        elif len(imported_list) > 1 and imported_list[-1] == 'java':
            self.importKeyStore_button.setEnabled(False)
            self.input_keystore.setText("Disabled. Only allowed when u select an apk. ")
            KEYSTORE = None
            APK_NAME = None
            OBJECT_TYPE = "JAVA"
            return "JAVA"
        else:
            return None

    def evt_worker_finished(self, text_qns = "Password"):
        global KEYSTORE, APK_NAME, OBJECT_TYPE
        success = False
        self.input_progression.setText("Signing APK.")
        if OBJECT_TYPE == "DIR":
            success = True
            self.input_progression.setText("Success.")

        else:
            print("\n===== SIGNING APK w key =====")
            if len(KEYSTORE) == 0 and OBJECT_TYPE == 'APK':
                print("Signing with default key store.")
                KEYSTORE = 'resources/APK/signing.keystore'
                try:
                    os.system(
                    "build-tools\\32.0.0\\apksigner.bat sign --ks " + KEYSTORE + " --ks-pass pass:123123 " + APK_NAME + "\\dist\\" + APK_NAME + ".apk")


                    # print("\n===== REALIGNING APK =====")
                    old_apk = APK_NAME + "\\dist\\" + APK_NAME + ".apk"
                    new_apk = APK_NAME + "\\dist\\" + "obfuscated_" + APK_NAME + ".apk"
                    realignment_command = 'build-tools\\32.0.0\\zipalign -p -f -v 4 "' + old_apk + '" "' + new_apk + '"'
                    os.popen(realignment_command)


                    os.system(
                        "build-tools\\32.0.0\\apksigner.bat sign --ks " + KEYSTORE + " --ks-pass pass:123123 " + APK_NAME + "\\dist\\" + "obfuscated_" + APK_NAME + ".apk")
                    self.input_progression.setText("Success.")
                    print("Done")




                    success = True
                except:
                    self.input_progression.setText("Obfuscated. But fail to sign.")
                    print("Fail to sign.")

            elif OBJECT_TYPE == 'APK' and KEYSTORE != 'resources/APK/signing.keystore':
                password, ok = QtWidgets.QInputDialog.getText(
                    None, 'KeyStore', text_qns)

                if ok:
                    command_line = 'build-tools\\32.0.0\\apksigner.bat sign --ks "' + KEYSTORE + '" --ks-pass pass:'+ str(password) + ' ' + APK_NAME + '\\dist\\' + APK_NAME + '.apk'

                    if os.system(command_line) != 0:
                        self.input_progression.setText("Wrong Key Store Password")
                        self.evt_worker_finished("Wrong Password. Try Again")
                    else:
                        # print("\n===== REALIGNING APK =====")
                        old_apk = APK_NAME + "\\dist\\" + APK_NAME + ".apk"
                        new_apk = APK_NAME + "\\dist\\" + "obfuscated_" + APK_NAME + ".apk"
                        realignment_command = 'build-tools\\32.0.0\\zipalign -p -f -v 4 "' + old_apk + '" "' + new_apk + '"'
                        os.popen(realignment_command)
                        os.system(
                            'build-tools\\32.0.0\\apksigner.bat sign --ks "' + KEYSTORE + '" --ks-pass pass:'+ str(password) + ' ' + APK_NAME + '\\dist\\obfuscated_' + APK_NAME + '.apk')

                        success = True
                        self.input_progression.setText("Success.")
                        print("Signed.")

                else:
                    self.input_progression.setText("Obfuscated. But fail to sign.")
                    print("Fail to sign.")

        if success:
            windows_diff = diffviewer.MainWindow()
            windows_diff.start(os.getcwd() + '\\diffviewer\\bak', os.getcwd() + '\\diffviewer\\new')



    def evt_upgrade_progress(self, value):
        self.input_progression.setText(value)


class WorkerThreadProcessing(QThread):
    upgrade_progress = pyqtSignal(str)

    def __init__(self, importFile, algorithm_selected_dict):
        super().__init__()
        self.importItem = importFile
        self.algorithm_selected_dict = algorithm_selected_dict

    def run(self):
        self.upgrade_progress.emit("Processing ... ")
        self.result = main.process_importedFile(self.importItem, self.upgrade_progress,
                                                self.algorithm_selected_dict)
        if self.result == 1:
            self.upgrade_progress.emit("Success :)")
        else:
            self.upgrade_progress.emit("Something went wrong.")


if __name__ == '__main__':
    app = QtWidgets.QApplication(sys.argv)
    MainWindow = QtWidgets.QMainWindow()
    ui = Ui_MainWindow()
    ui.setupUi(MainWindow)
    MainWindow.show()
    sys.exit(app.exec_())
