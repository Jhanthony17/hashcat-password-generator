#!/bin/bash
rules=$(ls rules/*.rule | sed 's/^/-r /')
hashcat --stdout $rules wordlist.txt > passwords.txt
