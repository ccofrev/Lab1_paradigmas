#lang racket

(provide (all-defined-out))

; TDA commit
; constructor (también comando git)
; Se incluye autor timestamp mensaje y cambios, el timestamp se extrae automaticamente como segundos
; los cambios se representan como una lista de listas, cada una de las listas contenidas inicia con el nombre
; del archivo afectado seguido de pares de lineas y nuevo contenido con el que se reemplaza el contenido anterior.
(define commit(lambda(autor mensaje cambios)(
                                             if (and (string? autor) (string? mensaje) (list? cambios) (andmap list? cambios))
                                                (list autor (current-seconds) mensaje cambios)
                                                null
                        )))

(define commit? (lambda(commit)(
                                and (list? commit) (string? (car commit)) (string? (car (car commit))) (list? (car (car (car commit))))
                                )))
