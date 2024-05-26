# README

This repository contains a script in bash to generate passwords with hashcat and specific rules. 

But first lets see and example of how to use hashcat and rules:

Lets suppose that you have the following list of words:

```shell
└─$ cat wordlist.txt  
pinneaple
rockyou
```
and you want to create possible passwords with them adding or replacing characteres.

Well, with hashcat you can do it using rules. You can visit [HashCat-wiki](https://hashcat.net/wiki/doku.php?id=rule_based_attack) if you want to know more about the rules.

The following 3 files content rules with in:

```shell
└─$ cat Capitalize.rule                                                                                
#comment
: #just copy the word with no changes
c #capitalize the first letter
```

```shell
└─$ cat Years.rule     
#comment
$2 $0 $2 $3 ## append 2023
$2 $0 $2 $4 ## append 2024
```

```shell
└─$ cat Character.rule                      

$# #append '#'
$% #append '%'
```

With the following command you can run it. Remember that the order you invoque the rules they will modify the words:

```shell
└─$ hashcat --stdout -r Capitalize.rule -r Years.rule -r Character.rule wordlist.txt 
pinneaple2023#
Pinneaple2023#
pinneaple2024#
Pinneaple2024#
pinneaple2023%
Pinneaple2023%
pinneaple2024%
Pinneaple2024%
rockyou2023#
Rockyou2023#
rockyou2024#
Rockyou2024#
rockyou2023%
Rockyou2023%
rockyou2024%
Rockyou2024%
```
And this it how to can use hashchat to generate passwords.

# USAGE

```shell
git clone https://github.com/Jhanthony17/hashcat-password-generator

```
Add the words that will use to generate the password to the wordlist.txt file

```shell
└─$ cat wordlist.txt 
pinneaple
rockyou
```
Then execute the generate_password.sh file

```shell
bash generate_passwords.sh
```
And the password will be generate in the passwords.txt file

# SEE ALSO

* [HashCat-wiki](https://hashcat.net/wiki/doku.php?id=rule_based_attack): Info about hashcat rules