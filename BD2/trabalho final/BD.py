def CREATE_PERSON(Name):
    return "create (n:pessoa{nome:\"" + Name + "\"}) return n"



def CREATE_UTILIZADOR(Name):
    return "create (n:utilizador{nome:\"" + Name + "\"}) return n"


def CREATE_MOVIE(Name):
    return "create (n:movie{nome:\"" + Name + "\"}) return n"


def CREATE_DESCRICAO(descricao,MOVIE):
    return "Match  (a:movie) +\
            where a.name = \"" + MOVIE + "\" +\
            a.descricao = \"" + descricao + "\" return n"

def MOVIE_NOVO(MOVIE):
    novo = "S"
    return "Match  (a:movie) +\
            where a.name = \"" + MOVIE + "\" +\
            a.novo = \"" + novo + "\" return n"

def MOVIE_VELHO(MOVIE):
    novo = "N"
    return "Match  (a:movie) +\
            where a.name = \"" + MOVIE + "\" +\
            a.novo = \"" + novo + "\" return n"

def ADD_Genero_MOVIE(Genero,MOVIE):
    return  "Match (a:genero), +\
            (b:movie) +\
            where a.nome=\"" + Genero + "\" and b.nome = \"" + MOVIE + "\" +\
            CREATE (a)-[r:genero]->(b) +\
            return type(r)"

def ADD_Genero_utilizador(Genero,NOME):
    return  "Match (a:genero), +\
            (b:utilizador) +\
            where a.nome=\"" + Genero + "\" and b.nome = \"" + NOME + "\" +\
            CREATE (a)-[r:genero_preferido]->(b) +\
            return type(r)"

def CREATE_AMIGOS(Name1,Name2):
    return "Match (a:utilizador), (b:utilizador) +\
            where a.nome=\"" + Name1 + "\" and b.nome = \"" + Name2 + "\" CREATE (a)-[r:amigo]->(b) +\
            Match (a:utilizador), +\
            (b:utilizador) +\
            where a.nome=\"" + Name2 + "\" and b.nome = \"" + Name1 + "\" +\
            CREATE (a)-[r:amigo]->(b) +\
            return type(r)"

def ADD_utilizador_assistiu(UTILIZADOR,MOVIE):
    return  "Match (a:utilizador), +\
            (b:movie) +\
            where a.nome=\"" + UTILIZADOR + "\" and b.nome = \"" + MOVIE + "\" +\
            CREATE (a)-[r:assistiu]->(b) +\
            return type(r)"

def ADD_ACTOR_TO_MOVIE(ACTOR,MOVIE):
    return  "Match (a:pessoa), +\
            (b:movie) +\
            where a.nome=\"" + ACTOR + "\" and b.nome = \"" + MOVIE + "\" +\
            CREATE (a)-[r:participou_em]->(b) +\
            return type(r)"

def ADD_DIRECTOR_TO_MOVIE(DIRECTOR,MOVIE):
    return  "Match (a:pessoa), +\
            (b:movie) +\
            where a.nome=\"" + DIRECTOR + "\" and b.nome = \"" + MOVIE + "\" +\
            CREATE (a)-[r:direcionou]->(b) +\
            return type(r)"