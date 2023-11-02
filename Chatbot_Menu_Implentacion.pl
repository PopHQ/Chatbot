:- use_module(library(pce)).

main :- 
    new(D, dialog('Chatbot')),
    send(D, size, size(600, 700)),
    send(D, open),
    starting_graphics(D).


 % Renders the initial category picking menu  
starting_graphics(D) :-
    send(D, append, new(EndButton, button('End Game', message(D, destroy)))),
    send(EndButton, center, point(310, 650)),

    send(D, append, new(TitleText, text('Welcome To our Chatbot', center))),
    send(TitleText, center, point(300, 80)),
    send(TitleText, font, font(helvetica, normal, 16)),

    send(D, append, new(ScoreText, text(''))),
    send(ScoreText, position, point(285, 20)),
    send(ScoreText, font, font(helvetica, normal, 13)),
    
    send(D, append, new(CategoryText, text('Please Choose a Option', center))),
    send(CategoryText, center, point(300, 120)),
    send(CategoryText, font, font(helvetica, normal, 12)),

    send(D, append, new(Chatbot, button('Chatbot'))),
    format_chatbot_button(Chatbot, D),

    send(D, append, new(Anime, button('Anime'))),
    format_anime_button(Anime),

    send(D, append, new(Manga, button('Manga'))),
    format_manga_button(Manga),

    send(Chatbot, message, message(@prolog, format_chatbot_button, Chatbot, D)).
    send(Anime, message, message(@prolog, pop_clicked, D, TitleText, CategoryText, ScoreText, Chatbot, Anime, Manga, 0, 0)),
    send(Manga, message, message(@prolog, geo_clicked, D, TitleText, CategoryText, ScoreText, Chatbot, Anime, Manga, 0, 0)).



format_chatbot_button(Chatbot, D) :-
    send(Chatbot, position, point(110, 170)),
    send(Chatbot, size, size(400, 100)),
    send(Chatbot, message, message(@prolog, chatbot_dialog, D)). % Open the chatbot dialog when the button is clicked


format_anime_button(Anime) :-
    send(Anime, position, point(110, 290)),
    send(Anime, size, size(400,100)).

format_manga_button(Manga) :-
    send(Manga, position, point(110, 410)),
    send(Manga, size, size(400,100)).



% Handles the game button.
games_clicked(D, TitleText, CategoryText, ScoreText, Chatbot, Anime, Manga, QuestionNumber, CorrectAnswers) :-
    send(D, append, new(MainMenuButton, button('Main Menu', message(@prolog, mainMenu, D)))),
    send(MainMenuButton, center, point(310, 600)),

    video_game_questions(Questions),
    nth0(QuestionNumber, Questions, Question),
    Question = (QuestionText, Choices, CorrectIndex),

    send(TitleText, string, QuestionText),
    send(CategoryText, string, 'Choose the Correct Answer.'),

    Choices = [Choice1, Choice2, Choice3],

    send(Chatbot, label, Choice1),
    send(Chatbot, message, message(@prolog, check_answer_games, D, TitleText, CategoryText, ScoreText, Chatbot, Anime, Manga, CorrectIndex, 1, QuestionNumber, CorrectAnswers)),
    format_chatbot_button(Chatbot, D),

    send(Anime, label, Choice2),
    send(Anime, message, message(@prolog, check_answer_games, D, TitleText, CategoryText, ScoreText, Chatbot, Anime, Manga, CorrectIndex, 2, QuestionNumber, CorrectAnswers)),
    format_anime_button(Anime),

    send(Manga, label, Choice3),
    send(Manga, message, message(@prolog, check_answer_games, D, TitleText, CategoryText, ScoreText, Chatbot, Anime, Manga, CorrectIndex, 3, QuestionNumber, CorrectAnswers)),
    format_manga_button(Manga).



% Handles the popculture button
pop_clicked(D, TitleText, CategoryText, ScoreText, Chatbot, Anime, Manga, QuestionNumber, CorrectAnswers) :-
    send(D, append, new(MainMenuButton, button('Main Menu', message(@prolog, mainMenu, D)))),
    send(MainMenuButton, center, point(310, 600)),
    
    pop_culture_questions(Questions),
    nth0(QuestionNumber, Questions, Question),
    Question = (QuestionText, Choices, CorrectIndex),

    send(TitleText, string, QuestionText),
    send(CategoryText, string, 'Choose the Correct Answer.'),

    Choices = [Choice1, Choice2, Choice3],

    send(Chatbot, label, Choice1),
    send(Chatbot, message, message(@prolog, check_answer_pop, D, TitleText, CategoryText, ScoreText, Chatbot, Anime, Manga, CorrectIndex, 1, QuestionNumber, CorrectAnswers)),
    format_chatbot_button(Chatbot, D),

    send(Anime, label, Choice2),
    send(Anime, message, message(@prolog, check_answer_pop, D, TitleText, CategoryText, ScoreText, Chatbot, Anime, Manga, CorrectIndex, 2, QuestionNumber, CorrectAnswers)),
    format_anime_button(Anime),

    send(Manga, label, Choice3),
    send(Manga, message, message(@prolog, check_answer_pop, D, TitleText, CategoryText, ScoreText, Chatbot, Anime, Manga, CorrectIndex, 3, QuestionNumber, CorrectAnswers)),
    format_manga_button(Manga).


% Handles the geography button
chat_clicked(D, TitleText, CategoryText, ScoreText, Chatbot, Anime, Manga, QuestionNumber, CorrectAnswers) :-
    send(D, append, new(MainMenuButton, button('Main Menu', message(@prolog, mainMenu, D)))),
    send(MainMenuButton, center, point(310, 600)),


    geography_questions(Questions),
    nth0(QuestionNumber, Questions, Question),
    Question = (QuestionText, Choices, CorrectIndex),

    send(TitleText, string, QuestionText),
    send(CategoryText, string, 'Choose the Correct Answer.'),

    Choices = [Choice1, Choice2, Choice3],

    send(Chatbot, label, Choice1),
    send(Chatbot, message, message(@prolog, check_answer_geo, D, TitleText, CategoryText, ScoreText, Chatbot, Anime, Manga, CorrectIndex, 1, QuestionNumber, CorrectAnswers)),
    format_chatbot_button(Chatbot, D),

    send(Anime, label, Choice2),
    send(Anime, message, message(@prolog, check_answer_geo, D, TitleText, CategoryText, ScoreText, Chatbot, Anime, Manga, CorrectIndex, 2, QuestionNumber, CorrectAnswers)),
    format_anime_button(Anime),

    send(Manga, label, Choice3),
    send(Manga, message, message(@prolog, check_answer_geo, D, TitleText, CategoryText, ScoreText, Chatbot, Anime, Manga, CorrectIndex, 3, QuestionNumber, CorrectAnswers)),
    format_manga_button(Manga).


% All of these are to check the answers of the game and keep track of which question is there
check_answer_games(D, TitleText, CategoryText, ScoreText, Chatbot, Anime, Manga, CorrectIndex, ChosenIndex, QuestionNumber, CorrectAnswers) :-
    (   ChosenIndex == CorrectIndex 
    -> NewCorrectAnswers is CorrectAnswers + 1,
       number_string(NewCorrectAnswers, S),
       concat(S, '/20', ScoreString),
       send(ScoreText, string, ScoreString)
    ;  NewCorrectAnswers is CorrectAnswers
    ),
    NewQuestionNumber is QuestionNumber + 1,
    (NewQuestionNumber >= 20 
    -> scoreScreen(D, TitleText, CategoryText, ScoreText, Chatbot, Anime, Manga)
    ; games_clicked(D, TitleText, CategoryText, ScoreText, Chatbot, Anime, Manga, NewQuestionNumber, NewCorrectAnswers)
    ).


check_answer_pop(D, TitleText, CategoryText, ScoreText, Chatbot, Anime, Manga, CorrectIndex, ChosenIndex, QuestionNumber, CorrectAnswers) :-
    (   ChosenIndex == CorrectIndex 
    -> NewCorrectAnswers is CorrectAnswers + 1,
       number_string(NewCorrectAnswers, S),
       concat(S, '/20', ScoreString),
       send(ScoreText, string, ScoreString)
    ;  NewCorrectAnswers is CorrectAnswers
    ),

    NewQuestionNumber is QuestionNumber + 1,
    (NewQuestionNumber >= 20 
    -> scoreScreen(D, TitleText, CategoryText, ScoreText, Chatbot, Anime, Manga)
    ; pop_clicked(D, TitleText, CategoryText, ScoreText, Chatbot, Anime, Manga, NewQuestionNumber, NewCorrectAnswers)
    ).


check_answer_geo(D, TitleText, CategoryText, ScoreText, Chatbot, Anime, Manga, CorrectIndex, ChosenIndex, QuestionNumber, CorrectAnswers) :-
    (   ChosenIndex == CorrectIndex 
    -> NewCorrectAnswers is CorrectAnswers + 1,
       number_string(NewCorrectAnswers, S),
       concat(S, '/20', ScoreString),
       send(ScoreText, string, ScoreString)
    ;  NewCorrectAnswers is CorrectAnswers
    ),

    NewQuestionNumber is QuestionNumber + 1,
    (NewQuestionNumber >= 20 
    -> scoreScreen(D, TitleText, CategoryText, ScoreText, Chatbot, Anime, Manga)
    ; geo_clicked(D, TitleText, CategoryText, ScoreText, Chatbot, Anime, Manga, NewQuestionNumber, NewCorrectAnswers)
    ).

% When we are finished a section, we go to this screen that handles the score screen behaviour
scoreScreen(D, TitleText, CategoryText, ScoreText, Chatbot, Anime, Manga) :-
    send(Chatbot, displayed, @off),
    send(Anime, displayed, @off),
    send(Manga, displayed, @off),
    send(TitleText, string, "You have completed the trivia!"),
    send(CategoryText, string, "You Scored: "),
    format_manga_button(Manga),
    send(ScoreText, center, point(255, 180)),
    send(ScoreText, font, font(helvetica, normal, 50)),
    send(Manga, message, message(@prolog, mainMenu, D)).

% Predicate to process user input and display chat messages
process_user_input(ChatText, UserInput) :-
    get(UserInput, selection, UserMessage),
    atom_string(UserMessage, UserMessageStr),
    
   
    send(ChatText, append, UserMessageStr),
    send(ChatText, append, '\n').
    




% Predicate for the chatbot dialog
chatbot_dialog(D) :-
    new(ChatbotDialog, dialog('Chatbot')),
    send(ChatbotDialog, size, size(600, 400)),
    send(ChatbotDialog, open),
    
    % Create a text field for chat messages
    send(ChatbotDialog, append, new(ChatDisplay, text('Chat with the Chatbot:', center))),
    send(ChatDisplay, font, font(helvetica, normal, 16)),

    % Create a text field for chat messages
    send(ChatbotDialog, append, new(ChatText, text('', center))),
    send(ChatText, font, font(helvetica, normal, 12)),
    
    % Create an input field for the user to type messages
    send(ChatbotDialog, append, new(UserInput, text_item(input, ''))),
    send(UserInput, message, message(@prolog, process_user_input, ChatText, UserInput)),
    
    send(UserInput, below, ChatText),
    send(UserInput, center_x, ChatbotDialog?center_x),
    send(UserInput, width, 400),
    
    send(UserInput, keyboard_focus, true).


mainMenu(D) :-
    send(D, destroy),
    main.


video_game_questions([
    ('What was the first commercially successful video game?', ['Pong', 'Space Invaders', 'Tetris'], 1),

]).

pop_culture_questions([
	('What TV series features a character named Walter White who\nstarts making and selling methamphetamine?', ['The Walking Dead', 'Breaking Bad', 'Lost'], 2),
	
]).

geography_questions([
    ('What is the largest country in South America?', ['Brazil', 'Argentina', 'Peru'], 1),

]).
