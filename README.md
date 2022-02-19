# contact-book
Write a shell script to manage your personal contact book which will keep record of your contact
details. Follow the below instructions to write the shell script.
- Input: contacts.csv is the input file with fields fname (FirstName), lname (LastName),
mobile (Mobile Number), Office (CompanyName).
- This contacts.csv will be updated after every insert, delete and edit. No command other
than display all, or search and display should print anything on the terminal.
- No command other than display all, or search and display should print anything on the
terminal.
- The output for ‘search and display’ and ‘display all’ should be coma separated words in
the same sequence as the format of the csv.
- The commands should be as follows
• Insert Contact
• Edit Contact
• Display all Contacts
• Search and Display
• Delete Contact
The system should run based on flag-based command line arguments.
A flag –C would be used to first specify the command (which would be one of ‘insert’, ‘edit’,
’display’, ‘search’, ‘delete’) The flags for each command are as follows:
• Insert 
o -f for entering first name
o -l for entering last name
o -n for entering contact number
o -o for entering company name
• Edit contact 
o -k give the first name of the contact to be edited (assume no 2 contacts
have same first name)
o -f for entering updated first name
o -l for entering updated last name
o -n for entering updated contact number
o -o for entering updated company name
• Display all contacts 
o -a to sort in ascending order of first name
o -d to sort in descending order of first name
• Search and display 
o -c for entering the column on which it is to be searched (has to be one of
first name, last name or number)
o -v for the search value of that column
• Delete contact 
o -c for entering the column on which it is to be searched (has to be one of
first name, last name or number)
o -v for the search value of that column of the record to be deleted
