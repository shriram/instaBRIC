#lang racket

(require 2htdp/batch-io)
(require net/url)
(require [prefix-in xml: xml]) ;; because of a clash with 2htdp/batch-io
(require xml/path)

(provide get-gdp)

(define (make-gdp-url year-string country-code)
  (string->url
   (string-append "http://api.worldbank.org/countries/"
                  country-code
                  "/indicators/NY.GDP.MKTP.CD?date="
                  year-string
                  "&format=xml")))

(define (gdp-xml year-string country-code)
  (define p (get-pure-port (make-gdp-url year-string country-code)) )
  (unless (char=? (read-char p) #\uFEFF) ;; http://en.wikipedia.org/wiki/Byte_order_mark
    (error 'gdp-xml "expected BOM, got something else"))
  (begin0
    (xml:read-xml p)
    (close-input-port p)))

#|
http://api.worldbank.org/countries/IN/indicators/NY.GDP.MKTP.CD?date=2012
returns
<?xml version="1.0" encoding="utf-8"?>
<wb:data page="1" pages="1" per_page="50" total="1" xmlns:wb="http://www.worldbank.org">
  <wb:data>
    <wb:indicator id="NY.GDP.MKTP.CD">GDP (current US$)</wb:indicator>
    <wb:country id="IN">India</wb:country>
    <wb:date>2012</wb:date>
    <wb:value>1841709755679.17</wb:value>
    <wb:decimal>0</wb:decimal>
  </wb:data>
</wb:data>
|#

(define (get-gdp year)
  (define year-string (number->string year))
  (lambda (country-code)
    (string->number 
     (se-path* '(wb:value) 
               (xml:xml->xexpr (xml:document-element 
                                (gdp-xml year-string country-code)))))))
