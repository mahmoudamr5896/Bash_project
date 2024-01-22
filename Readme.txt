______________________________  Project Bash   ______________________________________________________________
Strucutre Project Database Engine in Bash :

>> Create Database :
#? five function to cheek  constrain name of Database user enter it And create Database
1- check if empty string entered
2- rejecting spaces in db name
3- disallowing special characters in db names
4- check if empty string entered
5- check if input name exist otherwise create db

<< finnaly create Database

>> Connect Database :
1- check if empty string entered
2- check if database doesnot exist

List Use Table : 
>> Show table  :
Take Table Name from User  And cheek it :
1- 	if read will  continue  
2- check for empty string
3- check for existing table name

>> Create table :
take Table Name From User :
1- cheek the table name 
  -	back to read again
  - disallowing special characters in  names --  \ must be handled
  - check for empty string
  - rejecting spaces in table name
  - check for existing table name
2- cheek columns name
  - if it false exit loop
  - check for empty string 
  - check if zero entered 
  - cheek nigative number
  - cheek float number
  - check if input is not a number
3- store columns names and columns datatypes in tow array  
  
4- columns names and columns datatypes 
 - back cheek primary key 
 - Not Accept spcial character
 - checking for empty string
 - checking for repeated column name
 - rejecting spaces in column name
 - rejecting colons in column name

5- Appending name column(P.k) it the array of col name
   - Taking the datatype of the pk column
   - Appending Data_Type of P.K to the array

6- Taking the names and datatypes of the rest of the columns
    Excluding the pk column that was already entered

7- Creating file representing the table

8- Store  columns_Name And columns_type in file Meta
 
>> Delete Table :

>> Insert into Table :
 -- Take Table Name From user :
   - cheek Table_Name 
                - check for empty string
                - Check for existing table name
-- Create Array that has the values of the insert statement

-- Load meta data about table 
-- Cheek data User Entered it 
            - check for empty string
            - Rejecting colons in column name
            - check data type of pk
            - Check uniqueness of Pk
            - Appand value P.K to Array
            - Take from user All data in columns And cheek it

--  Store Data in file take from Array


>> Update Table :


>> Select From table:


>> Delete Row:



>> Delete Database :
1- check if empty string entered
2- check if database doesnot exist

>> Display Database :




