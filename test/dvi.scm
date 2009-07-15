(use file.dvi)
(test-module 'file.dvi)

(test-section "constant")
; (define-syntax test*-constant
;   (syntax-rules ()
;     ((_ (name value) ...)
;      (begin
;        (test* (symbol->string 'name) name value)
;        ...))))

(use gauche.sequence)
(define-macro (test*-dvi-command . args)
  `(begin
     ,@(map-with-index
        (lambda (i n)
          (and n
               `(test* ,(symbol->string n) ,n ,i)))
        args)))
(test*-dvi-command
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
 #f
 #f
 #f
 #f
 #f
 dvi-dir
 )

(test-section "dvi->tree")
(use srfi-1)

(define (test*-dvi->tree name num-pages version)
  (let ((tree (dvi->tree name)))
    ;;(for-each print tree)
    (test* "dvi-num-pages" (dvi-num-pages tree) num-pages)
    (test* "dvi-num-pages (dvi-error?)"
           'failed
           (guard (e ((dvi-error? e) 'failed))
             (dvi-num-pages (remove (lambda (x) (= dvi-post (car x))) tree))))
    (test* "dvi-version" version (dvi-version tree))
    (test* "dvi-ptex-tate?" (= version 3) (dvi-ptex-tate? tree))
    ))

(test*-dvi->tree "test/00band.dvi" 3 2)
(test*-dvi->tree "test/00quot.dvi" 1 3)
