import mysql.connector
from datetime import datetime
from connection import connection
from Hasta import Hasta
from Doktor import Doktor
from Ilgilibölüm import Ilgilibölüm

class DbManager  :
    def __init__(self ,) :
        self.connection = connection 
        self.cursor = self.connection.cursor()

    def getHastaById(self,id ) :
        sql = "select * from hasta where id = %s"
        value = (id ,)
        self.cursor.execute(sql,value)
        try :
            obj = self.cursor.fetchone()
            return Hasta.CreateHasta(obj)
        except mysql.connector.Error as err :
            print('Error :'  , err)

    def deleteHasta(self,hastaid) :
        sql = "delete from hasta where id =%s"
        value = (hastaid,)
        self.cursor.execute(sql , value)

        try :
            self.connection.commit()
            print(f'{self.cursor.rowcount} tane kayıt silindi.')
        except mysql.connector.Error as err :
            print('hata :' , err)



    def getIlgilibölümler(self) :
        sql = "select * from ilgilibölüm "
        self.cursor.execute(sql)
        try :
            obj = self.cursor.fetchall()
            return Ilgilibölüm.CreateIlgilibölüm(obj)
        except mysql.connector.Error as err :
            print('Error :'  , err)
  


        

    def getHastalarByIlgilibölümId(self,ilgilibölümid ) :
        sql = "select * from hasta where ilgilibölümid = " + str(ilgilibölümid)
        self.cursor.execute(sql)
        try :
            obj = self.cursor.fetchall()
            return Hasta.CreateHasta(obj)
        except mysql.connector.Error as err :
            print('Error :'  , err)
  

    def addHasta(self , hasta : Hasta) :
        sql = "INSERT INTO Hasta(tcno , isim , soyisim , dogumtarihi , cinsiyet ,randevutarihi,randevusaati, ilgilibölümid) VALUES (%s , %s ,%s ,%s ,%s ,%s,%s,%s)"
        value = (hasta.tcno , hasta.isim , hasta.soyisim , hasta.dogumtarihi , hasta.cinsiyet ,hasta.randevutarihi,hasta.randevusaati ,hasta.ilgilibölümid)
        self.cursor.execute(sql , value)

        try :
            self.connection.commit()
            print(f'{self.cursor.rowcount} tane kayıt eklendi')
        except mysql.connector.Error as err :
            print('hata :' , err)

        

    def editHasta(self , hasta : Hasta) :
        sql = "update hasta set tcno = %s , isim = %s , soyisim = %s , dogumtarihi = %s , cinsiyet = %s ,randevutarihi = %s ,randevusaati = %s, ilgilibölümid = %s where id = %s"
        value = (hasta.tcno , hasta.isim , hasta.soyisim , hasta.dogumtarihi , hasta.cinsiyet ,hasta.randevutarihi,hasta.randevusaati, hasta.ilgilibölümid , hasta.id)
        self.cursor.execute(sql , value)

        try :
            self.connection.commit()
            print(f'{self.cursor.rowcount} tane kayıt güncellendi.')
        except mysql.connector.Error as err :
            print('hata :' , err)


    def addDoktor(self , doktor : Doktor) :
        pass

    def editDoktor(self , doktor : Doktor) :
        pass

    


# db = DbManager()

# hasta = db.getHastaById(4)

# hasta[0].isim = "hasan"
# db.addHasta(hasta[0])
#db.editHasta(hasta[0])



 #print(hasta[0].isim)
 #print(hasta[0].soyisim)

 #hastalar = db.getHastalarByIlgilibölümId(1)
 #print(hastalar[0].isim)
 #print(hastalar[2].isim)







