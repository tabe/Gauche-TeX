;;;
;;;  tex.scm
;;;
;;;   Copyright (c) 2007 Takeshi Abe. All rights reserved.
;;;
;;;   Redistribution and use in source and binary forms, with or without
;;;   modification, are permitted provided that the following conditions
;;;   are met:
;;;
;;;    1. Redistributions of source code must retain the above copyright
;;;       notice, this list of conditions and the following disclaimer.
;;;
;;;    2. Redistributions in binary form must reproduce the above copyright
;;;       notice, this list of conditions and the following disclaimer in the
;;;       documentation and/or other materials provided with the distribution.
;;;
;;;    3. Neither the name of the authors nor the names of its contributors
;;;       may be used to endorse or promote products derived from this
;;;       software without specific prior written permission.
;;;
;;;   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
;;;   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
;;;   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
;;;   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
;;;   OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
;;;   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
;;;   TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
;;;   PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
;;;   LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
;;;   NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
;;;   SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
;;;  
;;;  $Id$

(define-module file.tex
  (use srfi-13)
  (export-all))

(select-module file.tex)

;; Chapter 7: How TeX Reads What You Type
(define (catcode x)
  (case x
    ((92)  ; \
     0)    ; Escape character
    ((123) ; {
     1)    ; Beginning of group
    ((125) ; }
     2)    ; End of group
    ((36)  ; $
     3)    ; Math Shift
    ((38)  ; &
     4)    ; Alignment tab
    ((13)  ; <return>
     5)    ; End of line
    ((35)  ; #
     6)    ; Parameter
    ((94)  ; ^
     7)    ; Superscript
    ((95)  ; _
     8)    ; Subscript
    ((0)   ; <null>
     9)    ; Ignored character
    ((32)  ; <space>
     10)   ; Space
    ((65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122)
     11)   ; A, ..., Z and a, ..., z
    ((126) ; ~
     13)   ; Active character
    ((37)  ; %
     14)   ; Comment character
    ((127) ; <delete>
     15)   ; Invalid character
    (else
     12)))

;; Chapter 8: The Characters You Type
(define (tex-masticate catcode iport)
  (define (hexadecimal-code e f)
    (logior (ash (if (<= 48 e 57)
                     (- e 48)
                     (- e 87))
                 4)
            (if (<= 48 f 57)
                (- f 48)
                (- f 87))))
  (define (replace-trio-or-quad c rest)
    (and-let* (( (pair? rest))
               (d (car rest))
               ( (= c d))
               (est (cdr rest))
               ( (pair? est))
               (e (car est))
               (st (cdr est)))
      (cond ((and-let* (( (or (<= 48 e 57) (<= 97 e 102)))
                        ( (pair? st))
                        (f (car st))
                        ( (or (<= 48 f 57) (<= 97 f 102))))
               f)
             => (lambda (f)
                  (cons (hexadecimal-code e f) (cdr st))))
            ((<= 0 e 63)
             (cons (+ e 64) st))
            ((<= 64 e 127)
             (cons (- e 64) st))
            (else
             #f))))
  (let lp ((result '())
           (line (read-line iport)))
    (cond ((eof-object? line)
           (reverse result))
          (else
           (let ((ls (map char->integer (string->list (string-trim-right line #\space))))) ; number 32
             ;; insert a <return> at the right end of the line
             (if (null? ls)
                 (set! ls '(13))
                 (set-cdr! (last-pair ls) '(13)))
             (let ilp ((temp '())
                       (ls ls)
                       (state 'N))
               (if (null? ls)
                   (lp (cons (reverse temp) result) (read-line iport))
                   (let ((c (car ls)))
                     (case (catcode c)
                       ((0)
                        (let ilp0 ((name '())
                                   (rest (cdr ls)))
                          (if (null? rest)
                              (ilp (cons (reverse name) temp) '() (if (null? name) 'M 'S))
                              (let ((d (car rest)))
                                (case (catcode d)
                                  ((7)
                                   (let ((r (cdr rest)))
                                     (cond ((replace-trio-or-quad d r)
                                            => (cut ilp0 name <>))
                                           (else
                                            (ilp (cons (list d) temp) r 'M)))))
                                  ((11)
                                   (ilp0 (cons d name) (cdr rest)))
                                  (else
                                   (if (null? name)
                                       (ilp (cons (list d) temp) (cdr rest) 'M)
                                       (ilp (cons (reverse name) temp) rest 'M))))))))
                       ((7)
                        (let ((rest (cdr ls)))
                          (cond ((replace-trio-or-quad c rest)
                                 => (cut ilp temp <> state))
                                (else
                                 (ilp (acons c 7 temp) rest 'M)))))
                       ((10)
                        (case state
                          ((N S)
                           (ilp temp (cdr ls) state))
                          ((M)
                           (ilp (acons c 10 temp) (cdr ls) 'S))
                          (else
                           (error "unknown state" state))))
                       ((1 2 3 4 6 8 11 12 13)
                        => (lambda (code)
                             (ilp (acons c code temp) (cdr ls) 'M)))
                       ((5)
                        (case state
                          ((N)
                           (ilp (cons '(112 97 114) temp) (cdr ls) state)) ; par
                          ((M)
                           (ilp (acons 32 10 temp) (cdr ls) 'S))
                          ((S)
                           (ilp temp (cdr ls) state))
                          (else
                           (error "unknown state" state))))
                       ((9)
                        (ilp temp (cdr ls) state))
                       ((10)
                        (case state
                          ((N S)
                           (ilp temp (cdr ls) state))
                          ((M)
                           (ilp (acons c 10 temp) (cdr ls) 'S))
                          (else
                           (error "unknown state" state))))
                       ((14)
                        (lp (cons (reverse temp) result) (read-line iport)))
                       ((15)
                        (format (current-error-port) "a character of category 15 found: ~d\n" c)
                        (ilp temp (cdr ls) state))
                       (else
                        => (cut error "unexpected catcode" <>)))))))))))

;; Chapter 20: Definitions (also called Macros)
;; pp. 212-
(define (tex-digest token-list)
  token-list)

(provide "file/tex")
