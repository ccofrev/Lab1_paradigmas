#lang racket

(provide (all-defined-out))
(require "TDAcommit_16491365_cofre.rkt")


;Repositorio Local
;Caso especial de directorio con commits
;DOM: str lista lista
;REC: par directrio, lista(commits)
(define workspace(lambda(nombre contenidos listaCommits)(
                                                                if (and (not (null? (directorio nombre contenidos))) (list? listaCommits) (andmap commit? listaCommits))
                                                                    (cons (directorio nombre contenidos) listaCommits)
                                                                    null
                                                           )))
; Pertenencia
(define workspace?(lambda(Workspace)(
                                           not null? (workspace (car Workspace) (car (cdr Workspace)) (car (cdr (cdr Workspace))))
                                           )))



;Repositorio Remoto
;Caso especial de directorio con commits
;DOM: str lista lista
;REC: par directrio, lista(commits)
(define RemoteRepository(lambda(nombre contenidos listaCommits)(
                                                                if (and (not (null? (directorio nombre contenidos))) (list? listaCommits) (andmap commit? listaCommits))
                                                                    (cons (directorio nombre contenidos) listaCommits)
                                                                    null
                                                           )))
; Pertenencia
(define RemoteRepository?(lambda(RemoteRepo)(
                                           not null? (RemoteRepository (car RemoteRepo) (car (cdr RemoteRepo)) (car (cdr (cdr RemoteRepo))))
                                           )))


;Repositorio Local
;Caso especial de directorio con commits
;DOM: str lista lista
;REC: par directrio, lista(commits)
(define LocalRepository(lambda(nombre contenidos listaCommits)(
                                                                if (and (not (null? (directorio nombre contenidos))) (list? listaCommits) (andmap commit? listaCommits) )
                                                                    (cons (directorio nombre contenidos) listaCommits)
                                                                    null
                                                           )))

; Pertenencia
(define LocalRepository?(lambda(LocalRepo)(
                                           not null? (LocalRepository (car LocalRepo) (car (cdr LocalRepo)) (car (cdr (cdr LocalRepo))))
                                           )))


;TDA Index
;Constructor Polinomio
;Dom: Commit... 
;Rec: index
(define (index . commits)
  (if (andmap commit? commits)
      commits
      null))


(define index? (lambda(index)(
                              andmap commit? index
                              )))





;(require "TDAindex_16491365_cofre.rkt")
;(require "TDAworkspace_16491365_cofre.rkt")

;(require "TDAcommit_16491365_cofre.rkt")



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
;REC: String
(define getNombreArchivo (lambda (Archivo)(
                                          car Archivo
                                              )))
;DOM:Archivo
;REC: lista de archivos
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
;(define ar1 (archivo "ar1" "esto\nes\nun\nperro\nde texto\naunque parezca"))
;(define ar2 (archivo "ar2" "esto\n es\nun\narchivo\nde texto\naunque no lo parezca"))
;(define ar3 (archivo "ar3" "esto\nes\nun\narchivo \naunque no lo parezca"))
;(define ar4 (archivo "ar4" "esto\npedro plancha\narchivo\nholi"))

;(require "TDAindex_16491365_cofre.rkt")
;(require "TDAcommit_16491365_cofre.rkt")
;(require "TDAotros_16491365_cofre.rkt")



;Repositorio Local
;Caso especial de directorio con commits
;DOM: str lista lista
;REC: par directrio, lista(commits)

; Pertenencia
;(define LocalRepository?(lambda(LocalRepo)(
;                                           not null? (LocalRepository (car LocalRepo) (car (cdr LocalRepo)) (car (cdr (cdr LocalRepo))))
;                                           )))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; AUXILIARES
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

;(define Dirs (list
;               (directorio "carpeta1" (list (directorio "carpeta1.1" (list "archivo4")) "archivo3") )
;               (directorio "carpeta2" (list "archivo1" "archivo2") )
;               (directorio "carpeta3" null)
;               ))

;(define Dirs1 (list
;              (list "carpeta1" (list "carpeta1.1" "archivo4") "archivo3")
;              (list "carpeta2" "archivo1" "archivo2")
;              (list "carpeta3")
;              ))


;Ejemplos de uso
;(search "carpeta1" Dirs)
;(search "carpeta2" Dirs)
;(search "carpeta3" Dirs)



; TDA Cambio
(define cambio (lambda(Archivo modificaciones)(
                                       if (and (archivo? Archivo) (list? modificaciones) (andmap pair? modificaciones))
                                          (cons Archivo modificaciones)
                                          null
                                       )))

(define getArchivoCambio(lambda(Cambio)(
                                car Cambio
                                )))

(define getModsCambio(lambda(Cambio)(
                                     cdr Cambio
                                     )))

; Ejemplos de uso
;(define cam1 (cambio ar1 (list(compara-archivos ar1 ar2))))
;(define cam2 (cambio ar2 (list(compara-archivos ar4 ar2))))

;TDA Zonas
(define zonas(lambda(Workspace Index LocalRepo RemoteRepo)(
                                                           if (and (workspace? Workspace) (index? Index) (LocalRepository? LocalRepo) (RemoteRepository? RemoteRepo))
                                                              (list Workspace Index LocalRepo RemoteRepo)
                                                              null
                                                              )))
