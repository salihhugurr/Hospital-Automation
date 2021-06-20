class Ilgilibölüm :
    
    def __init__(self , id ,bolumadı , doktorid ) :
        if id is None :
            self.id = 0
        else :
            self.id = id
            self.bolumadı = bolumadı
            self.doktorid = doktorid

    @staticmethod
    def CreateIlgilibölüm(obj) :
        list = []

        for i in obj :
            list.append(Ilgilibölüm(i[0],i[1],i[2]))

        return list

            