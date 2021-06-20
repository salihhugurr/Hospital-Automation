class Hasta :
    
    def __init__(self , id ,tcno , isim , soyisim ,dogumtarihi , cinsiyet ,randevutarihi,randevusaati, ilgilibölümid) :
        if id is None :
            self.id = 0
        else :
            self.id = id
        self.tcno = tcno
        self.isim = isim
        self.soyisim = soyisim
        self.dogumtarihi = dogumtarihi
        self.cinsiyet = cinsiyet
        self.randevutarihi = randevutarihi
        self.randevusaati = randevusaati
        self.ilgilibölümid = ilgilibölümid

    @staticmethod
    def CreateHasta(obj) :
        list = []

        if isinstance(obj , tuple) :
            list.append(Hasta(obj[0],obj[1],obj[2],obj[3],obj[4],obj[5],obj[6],obj[7],obj[8]))
        else :
            for i in obj :
               list.append(Hasta(i[0],i[1],i[2],i[3],i[4],i[5],i[6],i[7],i[8])) 

        return list