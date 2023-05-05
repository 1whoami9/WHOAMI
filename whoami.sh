#!/bin/bash

# Welcome message

echo " It's WHO AM I "

# NOW we have to Create new folder and ask for folder name

echo "folder name: "
read folder_name
mkdir "$folder_name"
cd "$folder_name"

# THEN Create new file for subdomains and ask for domain name

echo "Enter domain name : "
read domain_name
touch "$domain_name.txt"

# USE Subfinder to get subdomains with output file

echo "Running Subfinder..."
subfinder -d "$domain_name" >> "$domain_name.txt"

# Use httpx to check subdomains 

echo "Checking subdomains with httpx..."
httpx -l "$domain_name.txt" -silent -o final_Subs.txt

# Use Nuclei to check for vulnerabilities on subdomains 

echo "Checking subdomains with Nuclei..."
cat temp.txt | nuclei  -l final_Subs.txt -o nuclei_output.txt 

# Clean temporary files

rm temp.txt
