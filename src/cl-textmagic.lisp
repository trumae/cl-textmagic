(in-package :cl-user)
(defpackage cl-textmagic
  (:documentation "All these commands can be executed only if you provide a 
  valid username and API password (get it here) in your requests. All TextMagic 
  API commands (on a per-need basis) use the following key parameters:

    Parameter_name	Example
    username	        xxxx
    password	        yyyy
    phone_number	        447123456789

  For more details see http://api.textmagic.com/https-api/textmagic-api-commands
")
  (:use :cl))
(in-package :cl-textmagic)

(defun send (username password text phone)
  "The send command is used to send an SMS message to a mobile phone."
  (json:decode-json-from-string 
   (dex:get (format nil 
		    "https://www.textmagic.com/app/api?username=~A&password=~A&cmd=send&text=~A&phone=~A&unicode=0" 
		    username password (quri:url-encode text) phone))))


(defun account (username password)
  "The send command is used to send an SMS message to a mobile phone."
  (json:decode-json-from-string 
   (dex:get (format nil 
		    "https://www.textmagic.com/app/api?username=~A&password=~A&cmd=account" 
		    username password))))

(defun message_status (username password ids)
"This command allows you to retrieve the delivery status of any SMS you have already sent."
  (json:decode-json-from-string 
   (dex:get (format nil 
		    "https://www.textmagic.com/app/api?username=~A&password=~A&cmd=message_status&ids=~A" 
		    username password ids))))

(defun receive (username password id)
  "This command retrieves the incoming SMS messages from the server. You can request any SMS sent to one of our SMS reply numbers by using this API."
  (json:decode-json-from-string 
   (dex:get (format nil 
		    "https://www.textmagic.com/app/api?username=~A&password=~A&cmd=receive&last_retrieved_id=~A" 
		    username password id))))


(defun delete_reply(username password ids)
  "This command helps you to delete any incoming SMS messages from the server."
  (json:decode-json-from-string 
   (dex:get (format nil 
		    "https://www.textmagic.com/app/api?username=~A&password=~A&cmd=delete_reply&ids=~A" 
		    username password ids))))


(defun check_number(username password phone)
  "This command helps you to validate a phone number's format and to check a message's price to its destination. 
    It also returns the phone number's country code."
  (json:decode-json-from-string 
   (dex:get (format nil 
		    "https://www.textmagic.com/app/api?username=~A&password=~A&cmd=check_number&phone=~A" 
		    username password phone))))





