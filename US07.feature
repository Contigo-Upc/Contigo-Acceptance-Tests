Feature: US-07 - Búsqueda de un trámite por texto o voz
  Como usuario
  Deseo buscar un trámite escribiendo o hablando
  Para no tener que revisar todo el menú

#-------------------------------------------------------------------------------------------
Scenario Outline: Búsqueda por voz exitosa

    Given el usuario toca el ícono de búsqueda
    When dice "<frase>"
    Then el sistema muestra el trámite "<tramite>"

    Examples: Datos de entrada y salida
      | frase                      | tramite            |
      | quiero pagar la luz        | Pago de luz        |
      | necesito renovar mi DNI    | Renovación de DNI  |
      | quiero ver si tengo deudas | Consulta de deudas |
      | cómo pago el agua          | Pago de agua       |


#-------------------------------------------------------------------------------------------
Scenario Outline: Búsqueda sin resultados

    Given el usuario busca "<busqueda>", un trámite que no existe en la app
    When termina de escribir en el buscador
    Then el sistema muestra el mensaje "<mensaje>" y la sugerencia "<sugerencia>"

    Examples: Datos de entrada y salida
      | busqueda             | mensaje                    | sugerencia                                                                                   |
      | pasaporte            | No encontramos ese trámite | Prueba con otra palabra, por ejemplo: luz, agua o DNI. También puedes elegir otra categoría. |
      | licencia de conducir | No encontramos ese trámite | Prueba con otra palabra, por ejemplo: luz, agua o DNI. También puedes elegir otra categoría. |
      | jubilación           | No encontramos ese trámite | Prueba con otra palabra, por ejemplo: luz, agua o DNI. También puedes elegir otra categoría. |


#-------------------------------------------------------------------------------------------
Scenario Outline: Búsqueda por texto parcial

    Given el usuario escribe solo "<texto>", parte del nombre del trámite, en "Mis trámites"
    When el sistema procesa la búsqueda
    Then muestra todas las coincidencias relacionadas: "<coincidencias>"

    Examples: Datos de entrada y salida
      | texto | coincidencias                                              |
      | pag   | Pago de luz, Pago de agua, Pago de internet, Pago de cable |
      | renov | Renovación de DNI                                          |
      | deud  | Consulta de deudas                                         |
