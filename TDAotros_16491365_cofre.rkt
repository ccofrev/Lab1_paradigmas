#lang racket

;TDAs

;TDA archivo
;constructor
;DOM: string string
;REC: archivo (par de string)
(define archivo (lambda(nombre contenido)(
                                          if (and (string? nombre) (string? contenido))
                                              (cons nombre contenido)
                                              null
                                          )))
;selectores
;DOM:Archivo
;REC:
(define getNombreArchivo (lambda (Archivo)(
                                          car Archivo
                                              )))
  
(define getContenidoArchivo (lambda (Archivo)(
                                             cdr Archivo
                                                 )))

;pertenencia
(define archivo? (lambda (Archivo)(
                                   and
                                   (pair? Archivo)
                                   (not (null? (archivo (getNombreArchivo Archivo) (getContenidoArchivo Archivo))))
                                   )))

; Ejemplos de uso
(define ar1 (archivo "ar1" "esto\nes\nun\nperro\nde texto\naunque parezca"))
(define ar2 (archivo "ar2" "esto\n es\nun\narchivo\nde texto\naunque no lo parezca"))
(define ar3 (archivo "ar3" "esto\nes\nun\narchivo \naunque no lo parezca"))
(define ar4 (archivo "ar4" "esto\npedro plancha\narchivo\nholi"))





;TDA directorio
;constructor
(define directorio (lambda(nombre contenidos)(
                                             if (and (string? nombre) (list? contenidos))
                                                (cons nombre contenidos)
                                                null
                                             )))


;Getters
(define getNombreDirectorio (lambda (Directorio)
                              (car Directorio)
                              ))

(define getElementosDirectorio (lambda (Directorio)
                                 (cdr Directorio)
                                 ))

;pertenencia
(define directorio? (lambda(Directorio)(
                             and (pair? Directorio)
                                     (not null? (Directorio (getNombreDirectorio Directorio) (getElementosDirectorio Directorio)))
                                     (andmap (lambda(x)(or (archivo? x) (and (pair? x) (list? (cdr x)))) (getElementosDirectorio Directorio))
                                     ))))

;desc: retorna un directorio a partir de su nombre
;dom: String X Directorio
;rec: Directorio
;t. recursión: cola
(define search (lambda (nombreDir Directorio)
     (if (null? Directorio)
         null
         (if (equal? nombreDir (getNombreDirectorio (car Directorio)))
             (car Directorio)
             (search nombreDir (cdr Directorio))
             )
         )))


; Ejemplos de uso 
(define Dirs (list
               (directorio "carpeta1" (list (directorio "carpeta1.1" (list "archivo4")) "archivo3") )
               (directorio "carpeta2" (list "archivo1" "archivo2") )
               (directorio "carpeta3" null)
               ))

(define Dirs1 (list
              (list "carpeta1" (list "carpeta1.1" "archivo4") "archivo3")
              (list "carpeta2" "archivo1" "archivo2")
              (list "carpeta3")
              ))


(search "carpeta1" Dirs)
(search "carpeta2" Dirs)
(search "carpeta3" Dirs)

