#lang racket

(require "TDAzonas_16491365_cofre.rkt")
(require "TDAcommit_16491365_cofre.rkt")
(require "comandos_16491365_cofre.rkt")

; test
;definicion archivos de texto
(define ar1 (archivo "ar1.txt" "esto es un archivo\nde texto con\ntres lineas"))
(define ar2 (archivo "ar2.txt" "Tres tristres\nTigres tragan\ntrigo"))
(define ar3 (archivo "ar3.txt" "esto es un archivo\nde texto con\ngato"))

;definicion de "cambios" (almacenan el archivo y los cambios por linea)
; *compara-archivos compara dos archivos y entrega un "cambio" con todas
; las lineas que difieren entre uno y otro archivo y el contenido para esa
; linea en el primer archivo ingresado como parámetro.
(define cam1 (cambio ar2 (compara-archivos ar1 ar2)))
(define cam2 (cambio ar1 (compara-archivos ar1 ar3)))
(define cam3 (cambio ar3 (compara-archivos ar3 ar2)))

;ejemplo commit
(define com1 (commit "Juan Perez" "esto es un commit" (list cam1 cam2 cam3)))

;definicion workspace
(define ws1 (workspace "ws1" (list ar1 ar2 ar3)))

;definicion localRepo
(define lr1 (LocalRepository "ws1" (list ar1 ar2 ar3) (list com1)))

;definicion remoteRepo
(define rr1 (RemoteRepository "ws1" (list ar1 ar2 ar3) (list com1)))

;pull
(pull ws1 rr1)
