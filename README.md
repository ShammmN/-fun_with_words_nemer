# -fun_with_words_nemer
Which commands caused errors, and why?
The command for question 3 caused an error that said: Error at line 1/26: ORA-42399: cannot perform a DML operation on a read-only view. 
This command caused an error becuase you can not manipulate data when it is specified that you are restricted to only being able to read the view as in can only see its contents not change or modify it. 

Why are DML operations restricted in some views?
On some views there are restriction put in place such as a primary key on the underlying table which would stop a DML operation from running if these restructions are violated. 

How is a materialized view different from a regular view?
Materialized views physically replicates and stores data retreived from the view query. While a regular view stores the data virtually. 
