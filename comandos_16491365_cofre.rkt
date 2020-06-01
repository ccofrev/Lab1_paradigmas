#lang racket

(provide (all-defined-out))

; compara dos listas y devuelve una lista de pares indicando las lineas y el contenido de la primera lista en ese indice
; la idea es usar string-split para ingresar un tipo "archivo"


(define comparador(lambda(lista1 lista2)(
                                         define comparador_ (lambda(lista1_ lista2_ n)(
                                                                                        if (and (null? lista1_) (null? lista2_) )
                                                                                           null
                                                                                           (if (null? lista1_)
                                                                                               (cons (cons n null) (comparador_ null (cdr lista2_) (+ 1 n)))
                                                                                               (if (null? lista2_)
                                                                                                   (cons (cons n (car lista1_)) (comparador_ (cdr lista1_) null (+ 1 n)))
                                                                                                   (if (equal? (car lista1_) (car lista2_))
                                                                                                       (comparador_ (cdr lista1_) (cdr lista2_) (+ 1 n))
                                                                                                       (cons (cons n (car lista1_)) (comparador_ (cdr lista1_) (cdr lista2_) (+ 1 n)))
                                                                                                       )
                                                                                                   )
                                                                                               )
                                                                                        )))
                    (comparador_ lista1 lista2 0)
                    ))

; compara tipos archivo, dividiendolos como listas de lineas e indicando las lineas diferentes y el contenido
(define compara-archivos(lambda(archivo1 archivo2)(
                                                  if (and (archivo? archivo1) (archivo? archivo2))
                                                     (comparador (string-split (getcContenidoArchivo archivo1) "\n") (string-split (getContenidoArchivo archivo2) "\n"))
                                                     null
                                                  )))


(define cambiadef (lambda(Cambio)(
                                  string-join (camb (string-split (getContenidoArchivo (getArchivoCambio Cambio)) "\n") (getModsCambio Cambio)) "\n"
                                  )))



; TDA commit
; constructor (también comando git)
; Se incluye autor timestamp mensaje y cambios, el timestamp se extrae automaticamente como segundos
; los cambios se representan como una lista de lista de listas, cada una de las listas contenidas inicia con el nombre
; del archivo afectado seguido de pares de lineas y nuevo contenido con el que se reemplaza el contenido anterior.
(define commit(lambda(autor mensaje cambios)(
                                             if (and (string? autor) (string? mensaje) (list? cambios) (andmap list? cambios))
                                                (list autor (current-seconds) mensaje cambios)
                                                null
                        )))


; Funcion GIT
(define git(lambda(comando)(
                            lambda(objetivo)(comando objetivo)
                     )))
