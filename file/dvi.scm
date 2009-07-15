;;;
;;;  dvi.scm
;;;
;;;   Copyright (c) 2007,2008 Takeshi Abe. All rights reserved.
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

(define-module file.dvi
  (use binary.io)
  (use gauche.collection)
  (use gauche.sequence)
  (use gauche.uvector)
  (use srfi-1)
  (export
   dvi-set-char-0
   dvi-set-char-1
   dvi-set-char-2
   dvi-set-char-3
   dvi-set-char-4
   dvi-set-char-5
   dvi-set-char-6
   dvi-set-char-7
   dvi-set-char-8
   dvi-set-char-9
   dvi-set-char-10
   dvi-set-char-11
   dvi-set-char-12
   dvi-set-char-13
   dvi-set-char-14
   dvi-set-char-15
   dvi-set-char-16
   dvi-set-char-17
   dvi-set-char-18
   dvi-set-char-19
   dvi-set-char-20
   dvi-set-char-21
   dvi-set-char-22
   dvi-set-char-23
   dvi-set-char-24
   dvi-set-char-25
   dvi-set-char-26
   dvi-set-char-27
   dvi-set-char-28
   dvi-set-char-29
   dvi-set-char-30
   dvi-set-char-31
   dvi-set-char-32
   dvi-set-char-33
   dvi-set-char-34
   dvi-set-char-35
   dvi-set-char-36
   dvi-set-char-37
   dvi-set-char-38
   dvi-set-char-39
   dvi-set-char-40
   dvi-set-char-41
   dvi-set-char-42
   dvi-set-char-43
   dvi-set-char-44
   dvi-set-char-45
   dvi-set-char-46
   dvi-set-char-47
   dvi-set-char-48
   dvi-set-char-49
   dvi-set-char-50
   dvi-set-char-51
   dvi-set-char-52
   dvi-set-char-53
   dvi-set-char-54
   dvi-set-char-55
   dvi-set-char-56
   dvi-set-char-57
   dvi-set-char-58
   dvi-set-char-59
   dvi-set-char-60
   dvi-set-char-61
   dvi-set-char-62
   dvi-set-char-63
   dvi-set-char-64
   dvi-set-char-65
   dvi-set-char-66
   dvi-set-char-67
   dvi-set-char-68
   dvi-set-char-69
   dvi-set-char-70
   dvi-set-char-71
   dvi-set-char-72
   dvi-set-char-73
   dvi-set-char-74
   dvi-set-char-75
   dvi-set-char-76
   dvi-set-char-77
   dvi-set-char-78
   dvi-set-char-79
   dvi-set-char-80
   dvi-set-char-81
   dvi-set-char-82
   dvi-set-char-83
   dvi-set-char-84
   dvi-set-char-85
   dvi-set-char-86
   dvi-set-char-87
   dvi-set-char-88
   dvi-set-char-89
   dvi-set-char-90
   dvi-set-char-91
   dvi-set-char-92
   dvi-set-char-93
   dvi-set-char-94
   dvi-set-char-95
   dvi-set-char-96
   dvi-set-char-97
   dvi-set-char-98
   dvi-set-char-99
   dvi-set-char-100
   dvi-set-char-101
   dvi-set-char-102
   dvi-set-char-103
   dvi-set-char-104
   dvi-set-char-105
   dvi-set-char-106
   dvi-set-char-107
   dvi-set-char-108
   dvi-set-char-109
   dvi-set-char-110
   dvi-set-char-111
   dvi-set-char-112
   dvi-set-char-113
   dvi-set-char-114
   dvi-set-char-115
   dvi-set-char-116
   dvi-set-char-117
   dvi-set-char-118
   dvi-set-char-119
   dvi-set-char-120
   dvi-set-char-121
   dvi-set-char-122
   dvi-set-char-123
   dvi-set-char-124
   dvi-set-char-125
   dvi-set-char-126
   dvi-set-char-127
   dvi-set1
   dvi-set2
   dvi-set3
   dvi-set4
   dvi-set-rule
   dvi-put1
   dvi-put2
   dvi-put3
   dvi-put4
   dvi-put-rule
   dvi-nop
   dvi-bop
   dvi-eop
   dvi-push
   dvi-pop
   dvi-right1
   dvi-right2
   dvi-right3
   dvi-right4
   dvi-w0
   dvi-w1
   dvi-w2
   dvi-w3
   dvi-w4
   dvi-x0
   dvi-x1
   dvi-x2
   dvi-x3
   dvi-x4
   dvi-down1
   dvi-down2
   dvi-down3
   dvi-down4
   dvi-y0
   dvi-y1
   dvi-y2
   dvi-y3
   dvi-y4
   dvi-z0
   dvi-z1
   dvi-z2
   dvi-z3
   dvi-z4
   dvi-fnt-num-0
   dvi-fnt-num-1
   dvi-fnt-num-2
   dvi-fnt-num-3
   dvi-fnt-num-4
   dvi-fnt-num-5
   dvi-fnt-num-6
   dvi-fnt-num-7
   dvi-fnt-num-8
   dvi-fnt-num-9
   dvi-fnt-num-10
   dvi-fnt-num-11
   dvi-fnt-num-12
   dvi-fnt-num-13
   dvi-fnt-num-14
   dvi-fnt-num-15
   dvi-fnt-num-16
   dvi-fnt-num-17
   dvi-fnt-num-18
   dvi-fnt-num-19
   dvi-fnt-num-20
   dvi-fnt-num-21
   dvi-fnt-num-22
   dvi-fnt-num-23
   dvi-fnt-num-24
   dvi-fnt-num-25
   dvi-fnt-num-26
   dvi-fnt-num-27
   dvi-fnt-num-28
   dvi-fnt-num-29
   dvi-fnt-num-30
   dvi-fnt-num-31
   dvi-fnt-num-32
   dvi-fnt-num-33
   dvi-fnt-num-34
   dvi-fnt-num-35
   dvi-fnt-num-36
   dvi-fnt-num-37
   dvi-fnt-num-38
   dvi-fnt-num-39
   dvi-fnt-num-40
   dvi-fnt-num-41
   dvi-fnt-num-42
   dvi-fnt-num-43
   dvi-fnt-num-44
   dvi-fnt-num-45
   dvi-fnt-num-46
   dvi-fnt-num-47
   dvi-fnt-num-48
   dvi-fnt-num-49
   dvi-fnt-num-50
   dvi-fnt-num-51
   dvi-fnt-num-52
   dvi-fnt-num-53
   dvi-fnt-num-54
   dvi-fnt-num-55
   dvi-fnt-num-56
   dvi-fnt-num-57
   dvi-fnt-num-58
   dvi-fnt-num-59
   dvi-fnt-num-60
   dvi-fnt-num-61
   dvi-fnt-num-62
   dvi-fnt-num-63
   dvi-fnt1
   dvi-fnt2
   dvi-fnt3
   dvi-fnt4
   dvi-xxx1
   dvi-xxx2
   dvi-xxx3
   dvi-xxx4
   dvi-fnt-def1
   dvi-fnt-def2
   dvi-fnt-def3
   dvi-fnt-def4
   dvi-pre
   dvi-post
   dvi-post-post
   dvi-dir
   <dvi-error>
   dvi-error?
   dvi->tree
   dvi-port->tree
   dvi-num-pages
   dvi-version
   dvi-ptex-tate?
   ))

(select-module file.dvi)

(define-macro (define-dvi-command . args)
  (let lp ((args args)
           (n 0)
           (seed '()))
    (if (null? args)
        `(begin
           ,@(map (cut cons 'define-constant <>) seed))
        (let ((c (car args)))
          (case (length c)
            ((0)
             (lp (cdr args) (+ n 1) seed))
            ((1)
             (lp (cdr args)
                 (+ n 1)
                 (cons
                  (list (string->symbol (format #f "dvi-~a" (car c))) n)
                  seed)))
            ((2)
             (let ((s (car c))
                   (t (cadadr c)))
               (let ilp ((h (caadr c))
                         (n n)
                         (seed seed))
                 (if (> h t)
                     (lp (cdr args) n seed)
                     (ilp (+ h 1)
                          (+ n 1)
                          (cons (list (string->symbol (format #f "dvi-~a~d" s h)) n)
                                seed)))))))))))

(define-dvi-command
  (set-char- (0 127))
  (set (1 4))
  (set-rule)
  (put (1 4))
  (put-rule)
  (nop)
  (bop)
  (eop)
  (push)
  (pop)
  (right (1 4))
  (w (0 4))
  (x (0 4))
  (down (1 4))
  (y (0 4))
  (z (0 4))
  (fnt-num- (0 63))
  (fnt (1 4))
  (xxx (1 4))
  (fnt-def (1 4))
  (pre)
  (post)
  (post-post)
  () ; 250
  () ; 251
  () ; 252
  () ; 253
  () ; 254
  (dir))

(define-condition-type <dvi-error> <error>
  dvi-error?)

(define (dvi->tree dvi)
  (call-with-input-file dvi dvi-port->tree))

(define (dvi-port->tree iport)
  (define (read-unsigned len)
    (let ((i (read-uint len iport 'big-endian)))
      (if (eof-object? i)
          (error <dvi-error> "unexpected eof")
          i)))
  (define (read-signed len)
    (let ((i (read-sint len iport 'big-endian)))
      (if (eof-object? i)
          (error <dvi-error> "unexpected eof")
          i)))
  (let lp ((c (read-byte iport))
           (result '()))
    (define (lp-with-blocks ls . suppli)
      (let* ((vs (map make-u8vector ls))
             (rs (map (lambda (v) (read-block! v iport)) vs)))
        (if (equal? ls rs)
            (if (null? suppli)
                (lp (read-byte iport) (cons (cons c vs) result))
                (let ((vs ((car suppli) vs)))
                  (lp (read-byte iport) (cons (cons c vs) result)))))))
    (cond ((<= c dvi-set-char-127)
           (lp (read-byte iport) (cons (list c) result)))
          ((<= c dvi-set4)
           (lp-with-blocks (list (- c dvi-set-char-127))))
          ((= c dvi-set-rule)
           (let ((a (read-signed 4))
                 (b (read-signed 4)))
             (lp (read-byte iport) (cons (list c a b) result))))
          ((<= c dvi-put4)
           (lp-with-blocks (list (- c dvi-set-rule))))
          ((= c dvi-put-rule)
           (let ((a (read-signed 4))
                 (b (read-signed 4)))
             (lp (read-byte iport) (cons (list c a b) result))))
          ((= c dvi-nop)
           (lp (read-byte iport) (cons (list c) result)))
          ((= c dvi-bop)
           (lp-with-blocks (make-list 10 4)
                           (cut append <> (list (read-signed 4)))))
          ((= c dvi-eop)
           (lp (read-byte iport) (cons (list c) result)))
          ((= c dvi-push)
           (lp (read-byte iport) (cons (list c) result)))
          ((= c dvi-pop)
           (lp (read-byte iport) (cons (list c) result)))
          ((<= c dvi-right4)
           (let ((b (read-signed (- c dvi-pop))))
             (lp (read-byte iport) (cons (list c b) result))))
          ((= c dvi-w0)
           (lp (read-byte iport) (cons (list c) result)))
          ((<= c dvi-w4)
           (let ((b (read-signed (- c dvi-w0))))
             (lp (read-byte iport) (cons (list c b) result))))
          ((= c dvi-x0)
           (lp (read-byte iport) (cons (list c) result)))
          ((<= c dvi-x4)
           (let ((b (read-signed (- c dvi-x0))))
             (lp (read-byte iport) (cons (list c b) result))))
          ((<= c dvi-down4)
           (let ((a (read-signed (- c dvi-x4))))
             (lp (read-byte iport) (cons (list c a) result))))
          ((= c dvi-y0)
           (lp (read-byte iport) (cons (list c) result)))
          ((<= c dvi-y4)
           (let ((a (read-signed (- c dvi-y0))))
             (lp (read-byte iport) (cons (list c a) result))))
          ((= c dvi-z0)
           (lp (read-byte iport) (cons (list c) result)))
          ((<= c dvi-z4)
           (let ((a (read-signed (- c dvi-z0))))
             (lp (read-byte iport) (cons (list c a) result))))
          ((<= c dvi-fnt-num-63)
           (lp (read-byte iport) (cons (list c) result)))
          ((<= c dvi-fnt4)
           (lp-with-blocks (list (- c dvi-fnt-num-63))))
          ((<= c dvi-xxx4)
           (let ((k (read-unsigned (- c dvi-fnt4))))
             (lp-with-blocks (list k)
                             (cut cons k <>))))
          ((<= c dvi-fnt-def4)
           (let ((k  (read-unsigned (- c dvi-xxx4)))
                 (cs (read-unsigned 4))
                 (s  (read-signed 4))
                 (d  (read-signed 4))
                 (a  (read-byte iport))
                 (l  (read-byte iport)))
             (let ((n (read-block (+ a l) iport)))
               (cond ((eof-object? n)
                      (error <dvi-error> "unexpected eof" c))
                     (else
                      (lp (read-byte iport) (cons (list c k cs s d a l n) result)))))))
          ((= c dvi-pre)
           (let ((i   (read-byte iport))
                 (num (read-unsigned 4))
                 (den (read-unsigned 4))
                 (mag (read-unsigned 4))
                 (k   (read-byte iport)))
             (cond ((eof-object? k)
                    (error <dvi-error> "unexpected eof" c))
                   ((read-block k iport)
                    => (lambda (x)
                         (if (eof-object? x)
                             (error <dvi-error> "unexpected eof" c)
                             (lp (read-byte iport) (cons (list c i num den mag k x) result)))))
                   (else
                    (error <dvi-error> "reached impossibly" c)))))
          ((= c dvi-post)
           (let ((p   (read-signed 4))
                 (num (read-unsigned 4))
                 (den (read-unsigned 4))
                 (mag (read-unsigned 4))
                 (l   (read-signed 4))
                 (u   (read-signed 4))
                 (s   (read-unsigned 2))
                 (t   (read-unsigned 2)))
             (if (eof-object? t)
                 (error <dvi-error> "unexpected eof" c)
                 (lp (read-byte iport) (cons (list c p num den mag l u s t) result)))))
          ((= c dvi-post-post)
           (let ((q (read-unsigned 4))
                 (i (read-byte iport)))
             (let ilp ((n 0)
                       (b (read-byte iport)))
               (cond ((eof-object? b)
                      (if (<= 4 n)
                          (reverse! (cons (list c q i) result))
                          (error <dvi-error> "unexpected eof" c)))
                     ((= b 223)
                      (ilp (+ n 1) (read-byte iport)))
                     (else
                      (error <dvi-error> "unexpected stuff" b))))))
          ((= c dvi-dir)
           (let ((d (read-byte iport)))
             (lp (read-byte iport) (cons (list c d) result))))
          (else
           (error <dvi-error> "unexpected command" c)))))

(define (dvi-num-pages tree)
  (cond ((find (lambda (x) (= dvi-post (car x))) tree)
         => last)
        (else
         (error <dvi-error> "lack of the post command"))))

(define (dvi-version tree)
  (cond ((find (lambda (x) (= dvi-post-post (car x))) tree)
         => third)
        (else
         (error <dvi-error> "lack of the post_post command"))))

(define (dvi-ptex-tate? tree)
  (= 3 (dvi-version tree)))

(provide "file/dvi")
