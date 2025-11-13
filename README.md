# -fun_with_words_nemer
Which commands caused errors, and why?
The command for question 3: UPDATE WORD_REL SET SYN_COL = 'blithe' WHERE word = 'insouciant' WITH READ ONLY; 
This command caused an error becuase you cant manipulate data when it is specified that you are restricted to only being able to read the view. 

Why are DML operations restricted in some views?


How is a materialized view different from a regular view?
