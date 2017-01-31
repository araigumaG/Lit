# PHTTPd
A simple mini web server written in posix sh, needs netcat or socat.
You can serve any file or dir, as you like.

## Features:

- Static pages web server 
- POSIX compliant
    - Embeded shell interpreters friendly (ash, dash, busybox)
    - 'write onece, run anywhere, run for good'
- Generate directory tree menu
- Collect access logs as necessary
- No configs
- Connectivity and behavior configurable with options
- One single shell script (Mapping programing & at a glance)
- Small
- Alphabetical file-directory only allowed
- Hidden dirs/files not allowed
- Parent dir reference not allowed (/../)
- HTTP Error responses
    - 405 Method Not Allowed
    - 404 Not Found
    - 403 Forbidden
    - 400 Bad Request
    - 500 Internal Error

In phttpd, basic things like the above can be executed.
What I can not do yet and I do not understand well is as follows 
and will be implemented while looking at the POSIXism scriptures 
in the near future.

1. Run service as unprivileged user
2. URL decoding (%XX)
3. Access and error logs with logger
4. Other METHOD(PUT, POST, DELETE, ...)
6. cookie

It seems that there are still places that are not good and bad security 
in addition to the rest, but for the moment it is the first trial of 
the first round. "There is no complete software, there is release only" 
and it is also written in UNIX philosophy. If you do a little with shell 
script, I think that you can also deliver dynamic contents.

## Usage:

For example, simply execute the following command on the phttpd directory.

```
$ ./phttpd -r 'REGEX' -p PORT_NUMBER -d ROOT_DIRECTORY
```
or you can also use long option.

```
$ ./phttpd --regex='REGEX'             \
           --port=PORT_NUMBER          \
           --docroot=ROOT_DIRECTORY    #
```
PHTTPd listens on the port number "PORT_NUMBER" you set. 
And the root directory of PHTTPd's can be set with the 
-d option or the --docroot option. 

When URI matches your set REGEX, it will serve a directory or file matching 
the staring of the request from DOC_ROOT_DIR.

## Recommended Example:
```
$ ./phttpd -r '/.*' -d /mnt/c/Users/username -p 8080
```
In this case, phttpd listen on port 8080 and DOCROOT is "/mnt/c/Users/username". 
URI can match '/.*' BRE (Basic Regular Expression). 

In the above example, if the string requested by the user matches 
any character string including /, it will be served if there is a
 corresponding file or directory. The directory list is displayed 
 with a relative path link by HTML, so the user can easily access 
 the desired directory and file.

If you not set `-p` or `--port` option, phttpd wait on port `1234` by default.

Without -d (or --docroot) option and -r (or --regex), PHTTPd's DOC_ROOT_DIR 
is ~ and REGEX is '/.*'. 

For your needs, set options you like.

## Mapping programing and at a glance

Deciphering and expanding is easy, as this shell script is written to exactly 
match the procedure manual. This is the procedure manual itself. We are saying 
that this idea is mapping programming or at a glance.

## Requisites

* cat
* date
* file
* sed
* awk
* netcat
* socat