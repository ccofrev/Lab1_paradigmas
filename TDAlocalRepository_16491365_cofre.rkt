#lang racket

(provide (all-defined-out))

;Repositorio Local
;Caso especial de directorio con commits
;DOM: str lista lista
;REC: par directrio, lista(commits)
(define LocalRepository(lambda(nombre contenidos listaCommits)(
                                                                if (and (not (null? (directorio nombre contenidos))) (list? listaCommits) (andmap commit? listaCommits))
                                                                    (cons (directorio nombre contenidos) listaCommits)
                                                                    null
                                                           )))