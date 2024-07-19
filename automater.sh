#!/bin/bash


echo "8eeee8"                                                   
echo "8    8 e   e eeeee eeeee eeeeeee eeeee eeeee eeee eeeee"  
echo "8eeee8 8   8   8   8  88 8  8  8 8   8   8   8    8   8"  
echo "88   8 8e  8   8e  8   8 8e 8  8 8eee8   8e  8eee 8eee8e" 
echo "88   8 88  8   88  8   8 88 8  8 88  8   88  88   88   8" 
echo "88   8 88ee8   88  8eee8 88 8  8 88  8   88  88ee 88   8" 
echo "<><<<<<<><<<<<<><<<<<<><<<><<<<<<><<<<<<><<<<<<><<"
echo "<><<<<<<><<<<<<><<<<<<><<<><<<<<<><<<<<<><<<<<<><<<><<<<<<><<<<<<><<<<<<><<wse"                                                         

export url=$1

python3 - << EOF 

import os
import subprocess
import dns.resolver
from json import dumps
from httplib2 import Http

def sock():
    a = os.getenv('url')
    ip = dns.resolver.resolve(a,'A')
    for b in ip:
        s=b.to_text()
    return s

def ssl():
    process=subprocess.run(["testssl","--html","$url"])
    if process.returncode == 0:
       calltestssl()  
    else:
       error()

def nmap():
    s = sock()
    process=subprocess.run(["nmap","-oN","sqlscriptnmap","-sV","--script=http-sql-injection",s,"-p","80","-v"])
    if process.returncode == 0:
       callnmap()
    else:
        error()
    process1=subprocess.run(["nmap","-oN","httpbrutenmap","-p","80","--script","http-brute",s,"-v"])
    if process1.returncode == 0:
       callnmap()
    else:
        error()
    process2=subprocess.run(["nmap","-oN","dnsscriptnmap","--script","dns-brute",s,"-v"])
    if process2.returncode == 0:
       callnmap()
    else:
        error() 
    process3=subprocess.run(["nmap","-oN","httpenumnmap","--script","http-enum",s,"-v"])
    if process3.returncode == 0:
       callnmap()
    else:
        error()   
    process4=subprocess.run(["nmap","-oN","sitemapgeneratornmap","--script","http-sitemap-generator",s,"-v"])
    if process4.returncode == 0:
       callnmap()
    else:
        error()

def wafw00f():
    process=subprocess.run(["wafw00f","-o","wafw00f.txt","-a","$url"])
    if process.returncode == 0:
       callwafw00f()  
    else:
       error()

def curl():
    process=subprocess.run(["curl","-s","-D-","$url",">>","curl.txt"])
    callcurl()  
    
def nikto():
    process=subprocess.run(["nikto","-output","nikto.txt","-host","$url"])
    if process.returncode == 0:
       callnikto()  
    else:
       error()

def dirb():
    process=subprocess.run(["dirb","https://$url","-f","-o","dirb.txt"])
    if process.returncode == 0:
       calldirb()  
    else:
       error()

def main(a):
    
    url = '<webhook url>'
    message = {'text':a}
    message_headers = {'Content-Type': 'application/json; charset=UTF-8'}
    http_obj = Http()

    response = http_obj.request(
        uri=url,
        method='POST',
        headers=message_headers,
        body=dumps(message),
    )

def error():
    
    url = '<webhook url>'
    message = {'text': 'SOMETHING HAS GONE WRONG'}
    message_headers = {'Content-Type': 'application/json; charset=UTF-8'}
    http_obj = Http()

    response = http_obj.request(
        uri=url,
        method='POST',
        headers=message_headers,
        body=dumps(message),
    )

def callnmap():
    main("NMAP TESTING IS DONE")

def calltestssl():
    main("TESTSSL TESTING IS DONE")

def callwafw00f():
    main("WAFW00F TESTING IS DONE")

def callcurl():
    main("CURL TESTING IS DONE")

def callnikto():
    main("NIKTO TESTING IS DONE")

def calldirb():
    main("DIRECTORY TESTING IS DONE")

def callforall():
    main("COMPLETE TESTING IS DONE")

if __name__ == '__main__':
    sock()
    nmap()
    ssl()
    wafw00f()
    curl()
    nikto()
    dirb()
    error()
    callforall()
    
EOF

echo "DONE"