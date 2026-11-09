Feature: US-31 - Mensajes de error en lenguaje sencillo
  Como adulto mayor con conocimientos digitales básicos
  Deseo leer los mensajes de error en palabras comunes y sin códigos técnicos
  Para entender rápidamente qué salió mal

#-------------------------------------------------------------------------------------------
Scenario Outline: Error interno del sistema

    Given ocurre el error técnico "<codigo_tecnico>" en la plataforma
    When la aplicación falla en cargar el trámite "<tramite>"
    Then el sistema muestra el mensaje "<mensaje>" en lugar del código "<codigo_tecnico>"

    Examples: Datos de entrada y salida
      | tramite            | codigo_tecnico | mensaje                                                                   |
      | Pago de luz        | Error 500      | Tuvimos un problema temporal, por favor inténtalo en unos minutos.        |
      | Renovación de DNI  | Error 503      | Estamos haciendo mejoras en Contigo. Vuelve a intentarlo en unos minutos. |
      | Consulta de deudas | Error 504      | La página tardó mucho en responder. Inténtalo otra vez en un momento.     |


#-------------------------------------------------------------------------------------------
Scenario Outline: Error por información incorrecta

    Given el usuario está en el paso "Anota tus datos" del trámite "<tramite>"
    When escribe "<dato_ingresado>" en el campo "<campo>" y presiona "Siguiente"
    Then el sistema muestra el mensaje "<mensaje>" en lugar de "Data type mismatch"

    Examples: Datos de entrada y salida
      | tramite           | campo                | dato_ingresado | mensaje                                               |
      | Renovación de DNI | Número de DNI        | 4578123        | Escribe los 8 números de tu DNI, sin espacios.        |
      | Pago de luz       | Número de suministro | 24A8135        | Escribe 7 u 8 números, sin espacios ni letras.        |
      | Pago de internet  | Número de contrato   | 5678           | Escribe entre 6 y 10 números, sin espacios ni letras. |
      | Pago de agua      | Monto a pagar (S/)   | cuarenta       | Escribe el monto solo con números. Ejemplo: 85.50     |


#-------------------------------------------------------------------------------------------
Scenario Outline: Apoyo visual en el error

    Given se muestra el aviso "<aviso>"
    When el usuario lo visualiza
    Then el aviso está acompañado del ícono "<icono>" dentro de un círculo de color <color>

    Examples: Datos de salida
      | aviso                                 | icono | color    |
      | Hay 2 datos que necesitan tu atención | !     | rojo     |
      | La foto salió borrosa                 | !     | amarillo |
      | La foto tiene poca luz                | !     | amarillo |
