(use file.tex)
(test-module 'file.tex)

(use gauche.charconv)

(for-each
 (lambda (pair)
   (test* "tex-masticate"
          (car pair)
          (tex-masticate catcode (open-input-string (cdr pair)))))
 '(((((112 97 114))) . "^^@")
   ((((255 . 12) (32 . 10))) . "^^ff")
   ((((116 104 101) (121 101 97 114) (32 . 10))) . "\\the\\year")))

(test* "tex-masticate"
       (call-with-input-file "test/20070315.tex" (cut tex-masticate catcode <>))
       (call-with-input-file "test/20070404.tex" (cut tex-masticate catcode <>)))

(define (test*-tex-masticate file)
  (format #t ";; test tex-masticate with ~a\n" file)
  (for-each
   print
   (call-with-input-file file
     (cut tex-masticate catcode <>)
     :encoding "*JP")))

(test*-tex-masticate "test/00band.tex")
(test*-tex-masticate "test/00gcd.tex")
(test*-tex-masticate "test/00quot.tex")
