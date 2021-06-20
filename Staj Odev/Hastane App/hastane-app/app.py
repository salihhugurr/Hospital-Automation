from PyQt5 import QtWidgets,QtCore,QtGui,Qt
from PyQt5.QtWidgets import QMessageBox
import sys
from MainWindow import Ui_MainWindow
from dbmanager import DbManager
from Hasta import Hasta
import datetime
from PyQt5.QtCore import pyqtSlot
app= QtWidgets.QApplication(sys.argv)

class App(QtWidgets.QMainWindow) :
    def __init__(self) :
        super(App , self).__init__()
        self.ui=Ui_MainWindow()
        self.ui.setupUi(self)
        self.ui.comboBox.addItem('Psikiyatri')
        self.ui.comboBox.addItem('Dermatoloji')
        self.ui.comboBox.addItem('Onkoloji')
        self.ui.comboBox.addItem('Kardiyoloji')
        self.ui.comboBox.addItem('Üroloji')
        self.ui.comboBox.addItem('Radyoloji')
        self.ui.comboBox.addItem('Fizyoloji')
        self.ui.comboBox.activated.connect(self.comboBoxChange)

        self.ui.bolumsec.addItem('Psikiyatri')
        self.ui.bolumsec.addItem('Dermatoloji')
        self.ui.bolumsec.addItem('Onkoloji')
        self.ui.bolumsec.addItem('Kardiyoloji')
        self.ui.bolumsec.addItem('Üroloji')
        self.ui.bolumsec.addItem('Radyoloji')
        self.ui.bolumsec.addItem('Fizyoloji')
        self.ui.randevuButton.clicked.connect(self.listele)
        
        self.ui.comboBox_2.addItem('Ahmet Aydın')
        self.ui.comboBox_2.addItem('Selma Deniz')
       
        self.db = DbManager()
        self.ui.pushButton.clicked.connect(self.ButtonFunction)

        
    def comboBoxChange(self) :
        id = self.ui.comboBox.currentIndex()
        self.ui.comboBox_2.clear()
        if id == 0 :
            self.ui.comboBox_2.addItem('Ahmet Aydın')
            self.ui.comboBox_2.addItem('Selma Deniz') 
        elif id == 1 :
            self.ui.comboBox_2.addItem('Kaan Mangır')
            self.ui.comboBox_2.addItem('Salih Uğur') 
        elif id == 2 :
            self.ui.comboBox_2.addItem('Ahmet Başaran')
            self.ui.comboBox_2.addItem('Selahaddin Polat') 
        elif id == 3 :
            self.ui.comboBox_2.addItem('Meral Demir')
            self.ui.comboBox_2.addItem('Elif Demiral') 
        elif id == 4 :
            self.ui.comboBox_2.addItem('Emine Mor')
            self.ui.comboBox_2.addItem('İrem Kelleci') 
        elif id == 5 :
            self.ui.comboBox_2.addItem('Murat Doğan')
            self.ui.comboBox_2.addItem('İpek Zengin') 
        elif id == 6 :
            self.ui.comboBox_2.addItem('Mehmet Üstün')
            self.ui.comboBox_2.addItem('Nida Duran') 

        
    def listele(self):
        idx = self.ui.bolumsec.currentIndex() + 1
        hs = self.db.getHastalarByIlgilibölümId(idx)
        msg = QMessageBox()
        msg.setWindowTitle("Randevu Listesi !!!")
        msg.setText("\n".join([i.isim + "\t" + i.soyisim + "\tRandevu Tarihi: " + str(i.randevutarihi) + "-"+ str(i.randevusaati)+"0" for i in hs]))        
        msg.exec_()

    def showDialog(self) :
        msg = QMessageBox()
        msg.setWindowTitle("Başarılı !!!")
        msg.setText("Başvurunuz Alınmıştır.")
        msg.exec_()
        
    
        
        
    @pyqtSlot() 
    def ButtonFunction(self) :
        number = self.ui.tcno.toPlainText()
        name =self.ui.isim.toPlainText()
        surname = self.ui.soyisim.toPlainText()
        birthdate = self.ui.dogum.date().toPyDate()
        gender = self.ui.cinsiyet.toPlainText()
        saatler =self.ui.saatler.children()
        randevutarihi = self.ui.dateEdit.date().toPyDate()
        ilgilibölümid = self.ui.comboBox.currentIndex()+1
        print(ilgilibölümid)
        for i in saatler :
            if i.isChecked() :
                saat = i.text()


        self.ui.isim.setPlainText("")
        self.ui.soyisim.setPlainText("")
        self.ui.cinsiyet.setPlainText("")
        self.ui.tcno.setPlainText("")
       

        hasta = Hasta(None ,number , name , surname ,birthdate , gender ,randevutarihi,saat, ilgilibölümid)
        self.db.addHasta(hasta)
        self.showDialog()
        


sb = App()
sb.show()
sys.exit(app.exec_())










