#lang racket

(require 2htdp/batch-io)
(require "get-gdp.rkt")

(define countries (read-csv-file "country-codes.csv"))
(define country-names (map second countries))
(define initial-letters (map (lambda (c) (string-ref c 0)) country-names))
(define init-map (make-vector 256 empty))
(for ([c country-names])
  (define bucket (char->integer (char-upcase (string-ref c 0))))
  (vector-set! init-map 
               bucket
               (cons c (vector-ref init-map bucket))))

(define (legal-init? c)
  (not (empty? (vector-ref init-map (char->integer (char-upcase c))))))

(define (countries-from c)
  (vector-ref init-map (char->integer (char-upcase c))))

(define shortest 4)
(define longest 5)
(define words-file "/usr/share/dict/words")

(define wf-words
  (let ([p (open-input-file words-file)])
    (let loop ()
      (let ([i (read-line p)])
        (if (eof-object? i) empty
            (if (<= shortest (string-length i) longest)
                (cons i (loop))
                (loop)))))))

(define valid-words
  (let loop ([wfws wf-words])
    (if (empty? wfws) empty
        (let ([w (first wfws)])
          (if (andmap legal-init? (string->list w))
              (cons w (loop (rest wfws)))
              (loop (rest wfws)))))))

(define (filter/no-proper-nouns w)
  (not (char-upper-case? (string-ref w 0))))

(define (filter/is-palindrome w)
  (let ([l (string->list w)])
    (equal? l (reverse l))))

(define (heuristic-filter/keep w)
  (and (filter/no-proper-nouns w)
       (filter/is-palindrome w)))

(define desired-words
  (filter heuristic-filter/keep valid-words))

(define chars-in-4/5-palindromes 
  (remove-duplicates 
   (sort (string->list (apply string-append (filter filter/is-palindrome valid-words))) char<=?)))

(define countries-dropped-by-4/5-palindromes
  (apply append
         (for/list ([c '(#\a #\b #\c #\d #\e #\f #\g #\h #\i #\j #\k #\l #\m #\n #\o #\p #\q #\r #\s #\t #\u #\v #\w #\x #\y #\z)]) ;; Words are in English
           (if (member c chars-in-4/5-palindromes)
               '()
               (countries-from c)))))

