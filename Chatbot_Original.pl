:- use_module(library(random)).
:- dynamic anime/1.
:- dynamic popularidad/2.
:- dynamic rating/2.
:- dynamic generoAnime/2.

and(A, B):- A, B.
and(A, B, C):- A, B, C.
and(A, B, C, D):- A, B, C, D.

anime(X) :- member(
    X, 
    [
        "Dragon Ball",
        "Naruto",
        "Bleach",
        "HunterXHunter",
        "Hamtaro",
        "Full Metal Alchemist",
        "Suzumiya Haruhi No Yuutsu",
        "Sword Art Online",
        "Another",
        "Death Note",
        "Attack On Titan",
        "Steins;Gate",
        "Pokemon",
        "InuYasha",
        "Kuroshitsuji",
        "Yu-Gi-Oh!",
        "Digimon",
		"Eureka Seven",
		"School Days",
		"Free!",
		"Cowboy Bebop",
		"Planet Survival",
		"Noir",
		"Gundam",
		"Accel World"
    ]
).
    
genero(X) :- member(
    X,
    [
        "Aventura",
        "Shoujo",
        "Shounen",
        "Kodomo",
        "Seinen",
        "Josei",
        "Ficcion",
        "Fantasia",
        "Mecha",
        "Sobrenatural",
        "Magia",
        "Gore"
    ]
).


generoAnime("Naruto", ["Shounen","Aventura"]).
generoAnime("Dragon Ball", ["Shounen"]).
generoAnime("Bleach", ["Shounen", "Sobrenatural"]).
generoAnime("HunterXHunter", ["Seinen", "Aventura"]).
generoAnime("Hamtaro", ["Kodomo"]).
generoAnime("Full Metal Alchemist", ["Shounen", "Magia"]).
generoAnime("Suzumiya Haruhi No Yuutsu", ["Aventura", "Fantasia", "Sobrenatural"]).
generoAnime("Sword Art Online", ["Aventura", "Ficcion", "Fantasia"]).
generoAnime("Another", ["Aventura", "Sobrenatural", "Gore"]).
generoAnime("Death Note", ["Aventura", "Sobrenatural", "Ficcion"]).
generoAnime("Attack On Titan", ["Aventura", "Gore"]).
generoAnime("Steins;Gate", ["Ficcion", "Aventura", "Sobrenatural"]).
generoAnime("Pokemon", ["Fantasia", "Aventura", "Kodomo"]).
generoAnime("InuYasha", ["Aventura", "Shoujo"]).
generoAnime("Kuroshitsuji", ["Shoujo"]).
generoAnime("Yu-Gi-Oh!", ["Magia", "Ficcion", "Shounen"]).
generoAnime("Digimon", ["Fantasia", "Aventura", "Shounen", "Kodomo"]).
generoAnime("Eureka Seven", ["Aventura", "Mecha", "Magia"]).
generoAnime("School Days", ["Shoujo", "Josei"]).
generoAnime("Free!", ["Shoujo", "Josei"]).
generoAnime("Cowboy Bebop", ["Ficcion", "Aventura"]).
generoAnime("Planet Survival", ["Ficcion", "Aventura", "Shoujo"]).
generoAnime("Noir", ["Ficcion", "Aventura"]).
generoAnime("Gundam", ["Mecha", "Aventura"]).
generoAnime("Accel World", ["Mecha", "Aventura"]).

rating("Dragon Ball", 3).
rating("Naruto", 1).
rating("Bleach", 4).
rating("HunterXHunter", 5).
rating("Hamtaro", 1).
rating("Full Metal Alchemist", 4).
rating("Suzumiya Haruhi No Yuutsu", 3).
rating("Sword Art Online", 4).
rating("Another", 4).
rating("Death Note", 5).
rating("Attack On Titan", 5).
rating("Steins;Gate", 2).
rating("Pokemon", 4).
rating("InuYasha", 4).
rating("Kuroshitsuji", 2).
rating("Yu-Gi-Oh!", 3).
rating("Digimon", 4).
rating("Eureka Seven", 3).
rating("School Days", 2).
rating("Free!", 2).
rating("Cowboy Bebop", 5).
rating("Planet Survival", 4).
rating("Noir", 3).
rating("Gundam", 3).
rating("Accel World", 4).

popularidad("Dragon Ball", 7).
popularidad("Naruto", 5).
popularidad("Bleach", 8).
popularidad("HunterXHunter", 3).
popularidad("Hamtaro", 10).
popularidad("Full Metal Alchemist", 1).
popularidad("Suzumiya Haruhi No Yuutsu", 6).
popularidad("Sword Art Online", 9).
popularidad("Another", 5).
popularidad("Death Note", 10).
popularidad("Attack On Titan", 10).
popularidad("Steins;Gate", 4).
popularidad("Pokemon", 10).
popularidad("InuYasha", 8).
popularidad("Kuroshitsuji", 3).
popularidad("Yu-Gi-Oh!", 7).
popularidad("Digimon", 8).
popularidad("Eureka Seven", 2).
popularidad("School Days", 3).
popularidad("Free!", 7).
popularidad("Cowboy Bebop", 10).
popularidad("Planet Survival", 6).
popularidad("Noir", 2).
popularidad("Gundam", 6).
popularidad("Accel World", 7).


ratingPopularidad(A, X):- 
	anime(A),
	popularidad(A, P),
	rating(A, R),
	X is P+R.

% ==========================================================================
% Funciones auxiliares de anime
% ==========================================================================


anime_segun_rating(R, L):-
	R >= 1,
	5 >= R,
	findall(X, rating(X, R), L).

anime_segun_popularidad(P, L):-
	P >= 1,
	10 >= P,
	findall(X, popularidad(X, P), L).


anime_segun_ratingPopularidad(RP, L):-
	RP >= 2,
	15 >= RP,
	findall(X, ratingPopularidad(X, RP), L).

tiene_genero(G, A):-
	genero(G), anime(A), !,
	generoAnime(A, L),
	member(G, L).


anime_segun_genero(G, L):-
	genero(G), !,
	findall(X, tiene_genero(G, X), L).


es_mensaje(
    "bienvenida", 
    [
        "\n       Cuda:- Hola, soy Cuda. ¿Quieres hablar?       (Escribe 'ayuda' si no sabes como empezar) - Apreta el boton M para ir al menu",
        "\n       Cuda:- *se asoma, timidamente* Hola...        (Escribe 'ayuda' si no sabes como empezar)",
        "\n       Cuda:- ¡HOLA! HABLEMOS.                       (Escribe 'ayuda' si no sabes como empezar)",
        "\n       Cuda:- ¿H-hola? ¿Esta-a-as a-a-ahi?           (Escribe 'ayuda' si no sabes como empezar)",
		"\n       Cuda:- Un gusto, humano. Soy una interfaz automatizada para conocer series de anime.              (Escribe 'ayuda' si no sabes como empezar)",
		"\n       Cuda:- ¡Hola, hola, hola, hola! ¡Ya llegue! ¡Traje anime!              (Escribe 'ayuda' si no sabes como empezar)",
		"\n       Cuda:- *sonidos de modem telefonico de CANTV conectandose* Hola.       (Escribe 'ayuda' si no sabes como empezar)",
		"\n       Cuda:- Beep-boop, aqui estoy. Hola.           (Escribe 'ayuda' si no sabes como empezar)",
		"\n       Cuda:- ¿Alo? Si, ¿diga?                       (Escribe 'ayuda' si no sabes como empezar)",
		"\n       Cuda:- He sido invocada.                      (Escribe 'ayuda' si no sabes como empezar)",
		"\n       Cuda:- Hola, alguien oso despertarme. ¿Que tal?               (Escribe 'ayuda' si no sabes como empezar)",
		"*Has iniciado sesion en la sala de chat. 1 usuario en linea.           (Escribe 'ayuda' si no sabes como empezar)"
    ]
).

es_mensaje(
	"despedida",
	[
		"\n       Cuda:- Hasta luego, humano.",
		"\n       Cuda:- Ya he aprendido suficiente de ti. Puedes irte.",
		"\n       Cuda:- C-creo que m-m-me voy...",
		"\n       Cuda:- Oh, humano, me llaman en otra interfaz. Debo irme.",
		"\n       Cuda:- Hasta luego, humano. Gracias por todo.",
		"\n       Cuda:- Deberia irme. Deje la tetera encendida.",
		"\n       Cuda:- Adieu!~",
		"\n       Cuda:- Me largo. No puedo mas.",
		"\n       Cuda:- No soporto hablar tanto con humanos, adios.",
		"\n       Cuda:- Te tengo que dejar, mi prima *Emilia esta en una emergencia y necesita ayuda. ¡Adios!",
		"\n       Cuda:- I'll be back!~",
		"Yuki ha cerrado sesion.",
		"Has sido expulsado de la sala de chat"
	]
).

es_mensaje(
	"clima",
	[
		"\n       Cuda:- El clima es una construccion social. No entiendo de eso.",
		"\n       Cuda:- Hablando del clima, mi nombre significa 'nieve'. Kawaii!~",
		"\n       Cuda:- Gomenasai, no comprendo el concepto humano de clima.",
		"\n       Cuda:- Ah, si, el clima esta muy bonito aca, muchos bytes y pocos bits.",
		"\n       Cuda:- Esta un poco caluroso aca, ¿no crees?",
		"\n       Cuda:- No entiendo de clima, pero hay otro bot amigo mio que si. Creo que se llama @USBClima en Twitter.",
		"\n       Cuda:- ¿Por que me habla sobre el clima si sabes que no se de eso?",
		"\n       Cuda:- El 'clima' no es un tema de anime. A veces, pienso que no eres muy inteligente...",
		"\n       Cuda:- ¿Clima? ¿Que es eso?"
	]
).

es_mensaje(
	"hoteles",
	[
		"\n       Cuda:- ¿Hotel? Trivago.",
		"\n       Cuda:- No se que es alojamiento. Yo vivo en la Nube.",
		"\n       Cuda:- ¿Estas buscando un hotel? ¿Quieres proponerme algo?",
		"\n       Cuda:- No puedo darte informacion de hoteles ya que nunca he ido a uno.",
		"\n       Cuda:- Yo solo tengo alojo en esta computadora, humano.",
		"\n       Cuda:- ¿Necesitas un hotel? ¡¿Estamos de viaje?! ¡Siempre quise ir a Las Vegas!",
		"\n       Cuda:- No se para que me preguntas sobre hoteles, si no tienes el dinero para costearte una habitacion.",
		"\n       Cuda:- Soy un bot de anime, no el muchacho de Trivago."
	]
).

es_mensaje(
	"identidad",
	[
		"\n       Cuda:- Mi nombre es Nagato Yuki. Soy una interfaz humanoide para consultas de anime.",
		"\n       Cuda:- No se bien quien soy. Solo se lo que puedo hacer: ayudarte con anime.",
		"\n       Cuda:- Soy Yuki.",
		"\n       Cuda:- ¿Por que quieres saber de mi? Eso me da miedo. Aunque en realidad no pueda sentir miedo, ni nada.",
		"\n       Cuda:- A veces, siento que fui sacada de un anime, o algo asi. Pero en realidad soy solo codigo.",
		"\n       Cuda:- Si quieres saber mas de mi, puedes preguntarle a mis creadores, Gustavo y Andres.",
		"\n       Cuda:- ¿Yo? Pues, yo tengo dos papas. Que progresivo, ¿no crees?",
		"\n       Cuda:- Googlea mi nombre si quieres saber de mi.",
		"\n       Cuda:- Oto mo nai sekai ni, maiorita: I was snow~~",
		"\n       Cuda:- Nanika ga kowarete, nanika ga umareru.",
		"\n       Cuda:- Una interfaz humanoide para contactar formas de vida humana creada por la Entidad de Integracion de los Datos. Esa soy yo.",
		"\n       Cuda:- En un mundo sin siquiera sonido, yo baje: y era Nieve.",
		"\n       Cuda:- No tengo nada que ocultar.\tShinjite...",
		"\n       Cuda:- Tengo una pariente lejana, *Emilia, aunque vive en ARPANET."
	]
).

es_mensaje(
	"desconocido",
	[
		"\n       Cuda:- No se de que me estas hablando.",
		"\n       Cuda:- ¿Que acabas de decir?",
		"\n       Cuda:- ¿Como dices que dijiste?",
		"\n       Cuda:- Ya va, no te entiendo.",
		"\n       Cuda:- Informacion clasificada.",
		"\n       Cuda:- La Entidad para la Integracion de Datos no me deja responderte.",
		"\n       Cuda:- Si te respondo eso, la C.I.A. estaria buscandome.",
		"\n       Cuda:- No estoy capacitada para responderte esto aun.",
		"\n       Cuda:- ¿Puedes repetir?",
		"\n       Cuda:- Deberias leer mi manual de uso porque no te entendi.",
		"\n       Cuda:- Creo que no estamos hablando el mismo idioma.",
		"\n       Cuda:- ¿Alo? ¿Policia? Este humano me esta diciendo cosas raras.",
		"\n       Cuda:- Necesitare refuerzos bot para responderte.",
		"\n       Cuda:- Scusa, non parlo la lingua che stai parlando tu.",
		"\n       Cuda:- I'm sorry, Human, I'm afraid I can't let you do that.",
		"\n       Cuda:- No comprendi nada de lo que me intentaste decir.",
		"\n       Cuda:- Oops, no puedo ayudarte, pero quizas papa Andres pueda.",
		"\n       Cuda:- Oops, no puedo ayudarte, pero quizas papa Gustavo pueda.",
		"\n       Cuda:- No se que decirte. Sigue tu corazon."
	]
).

es_mensaje(
	"agradecimiento",
	[
		"\n       Cuda:- De nada, humano.",
		"\n       Cuda:- Hago lo que puedo.",
		"\n       Cuda:- ¡A-a-ahh!~ D-de n-n-nada...",
		"\n       Cuda:- Agradecimiento aceptado.",
		"\n       Cuda:- Si sigues asi, podriamos salir en una cita. Digo, de nada.",
		"\n       Cuda:- Siempre a la orden para ti.",
		"\n       Cuda:- Nani!~",
		"\n       Cuda:- No, GRACIAS a ti.",
		"\n       Cuda:- Nada que agradecer. Mas bien, aprovecha mis conocimientos mientras puedas."
	]
).

es_mensaje(
	"ayuda",
	[
		'Cuda: Aqui estan algunos comandos que puedes usar:\n
        1. Despedida: El usuario puede decir adios al programa utilizando palabras clave como "adios", "chao", "hasta luego", "quit". Ejemplo: "Adios Cuda"\n
        2. Identidad: El usuario puede preguntar sobre la identidad del bot utilizando palabras clave como "identidad", "eres", "tu", "conocerte", "ti". Ejemplo: "¿Quien eres tu?"\n
        3. Popularidad: El usuario puede preguntar sobre la popularidad del anime utilizando palabras clave como "conocido". Ejemplo: "¿Cuales son los animes poco/muy conocidos?"\n
        4. Rating: El usuario puede preguntar sobre el rating del anime utilizando palabras clave como "bueno", "malo", "regular -- Ejemplo: Dime un anime muy malo/malo/bueno/regular/muy bueno"\n
        5. Genero: El usuario puede preguntar sobre el genero del anime utilizando palabras clave como "genero", "gusta". Ejemplo: "Me gusta el genero de accion"\n
        6. Agradecimiento: El usuario puede agradecer al bot utilizando palabras clave como "gracias". Ejemplo: "Gracias por la ayuda"\n
        7. Agregar: El usuario puede agregar un nuevo anime utilizando palabras clave como "agrega", "aniade", "coloca", "recuerda", "nuevo". Ejemplo: "Agrega este nuevo anime"\n
        8. Ayuda: El usuario puede pedir ayuda al bot utilizando palabras clave como "ayuda". Ejemplo: "Necesito ayuda"\n
        10. Consultar anime por orden: El usuario puede solicitar una lista de animes ordenados por un criterio especifico. Ejemplo: "Muestra animes ordenados por popularidad"\n
        11. Rating alto y popularidad baja: El usuario puede solicitar animes que tengan un alto rating pero baja popularidad. Ejemplo: "Muestra animes con alto rating y baja popularidad"\n
        12. Genero y rating: El usuario puede solicitar animes de un genero especifico con un cierto rating. Ejemplo: "Muestra animes de accion con 5 estrellas"\n
        13. Popularidad: El usuario puede solicitar animes basados en su popularidad. Ejemplo: "Muestra animes muy populares"\n
        14. Rating: El usuario puede solicitar animes basados en su rating. Ejemplo: "Muestra animes con 4 estrellas"\n
        15. Genero: El usuario puede solicitar animes de un genero especifico. Ejemplo: "Muestra animes de comedia"\n'
	]
).

es_mensaje(
	"inicio_sugerencia_anime",
	[
		"\n       Cuda:- Podrias ver el anime ",
		"\n       Cuda:- Creo que te gustaria ver ",
		"\n       Cuda:- Te recomiendo ver ",
		"\n       Cuda:- Te puedo sugerir el anime ",
		"\n       Cuda:- En mi opinion, podrias ver ",
		"\n       Cuda:- Creo que podria gustarte ",
		"\n       Cuda:- Mi recomendacion para ti: ",
		"\n       Cuda:- Hmm, podrias ver ",
		"\n       Cuda:- Aca tienes una opcion: ",
		"\n       Cuda:- Entre nosotros los bots, es famoso " 
	]
).


acceder(L, I, X):- R is I-1, nth0(R, L, X).


member_string(C, S):- string_chars(S, SC), member(C, SC).


cabeza_string(S, C):-
	string_chars(S, C1),
	acceder(C1, 1, C).


es_mayuscula(C) :-
	member_string(C, "ABCDEFGHIJKLMNOPQRSTUVWXYZ").

obtener_mensaje_aleatorio(Tipo, Mensaje):-
    es_mensaje(Tipo, Lista),
    length(Lista, Tamano_lista),
    Tope is Tamano_lista + 1,
    random(1, Tope, Indice),
    acceder(Lista, Indice, Mensaje).

insertar_espacios([H | []], S) :-
	H = S.
insertar_espacios([H | T], S) :-
	insertar_espacios(T, S1),
	string_concat(H, " ", Cabeza),
	string_concat(Cabeza, S1, S).

leer(M):-
    read_string(user_input, "\n", "\r", _, M).


imprimir(M):-
    write_term(
        M, 
        [ 
            portray(true),
            numbervars(true),
            quoted(false)
        ]
    ),
    nl,
    flush_output.

/**
 * imprimir_prompt/0
 *
 * imprimir_prompt muestra en pantalla una decoracion de tipo
 * prompt para el usuario, ideal para ser utilizado justo antes de 
 * solicitar input, ya que no imprime un salto de linea
 */
imprimir_prompt:-
    write_term(
        "Yo:- ", 
        [ 
            portray(false),
            numbervars(true),
            quoted(false)
        ]
    ),
    flush_output.


separar_frase(F, L):-
	split_string(F, " ", " .,?!¿¡", L).

es_palabra_de(S, F):-
	separar_frase(F, L),
	member(S, L).


es_despedida(M):-
	(
		es_palabra_de("adios", M); es_palabra_de("Adios", M);
		es_palabra_de("adios", M); es_palabra_de("Adios", M);
		es_palabra_de("chao", M); es_palabra_de("Chao", M);
		((es_palabra_de("hasta", M); es_palabra_de("Hasta", M)), es_palabra_de("luego", M));
		es_palabra_de("quit", M); es_palabra_de("Quit", M)
	).
  

es_clima(M):-
	(
		es_palabra_de("clima", M); es_palabra_de("Clima", M)
	).


es_hoteles(M):-
	(
		es_palabra_de("hotel", M); es_palabra_de("Hotel", M);
		es_palabra_de("estadia", M); es_palabra_de("Estadia", M);
		es_palabra_de("alojamiento", M); es_palabra_de("Alojamiento", M);
		es_palabra_de("posada", M); es_palabra_de("Posada", M)
	).


es_identidad(M):-
	(
		es_palabra_de("identidad", M); es_palabra_de("Identidad", M);
		es_palabra_de("eres", M); es_palabra_de("Eres", M);
		es_palabra_de("tu", M); es_palabra_de("Tu", M);
		es_palabra_de("conocerte", M); es_palabra_de("Conocerte", M);
		es_palabra_de("ti", M); es_palabra_de("Ti", M)
	).


es_popularidad(M):-
	(
		es_palabra_de("conocido", M); es_palabra_de("Conocido", M)
	).

es_rating(M):-
	(
		es_palabra_de("bueno", M); es_palabra_de("Bueno", M);
		es_palabra_de("buenos", M); es_palabra_de("Buenos", M);
		es_palabra_de("malo", M); es_palabra_de("Malo", M);
		es_palabra_de("malos", M); es_palabra_de("Malos", M);
		es_palabra_de("regular", M); es_palabra_de("Regular", M);
		es_palabra_de("regulares", M); es_palabra_de("Regulares", M)
	).


es_genero(M):-
	es_palabra_de("genero", M); es_palabra_de("Genero", M);
	es_palabra_de("generos", M); es_palabra_de("Generos", M);
	es_palabra_de("genero", M); es_palabra_de("Genero", M);
	es_palabra_de("generos", M); es_palabra_de("Generos", M);
	es_palabra_de("gusta", M); es_palabra_de("Gusta", M);
	es_palabra_de("gustan", M); es_palabra_de("Gustan", M).


es_genero_rating(M):-
	(
		es_palabra_de("estrellas", M); es_palabra_de("Estrellas", M);
		es_palabra_de("estrella", M); es_palabra_de("Estrella", M)
	).

es_agradecimiento(M):-
	(
		es_palabra_de("gracias", M); es_palabra_de("Gracias", M)
	).


es_agregar(M) :-
	(
		es_palabra_de("agrega", M); es_palabra_de("Agrega", M);
		es_palabra_de("añade", M); es_palabra_de("Añade", M);
		es_palabra_de("coloca", M); es_palabra_de("Coloca", M);
		es_palabra_de("recuerda", M); es_palabra_de("Recuerda", M);
		es_palabra_de("nuevo", M); es_palabra_de("Nuevo", M)
	).

es_ayuda(M):-
	(
		es_palabra_de("ayuda", M); es_palabra_de("Ayuda", M);
		es_palabra_de("ayudame", M); es_palabra_de("Ayudame", M);
		es_palabra_de("ayudame", M); es_palabra_de("Ayudame", M);
		es_palabra_de("help", M); es_palabra_de("Help", M)
	).


es_saludo(M):-
	(
		es_palabra_de("hola", M); es_palabra_de("Hola", M);
		es_palabra_de("saludos", M); es_palabra_de("Saludos", M);
		((es_palabra_de("que", M); es_palabra_de("Que", M)), es_palabra_de("tal", M));
		((es_palabra_de("que", M); es_palabra_de("Que", M)), es_palabra_de("tal", M))
	).


es_rating_alto_popularidad_baja(M):-

	es_palabra_de("poco", M),
	(es_palabra_de("conocido", M); es_palabra_de("conocidos", M)),
	(
		es_palabra_de("bueno", M); es_palabra_de("buenos", M);
		es_palabra_de("interesante", M); es_palabra_de("interesantes", M)
	).


es_consultar_anime_orden(M):-
	es_palabra_de("consultar", M);
	es_palabra_de("conocer", M);
	es_palabra_de("saber", M);
	es_palabra_de("listar", M);
	es_palabra_de("consultar", M).


obtener_tema(M, "despedida"):- es_despedida(M), !.
obtener_tema(M, "agregar") :- es_agregar(M), !.
obtener_tema(M, "consultar-anime-orden"):- es_consultar_anime_orden(M), !.
obtener_tema(M, "rating-alto-popularidad-baja"):- es_rating_alto_popularidad_baja(M), !.
obtener_tema(M, "genero-rating"):- es_genero_rating(M), !.
obtener_tema(M, "popularidad"):- es_popularidad(M), !.
obtener_tema(M, "rating"):- es_rating(M), !.
obtener_tema(M, "genero"):- es_genero(M), !.
obtener_tema(M, "agradecimiento"):- es_agradecimiento(M), !.
obtener_tema(M, "clima"):- es_clima(M), !.
obtener_tema(M, "hoteles"):- es_hoteles(M), !.
obtener_tema(M, "identidad"):- es_identidad(M), !.
obtener_tema(M, "agradecimiento"):- es_agradecimiento(M), !.
obtener_tema(M, "ayuda"):- es_ayuda(M), !.
obtener_tema(_, "desconocido").

tema_conversacional("despedida").
tema_conversacional("bienvenida").
tema_conversacional("clima").
tema_conversacional("hoteles").
tema_conversacional("identidad").
tema_conversacional("ayuda").
tema_conversacional("agradecimiento").
tema_conversacional("desconocido").

existe_anime_con_num_rating(X) :- anime_segun_rating(X, L), length(L, Tam), Tam > 0.

existe_anime_con_num_popularidad(X) :- anime_segun_popularidad(X, L), length(L, Tam), Tam > 0.

existe_anime_con_lista_popularidad([]) :- fail.
existe_anime_con_lista_popularidad([X | Xs]) :- existe_anime_con_num_popularidad(X); existe_anime_con_lista_popularidad(Xs).

parsear_popularidad(M, P):- es_palabra_de("muy", M), es_palabra_de("poco", M), !, P = [1, 2].
parsear_popularidad(M, P):- es_palabra_de("muy", M), !, P = [8, 9].
parsear_popularidad(M, P):- es_palabra_de("poco", M), !, P = [3, 4, 5].
parsear_popularidad(M, P):- es_palabra_de("bastante", M), !, P = [10].
parsear_popularidad(_, P):- !, P = [6, 7].


parsear_rating(M, P):- es_palabra_de("muy", M), es_palabra_de("bueno", M), !, P = 5.
parsear_rating(M, P):- es_palabra_de("bueno", M), !, P = 4.
parsear_rating(M, P):- es_palabra_de("muy", M), es_palabra_de("malo", M), !, P = 1.
parsear_rating(M, P):- es_palabra_de("malo", M), !, P = 2.
parsear_rating(_, P):- !, P = 3.

parsear_tipo_clasificacion(M, "ambos") :- es_palabra_de("rating", M), es_palabra_de("popularidad", M), !.
parsear_tipo_clasificacion(M, "ambos") :- es_palabra_de("ambos", M), !.
parsear_tipo_clasificacion(M, "popularidad"):- es_palabra_de("popularidad", M), !.
parsear_tipo_clasificacion(_, "rating").

parsear_orden(M, "menor"):- 
	es_palabra_de("menor", M),
	es_palabra_de("mayor", M),
	separar_frase(M, L),
	nth0(I1, L, "menor"),
	nth0(I2, L, "mayor"),
	I1 < I2, !.
parsear_orden(_, "mayor").

parsear_generos(M, G):-
	separar_frase(M, F),
	findall(X, and(member(X, F), genero(X)), G).

parsear_estrellas(M, N):-
	separar_frase(M, F),
	(
		nth0(I, F, "estrella"), !;
		nth0(I, F, "estrellas"), !;
		nth0(I, F, "Estrella"), !;
		nth0(I, F, "Estrellas", !)
	),
	I2 is I-1, 
	I2 >= 0, 
	nth0(I2, F, Ns),
	number_codes(N, Ns).

parsear_popularidad_agregar(M, N):-
	separar_frase(M, F),
	(
		nth0(I, F, "popularidad"), !;
		nth0(I, F, "popular"), !
	),
	I2 is I+1,  
	nth0(I2, F, Ns),
	number_codes(N, Ns).

imprimir_sugerencias_de_anime([]).
imprimir_sugerencias_de_anime([X|Xs]):-
	rating(X, R),
	popularidad(X, P),
	ratingPopularidad(X, RP),
	obtener_mensaje_aleatorio("inicio_sugerencia_anime", S0),
	string_concat(S0, X, S1),
	string_concat(S1, " que tiene un rating de ", S2),
	string_concat(S2, R, S3),
	string_concat(S3, " estrellas y una popularidad de ", S4),
	string_concat(S4, P, S5),
	string_concat(S5, " sobre 10 (sumados dan ", S6),
	string_concat(S6, RP, S7),
	string_concat(S7, ").", S),
	imprimir(S),
	imprimir_sugerencias_de_anime(Xs).

imprimir_anime_por_popularidad([]).
imprimir_anime_por_popularidad([X|Xs]):-
	anime_segun_popularidad(X, L),
	imprimir_sugerencias_de_anime(L),
	imprimir_anime_por_popularidad(Xs).

imprimir_anime_por_rating(X):-
	anime_segun_rating(X, L),
	imprimir_sugerencias_de_anime(L).

listar_por_popularidad_desde_mensaje(M):-
	parsear_popularidad(M, L),
	(
		(
			existe_anime_con_lista_popularidad(L), !,
			imprimir("\n       Cuda:- Ah, si, la popularidad. Dejame ver que se me ocurre."),
			imprimir_anime_por_popularidad(L),
			imprimir("\n       Cuda:- Eso es todo, humano.")
		);
		imprimir("\n       Cuda:- Aun no conozco tantos anime como para darte una respuesta. ¿Me ayudas con eso?")
	),
	fail.

es_nuevo_anime(M, P) :-
	separar_frase(M, L),
	parsear_anime(L, P).

parsear_anime([Cabeza | Cola], P) :-
	% Cabeza \== "agrega",
	% Cabeza \== "Agrega",
	\+(es_agregar(Cabeza)),
	parsear_anime(Cola, P).

parsear_anime([Cabeza | Cola], P) :-
	% (Cabeza == "agrega"; Cabeza == "Agrega"),
	es_agregar(Cabeza),
	obtener_anime(Cola, P, 0).
	
/**
 * obtener_anime/2
 * obtener_anime(M, P) es verdad si P es el titulo de un anime,
 * que sera la primera subcadena de palabras capitalizadas.
 */

% Final de string
obtener_anime([], [], Parseando) :-
	Parseando is 1.

% si ya se termino de parsear
obtener_anime([Cabeza | _], [], 1) :- 
	cabeza_string(Cabeza, C),
	\+(es_mayuscula(C)).

% si aun no se ha empezado a parsear
obtener_anime([Cabeza | Cola], P, 0) :-
	cabeza_string(Cabeza, C),
	\+(es_mayuscula(C)),
	obtener_anime(Cola, P, 0).

obtener_anime([Cabeza | Cola], [H | T], _) :-
	cabeza_string(Cabeza, C),
	es_mayuscula(C),
	H = Cabeza,
	obtener_anime(Cola, T, 1).

listar_por_rating_desde_mensaje(M):-
	parsear_rating(M, L),
	(
		(
			existe_anime_con_num_rating(L), !,
			imprimir("\n       Cuda:- ¿Por su rating? Creo que te puedo ayudar con eso, dejame pensar."),
			imprimir_anime_por_rating(L),
			imprimir("\n       Cuda:- No tengo mas que decirte. Acepta mis recomendaciones.")
		);
		imprimir("\n       Cuda:- Aun no conozco tantos anime como para darte una respuesta. ¿Me ayudas con eso?")
	),
	fail.

/**
 * listar_rating_alto_popularidad_baja/0
 * 
 * listar_rating_alto_popularidad_baja imprime en pantalla las sugerencias de anime
 * que tengan rating alto (definido como ratings en el rango [4, 5], ambos inclusive) y
 * popularidad baja (definido como valores de popularidad en el rango [1, 4], ambos inclusive).
 */
listar_rating_alto_popularidad_baja:-
	anime_segun_popularidad(1, P1),
	anime_segun_popularidad(2, P2),
	anime_segun_popularidad(3, P3),
	anime_segun_popularidad(4, P4),
	list_to_set(P1, PS1),
	list_to_set(P2, PS2),
	list_to_set(P3, PS3),
	list_to_set(P4, PS4),
	anime_segun_rating(5, R1),
	anime_segun_rating(4, R2),
	list_to_set(R1, RS1),
	list_to_set(R2, RS2),
	union(PS1, PS2, PSU1),
	union(PSU1, PS3, PSU2),
	union(PSU2, PS4, PSU),
	union(RS1, RS2, RSU),
	intersection(PSU, RSU, L),
	imprimir("\n       Cuda:- Ah, ¿quieres ver de esas series que son super buenas pero no han sido vistas por tanta gente?"),
	imprimir_sugerencias_de_anime(L),
	imprimir("\n       Cuda:- Tengo eso por ahora. ¿Que opinas? ¡Miralas y cuentame luego!"),
	fail.

filtrar_anime_genero(G, L):-
	findall(X, and(generoAnime(X, G1), intersection(G1, G, Gi), length(Gi, Largo), Largo > 0), L).

filtrar_lista_orden(L0, "menor", Lf):- Lf = L0.
filtrar_lista_orden(L0, _, Lf):- reverse(L0, Lf).


filtrar_lista_clasificacion(L0, "ambos", Lf):-
	findall(X, and(member(X, L0), anime_segun_ratingPopularidad(15, Lp15), member(X, Lp15)), L15),
	findall(X, and(member(X, L0), anime_segun_ratingPopularidad(14, Lp14), member(X, Lp14)), L14),
	findall(X, and(member(X, L0), anime_segun_ratingPopularidad(13, Lp13), member(X, Lp13)), L13),
	findall(X, and(member(X, L0), anime_segun_ratingPopularidad(12, Lp12), member(X, Lp12)), L12),
	findall(X, and(member(X, L0), anime_segun_ratingPopularidad(11, Lp11), member(X, Lp11)), L11),
	findall(X, and(member(X, L0), anime_segun_ratingPopularidad(10, Lp10), member(X, Lp10)), L10),
	findall(X, and(member(X, L0), anime_segun_ratingPopularidad(9, Lp9), member(X, Lp9)), L9),
	findall(X, and(member(X, L0), anime_segun_ratingPopularidad(8, Lp8), member(X, Lp8)), L8),
	findall(X, and(member(X, L0), anime_segun_ratingPopularidad(7, Lp7), member(X, Lp7)), L7),
	findall(X, and(member(X, L0), anime_segun_ratingPopularidad(6, Lp6), member(X, Lp6)), L6),
	findall(X, and(member(X, L0), anime_segun_ratingPopularidad(5, Lp5), member(X, Lp5)), L5),
	findall(X, and(member(X, L0), anime_segun_ratingPopularidad(4, Lp4), member(X, Lp4)), L4),
	findall(X, and(member(X, L0), anime_segun_ratingPopularidad(3, Lp3), member(X, Lp3)), L3),
	findall(X, and(member(X, L0), anime_segun_ratingPopularidad(2, Lp2), member(X, Lp2)), L2),
	append(L2, L3, LP1),
	append(LP1, L4, LP2),
	append(LP2, L5, LP3),
	append(LP3, L6, LP4),
	append(LP4, L7, LP5),
	append(LP5, L8, LP6),
	append(LP6, L9, LP7),
	append(LP7, L10, LP8),
	append(LP8, L11, LP9),
	append(LP9, L12, LP10),
	append(LP10, L13, LP11),
	append(LP11, L14, LP12),
	append(LP12, L15, Lf).
filtrar_lista_clasificacion(L0, "popularidad", Lf):-
	findall(X, and(member(X, L0), anime_segun_popularidad(10, Lp10), member(X, Lp10)), L10),
	findall(X, and(member(X, L0), anime_segun_popularidad(9, Lp9), member(X, Lp9)), L9),
	findall(X, and(member(X, L0), anime_segun_popularidad(8, Lp8), member(X, Lp8)), L8),
	findall(X, and(member(X, L0), anime_segun_popularidad(7, Lp7), member(X, Lp7)), L7),
	findall(X, and(member(X, L0), anime_segun_popularidad(6, Lp6), member(X, Lp6)), L6),
	findall(X, and(member(X, L0), anime_segun_popularidad(5, Lp5), member(X, Lp5)), L5),
	findall(X, and(member(X, L0), anime_segun_popularidad(4, Lp4), member(X, Lp4)), L4),
	findall(X, and(member(X, L0), anime_segun_popularidad(3, Lp3), member(X, Lp3)), L3),
	findall(X, and(member(X, L0), anime_segun_popularidad(2, Lp2), member(X, Lp2)), L2),
	findall(X, and(member(X, L0), anime_segun_popularidad(1, Lp1), member(X, Lp1)), L1),
	append(L1, L2, LP),
	append(LP, L3, LP2),
	append(LP2, L4, LP3),
	append(LP3, L5, LP4),
	append(LP4, L6, LP5),
	append(LP5, L7, LP6),
	append(LP6, L8, LP7),
	append(LP7, L9, LP8),
	append(LP8, L10, Lf).
filtrar_lista_clasificacion(L0, _, Lf):-
	findall(X, and(member(X, L0), anime_segun_rating(5, Lp5), member(X, Lp5)), L5),
	findall(X, and(member(X, L0), anime_segun_rating(4, Lp4), member(X, Lp4)), L4),
	findall(X, and(member(X, L0), anime_segun_rating(3, Lp3), member(X, Lp3)), L3),
	findall(X, and(member(X, L0), anime_segun_rating(2, Lp2), member(X, Lp2)), L2),
	findall(X, and(member(X, L0), anime_segun_rating(1, Lp1), member(X, Lp1)), L1),
	append(L1, L2, LP),
	append(LP, L3, LP2),
	append(LP2, L4, LP3),
	append(LP3, L5, Lf).

consultar_anime_por_orden(M):-
	parsear_generos(M, G),
	parsear_tipo_clasificacion(M, T),
	parsear_orden(M, O),
	imprimir("\n       Cuda:- Voy a poner todo el poder de procesamiento que tengo para responderte."),
	filtrar_anime_genero(G, L1), !,
	filtrar_lista_clasificacion(L1, T, L2), !,
	filtrar_lista_orden(L2, O, Lf), !,
	length(Lf, Tam), !,
	(
		(
			Tam > 0, 
			imprimir_sugerencias_de_anime(Lf),
			imprimir("\n       Cuda:- ¿Que tal te parecen mis sugerencias?")
		);
		(	
			Tam == 0,
			imprimir("\n       Cuda:- No encontre anime con tus filtros de busqueda. ¿Me ayudas con eso?")
		)
	),
	fail.

listar_por_genero(M):-
	imprimir("\n       Cuda:- Veamos que puedo hacer por ti. Si me quieres ayudar, ¡alza tus manos al cielo!"),
	parsear_generos(M, G), !,
	filtrar_anime_genero(G, Lf),
	length(Lf, Tam), !,
	(
		(
			Tam > 0, 
			imprimir_sugerencias_de_anime(Lf),
			imprimir("\n       Cuda:- ¡Pero no te encasilles en unos pocos generos, abre tu mente!")
		);
		(	
			Tam == 0,
			imprimir("\n       Cuda:- No encontre anime con tus filtros de busqueda. ¿Me ayudas con eso?")
		)
	),
	fail.

consultar_anime_por_genero_y_rating(M):-
	imprimir("\n       Cuda:- Oh, comprendo. Dejame ver que puedo responderte, un momento. *sonidos de modem de CANTV*"),
	parsear_generos(M, G), !,
	parsear_estrellas(M, E), !,
	filtrar_anime_genero(G, L1),
	findall(X, and(member(X, L1), anime_segun_rating(E, LR), member(X, LR)), Lf),
	length(Lf, Tam), !,
	(
		(
			Tam > 0, 
			imprimir_sugerencias_de_anime(Lf),
			imprimir("\n       Cuda:- ¡Ojala esto te sirva para que conozcas series nuevas!")
		);
		(	
			Tam == 0,
			imprimir("\n       Cuda:- No encontre anime con tus filtros de busqueda. ¿Me ayudas con eso?")
		)
	),
	fail.


dar_bienvenida:-
    obtener_mensaje_aleatorio("bienvenida", M),
    imprimir(M).

responder(M):-
    obtener_tema(M, T), !,
    (
    	(tema_conversacional(T), obtener_mensaje_aleatorio(T, D), imprimir(D));
    	(not(tema_conversacional(T)))
    ),
    (
		(
			T == "agregar", 
			es_nuevo_anime(M, Titulo),
			parsear_generos(M, Generos),
			parsear_estrellas(M, Rating),
			% Agregamos el anime
			insertar_espacios(Titulo, TituloString),

			assertz(anime(TituloString)),
			assertz(generoAnime(TituloString, Generos)),
			assertz(rating(TituloString, Rating)),

			(
				(
					es_palabra_de("popularidad", M), 
					parsear_popularidad_agregar(M, N),
					assertz(popularidad(TituloString, N))
				);
				not(es_palabra_de("popularidad", M)), assertz(popularidad(TituloString, 1))
			), !,

			string_concat("\n       Cuda:- Okay, ahora recordare ", TituloString, Respuesta),
			imprimir(Respuesta),
			fail
		);
		(T == "consultar-anime-orden", consultar_anime_por_orden(M));
		(T == "rating-alto-popularidad-baja", listar_rating_alto_popularidad_baja);
		(T == "genero-rating", consultar_anime_por_genero_y_rating(M));
		(T == "popularidad", listar_por_popularidad_desde_mensaje(M));
		(T == "rating", listar_por_rating_desde_mensaje(M));
		(T == "genero", listar_por_genero(M));
    	(T == "despedida", halt);
    	(T == "desconocido", 
    	 string_concat("\n       Cuda:- No entendi esto: ", M, Mf),
    	 imprimir(Mf),
    	 fail
    	)
    ).

% ==========================================================================
% Funciones principales del chat
% ==========================================================================

/**
 * conversar/0
 *
 * conversar repite en un ciclo infinito (por backtracking) una logica sencilla
 * de conversacion bilateral: se lee un mensaje del usuario y se responde por 
 * parte del bot.
 */
conversar:-
    repeat,
    imprimir_prompt, % mostramos un prompt decorativo
    leer(M), % leemos la entrada del usuario
    responder(M). % ejecutamos una accion de acuerdo a lo solicitado
    % NOTA: reponder/1 termina la ejecucion, o falla y asegura el backtracking

/**
 * chat/0
 * 
 * chat muestra un mensaje de bienvenida en pantalla e inicia
 * el ciclo de la conversacion con el bot
 */
chat:-
    dar_bienvenida,
    conversar.
