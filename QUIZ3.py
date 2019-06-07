PART I

1. Create a tablespace with name 'quiz_noche' and two datafiles. Each datafile of 10Mb.

2. Create a profile with idle time of 5 minutes, the name of the profile should be 'estudiante'

3. Create an user named "user1" with password "user1". 
	- The user should be able to connect
	- The user should has the profile "estudiante"
	- The user should be associated to the tablespace "quiz_noche"
	- The user should be able to create tables WITHOUT USING THE DBA ROLE. 

	4. Create an user named "user2" with password "user2"
	- The user should be able to connect
	- The user should has the profile "estudiante"
	- The user should be associated to the tablespace "quiz_noche"
	- The user shouldn't be able to create tables.


PART II

1. With the user1 create the next table (DON'T CHANGE THE NAME OF THE TABLE NOR COLUMNS: 

2. Import this data (The format of the date is "YYYY-MM-DD HH24:MI:SS"): https://gist.github.com/amartinezg/6c2c27ae630102dbfb499ed22b338dd8

3. Give permission to view table "attacks" of the user2 (Do selects)


PART III

Queries: 

1. Count the urls which have been attacked and have the protocol 'http'

2. List the records where the URL attacked matches with google (it does not matter if it is google.co.jp, google.es, google.pt, etc) order by number of attacks descendant

3. List the ip addresses and the time of the last attack if the attack has been produced this year (2018) (Hint: https://stackoverflow.com/a/30071091)

4. Show the first IP Adress which has been registered with the maximum number of attacks 

5. Show the ip address and the number of attacks if instagram has been attack using http protocol
