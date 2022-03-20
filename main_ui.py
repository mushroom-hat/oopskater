# Import other python modules
import os

from PyQt5.QtGui import QIcon
from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QFileDialog, QMessageBox
import sys
import main
import difflib
from difflib import Differ
import pandas as pd

class Ui_MainWindow(object):

    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.setFixedSize(933, 661)
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.mainPanelImage = QtWidgets.QLabel(self.centralwidget)
        self.mainPanelImage.setGeometry(QtCore.QRect(0, 0, 931, 561))
        self.mainPanelImage.setText("")
        self.mainPanelImage.setPixmap(QtGui.QPixmap("Mainpanel.jpg"))
        self.mainPanelImage.setScaledContents(True)
        self.mainPanelImage.setObjectName("mainPanelImage")

        self.pushButton = QtWidgets.QPushButton(self.centralwidget)
        self.pushButton.setGeometry(QtCore.QRect(750, 560, 181, 61))
        self.pushButton.setStyleSheet("background-color: rgb(34, 196, 255);\n"
                                      "font: 75 11pt \"Arial\" bold;\n"
                                      "")
        self.pushButton.setObjectName("pushButton")
        self.pushButton.clicked.connect(self.importFile)
        self.label = QtWidgets.QLabel(self.centralwidget)
        self.label.setGeometry(QtCore.QRect(0, 560, 751, 61))
        self.label.setStyleSheet("font: 75 11pt \"Arial\";\n"
                                 "border-color: black;\n"
                                 "background-color: rgb(255, 255, 255);")

        self.pushButton2 = QtWidgets.QPushButton(self.centralwidget)
        self.pushButton2.setGeometry(QtCore.QRect(150, 400, 200, 61))
        self.pushButton2.setStyleSheet("background-color: rgb(34, 196, 255);\n"
                                      "font: 75 11pt \"Arial\" bold;\n"
                                      "")
        self.pushButton2.setObjectName("pushButton2")
        self.pushButton2.clicked.connect(self.comparisonFile)
        self.label = QtWidgets.QLabel(self.centralwidget)
        self.label.setGeometry(QtCore.QRect(0, 560, 751, 61))
        self.label.setStyleSheet("font: 75 11pt \"Arial\";\n"
                                 "border-color: black;\n"
                                 "background-color: rgb(255, 255, 255);")

        self.label.setObjectName("label")
        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtWidgets.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 933, 18))
        self.menubar.setObjectName("menubar")
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QtWidgets.QStatusBar(MainWindow)
        self.statusbar.setObjectName("statusbar")
        MainWindow.setStatusBar(self.statusbar)
        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "MainWindow"))
        self.pushButton.setText(_translate("MainWindow", "Import"))
        self.pushButton2.setText(_translate("MainWindow", "File Comparison"))
        self.label.setText(_translate("MainWindow", "Not File / Directory Selected."))

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
        print("Opening File Dialog...")
        if self.checkDirectoryOrFile():
            self.op_dir = QFileDialog.getOpenFileName(None, "Open a file", "",
                                                      "All Files (*.*)'")
            if self.op_dir != ('', ''):
                importedItem = self.op_dir[0].replace("/", r"\\")
                self.label.setText(self.op_dir[0])
                print(importedItem)
                msg = main.process_importedFile(importedItem)

        else:
            self.op_dir = QtWidgets.QFileDialog.getExistingDirectory(None, 'Select project folder:', '',
                                                                      QtWidgets.QFileDialog.ShowDirsOnly)
            print(self.op_dir)

            if self.op_dir != ('', ''):
                importedItem = self.op_dir.replace("/", r"\\")
                self.label.setText(self.op_dir)
                print("Imported Item: " + importedItem)
                msg = main.process_importedFile(importedItem)

        print(msg)

    def comparisonFile(self):
        self.op_dir = QFileDialog.getOpenFileName(None, "Open a file", "",
                                                  "All Files (*.*)'")
        if self.op_dir != ('', ''):
            f1 = self.op_dir[0].replace("/", r"\\")
            self.label.setText(self.op_dir[0])
            print("First file: " + f1)

        self.op_dir = QFileDialog.getOpenFileName(None, "Open a file", "",
                                                  "All Files (*.*)'")

        if self.op_dir != ('', ''):
            f2 = self.op_dir[0].replace("/", r"\\")
            self.label.setText(self.op_dir[0])
            print("Second file: " + f2)

#        with open(f1, 'r') as file1:
#            with open(f2, 'r') as file2:
#                difference = set(file1).difference(file2)
#        difference.discard('\n')
#       with open('diff.txt', 'w') as file_out:
#          for line in difference:
#             file_out.write(line)

        with open(f1) as file_1, open(f2) as file_2:
            differ = Differ()
            with open('diff.txt', 'w') as file_out:
                for line in differ.compare(file_1.readlines(), file_2.readlines()):
                    file_out.write(line)

if __name__ == '__main__':
    app = QtWidgets.QApplication(sys.argv)
    MainWindow = QtWidgets.QMainWindow()
    ui = Ui_MainWindow()
    ui.setupUi(MainWindow)
    MainWindow.show()
    sys.exit(app.exec_())