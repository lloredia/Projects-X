To solve this quickly please look at the method stated at the bottom of the page.

Firstly we download the zip from htb and unzip this to obtain the file we will be reversing ‘snake.py’. I will be completing this challenge using kali linux x64 but it should be very similar on any OS with python.

While we know the .py extension indicates this is python we run the file command on it to discover more details on the file structure.
Command: file snake.py
Returns: snake.py: Python script, ASCII text executable

Now we know that this script is in plain text, therefore we can view it in whatever text editor we’d like.

unnamed (23)

unnamed (22)

Before we start analyzing this script let’s first run the executable and see what it does.
Command: python snake.py
Returns:

unnamed (24)

Alright so we see first that we get assigned a number and then it prompts us for a username. Once we enter a username we will receive ‘Wrong username try harder’. It can be assumed that this is only the response when we enter the wrong username. Therefore, let’s try to find the proper username.

In the script we can see at line 42 there is an if statement right after it prompts the user for a username.
If user_input == slither
Now we know that the username is likely whatever the variable slither is equal to. Line 38 states
slither = aa + db +nn + ef + rr + gh + lr + ty

In the script we see what these variables are in hex which we can easily convert to ascii
aa = ‘\x61’ = a
db = ‘\x6e’ = n
nn = ‘\x61’ = a
ef = ‘\x63’ = c
rr = ‘\x6f’ = o
gh = ‘\x6e’ = n
lr = ‘\x64’ = d
ty = ‘\x61’ = a

So we get the username ‘anaconda’ let’s use this during execution of the script and see what we get.

unnamed (25)

Now we are getting prompted for a password. Let’s continue reversing the script.

unnamed (26)

So we see that passes is being compared to ‘str(chr(char))’. Let’s figure out what exactly this is.
Functions:
str() – returns a string
chr() – returns a character and takes in a parameter of a unicode digit

Variable:
char – one element in the array chars
chars – initialized as an empty array

Now let’s find what is placed into the array chars.

unnamed (27)

unnamed (28)

keys_encrypt = lock ^ key
So we need to figure out what the variables lock and key are.

Lock:
lock_pick = random.randint(0, 0x3e8) #this is printed to us on execution
lock = lock_pick * 2
lock = lock + 10
lock = lock / 2
lock = lock – lock_pick

Key(elements of the array keys):
keys = [0x70, 0x61, 0x73, 0x73, 0x77, 0x6f, 0x72, 0x64, 0x21, 0x21]

So the first loop is going to add a character to chars using the following:
keys_encrypt = (((lock_pick * 2) + 10) / 2) – lock_pick ^ keys[i]

Which we could easily make a python script to do this for us.

unnamed (29)

Next we will reverse the other loop appending to chars which is chains.

chains = [0x74, 0x68, 0x69, 0x73, 0x20, 0x69, 0x73, 0x20, 0x61, 0x20, 0x74, 0x72,0x6f, 0x6c, 0x6c]

chains_encrypt = chain + 0xA

Let’s add this to our script from the last loop.

unnamed (30)

This will give us the full password, make sure to notice that the key is the first 10 values of the password which will be used for the hackthebox flag.

 

Now for the much easier method…

Open the snake.py script and add ‘print slither’ right before it asks for your input to the variable username. Next add python code to create a new array and append each of the characters of the array ‘chars’. Using the chr() function we can add character elements to our new array rather than ascii codes. 

pasted image 0.png

Now when you run the script it will print both the username and the full password to the console. Noticing that the keys array is 10 values long we can determine the hackthebox flag will utilize the first 10 characters of the password that is returned.








EASIER METHOD]
make quick changes (*****)

slither = aa + db + nn + ef + rr + gh + lr + ty
print 'Authentication required'
print ''
****print slither****
user_input = raw_input('Enter your username\n')
if user_input == slither:
    pass

else:
    print 'Wrong username try harder'
    exit()

***easy = []
for char in chars: 
         easy.append(chr(char))***

***print "".join(easy)***

pass_input = raw_input('Enter your password\n')
for passes in pass_input:
    for char in chars:
        if passes == str(chr(char)):
            print 'Good Job'
            break
        else:
            print 'Wrong password try harder'
            exit(0)
    break

HTB{anaconda:udvvrjwa$$~rs}*s}*k*~|yvv}

udvvrjwa$$

