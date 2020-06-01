#lang racket

(require "TDAotros_16491365_cofre.rkt")


;Repositorio Remoto
;Caso especial de directorio con commits
;DOM: str lista lista
;REC: par directrio, lista(commits)
(define RemoteRepository(lambda(nombre contenidos listaCommits)(
                                                                if (and (not (null? (directorio nombre contenidos))) (list? listaCommits) (andmap commit? listaCommits))
                                                                    (cons (directorio nombre contenidos) listaCommits)
                                                                    null
                                                           )))
