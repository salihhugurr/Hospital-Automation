class Doktor :
    
    def __init__(self , id ,branş , isim , soyisim ,dogumtarihi , cinsiyet , ) :
        if id is None :
            self.id = 0
        else :
            self.id = id
            self.branş = branş
            self.isim = isim
            self.soyisim = soyisim
            self.dogumtarihi = dogumtarihi
            self.cinsiyet = cinsiyet
            