import stanza



def findDeprelUpos(l,deprel,upos):

    for e in l:

        if (e.deprel==deprel and e.upos==upos):

            return(e)

    return(None)


def findDeprelHead(l,deprel,head):

    for e in l:

        if (e.deprel==deprel and e.head==head):

            return(e)

    return(None)

def findDeprelHeadn(m,l,deprel,head):

    for e in l:

        if (e.deprel==deprel and e.head==head and e.id>m):

            return(e)

    return(None)


stanza.download('pt')




nlp = stanza.Pipeline('pt')

#doc = nlp("O João comprou um livro.")

#doc = nlp("Em 2022, o João vendeu o livro que tinha a capa amarela.")

#doc = nlp("Em 2022, o João vendeu o livro que tinha comprado à Maria.")

doc = nlp("Em 2022, o João vendeu o livro que tinha comprado à Maria")

print(doc.sentences[0].words)

i=0

lent=[]

lcond=[]

v = findDeprelUpos(doc.sentences[0].words,"root","VERB")

if v!= None:

    v1= "X"+str(i)

    i=i+1

    lent+=  [v1]

    lcond+=[(v1,v.lemma)]

    suj = findDeprelHead(doc.sentences[0].words,"nsubj",v.id)

    obj = findDeprelHead(doc.sentences[0].words,"obj",v.id)

    iobj = findDeprelHead(doc.sentences[0].words,"iobj",v.id)

    obl = findDeprelHead(doc.sentences[0].words,"obl",v.id)




    if suj != None:

        x= "X"+str(i)

        i=i+1

        lent+=[x]

        lcond+=[(x,suj.lemma),(v1,"agent",x)]


        nmod = findDeprelHead(doc.sentences[0].words,"nmod",suj.id)

        if nmod != None:
           xmod= "X"+str(i)
           prep = findDeprelHead(doc.sentences[0].words,"case",nmod.id)

           i=i+1

           lent+=[xmod]

           lcond+=[(xmod,nmod.lemma),(x,prep.lemma,xmod)]
        
        
        amod = findDeprelHead(doc.sentences[0].words,"amod",suj.id)
        if amod !=None:
            
            lcond+=[(x,amod.lemma)]



    if obj != None:

        y= "X"+str(i)

        i=i+1

        lent+=[y]

        lcond+=[(y,obj.lemma),(v1,"obj",y)]


        nmod = findDeprelHead(doc.sentences[0].words,"nmod",obj.id)
        if nmod != None:
            xmod= "X"+str(i)

            prep = findDeprelHead(doc.sentences[0].words,"case",nmod.id)
            i=i+1

            lent+=[xmod]

            lcond+=[(xmod,nmod.lemma),(y,prep.lemma,xmod)]

    if iobj != None:

        z= "X"+str(i)

        i=i+1

        lent+=[z]

        lcond+=[(z,iobj.lemma),(v1,"iobj",z)]

    if obl != None:

        w= "X"+str(i)

        i=i+1

        lent+=[w]

        prep = findDeprelHead(doc.sentences[0].words,"case",obl.id)

        lcond+=[(w,obl.lemma),(v1,prep.lemma,w)]



        
        amod = findDeprelHead(doc.sentences[0].words,"amod",obl.id)
        if amod != None:
            lcond+=[(w,amod.lemma)]


        obl = findDeprelHeadn(obl.id,doc.sentences[0].words,"obl",v.id)

        if obl != None:
            xmod= "X"+str(i)

            prep = findDeprelHead(doc.sentences[0].words,"case",obl.id)
            i=i+1

            lent+=[xmod]

            lcond+=[(xmod,obl.lemma),(v1,prep.lemma,xmod)]

    





# oração relativa no obj da frase principal
v2 = findDeprelHead(doc.sentences[0].words,"acl:relcl",obj.id)
print("llllllllllllllllllllllllll",v2)
if v2!= None:

    v1= "X"+str(i)

    i=i+1

    lent+=  [v1]

    lcond+=[(v1,v2.lemma)]

    sujor = findDeprelHead(doc.sentences[0].words,"nsubj",v2.id)

    print("..........................",sujor)
    objor = findDeprelHead(doc.sentences[0].words,"obj",v2.id)

    iobjor = findDeprelHead(doc.sentences[0].words,"iobj",v2.id)

    oblor = findDeprelHead(doc.sentences[0].words,"obl",v2.id)
    
    if objor != None and objor.upos == "PRON":
        objor.lemma = obj.lemma
        lcond+=[(v1,"obj",y)]


    if sujor != None and sujor.upos == "PRON":
        sujor.lemma = obj.lemma
        lcond+=[(v1,"agent",y)]

    if sujor != None and sujor.upos != "PRON":

        x= "X"+str(i)

        i=i+1

        lent+=[x]

        lcond+=[(x,sujor.lemma),(v1,"agent",x)]


        nmod = findDeprelHead(doc.sentences[0].words,"nmod",sujor.id)

        if nmod != None:
           xmod= "X"+str(i)
           prep = findDeprelHead(doc.sentences[0].words,"case",nmod.id)

           i=i+1

           lent+=[xmod]

           lcond+=[(xmod,nmod.lemma),(x,prep.lemma,xmod)]
        
        
        amod = findDeprelHead(doc.sentences[0].words,"amod",sujor.id)
        if amod !=None:
            
            lcond+=[(x,amod.lemma)]

    

    if objor != None and objor.upos != "PRON":

        y= "X"+str(i)

        i=i+1

        lent+=[y]

        lcond+=[(y,objor.lemma),(v1,"obj",y)]


        nmod = findDeprelHead(doc.sentences[0].words,"nmod",objor.id)
        if nmod != None:
            xmod= "X"+str(i)

            prep = findDeprelHead(doc.sentences[0].words,"case",nmod.id)
            i=i+1

            lent+=[xmod]

            lcond+=[(xmod,nmod.lemma),(y,prep.lemma,xmod)]

        amod = findDeprelHead(doc.sentences[0].words,"amod",objor.id)
        if amod !=None:
            
            lcond+=[(y,amod.lemma)]



    if iobjor != None:

        z= "X"+str(i)

        i=i+1

        lent+=[z]

        lcond+=[(z,iobjor.lemma),(v1,"iobj",z)]

    if oblor != None:

        w= "X"+str(i)

        i=i+1

        lent+=[w]

        prep = findDeprelHead(doc.sentences[0].words,"case",oblor.id)

        lcond+=[(w,oblor.lemma),(v1,prep.lemma,w)]



        
        amod = findDeprelHead(doc.sentences[0].words,"amod",oblor.id)
        if amod != None:
            lcond+=[(w,amod.lemma)]


        oblor = findDeprelHeadn(oblor.id,doc.sentences[0].words,"obl",v.id)

        if oblor != None:
            xmod= "X"+str(i)

            prep = findDeprelHead(doc.sentences[0].words,"case",oblor.id)
            i=i+1

            lent+=[xmod]

            lcond+=[(xmod,oblor.lemma),(v1,prep.lemma,xmod)]

        




print("Lista entidades:",lent)

print("Lista condições:")

for e in lcond: print("\t",e)



