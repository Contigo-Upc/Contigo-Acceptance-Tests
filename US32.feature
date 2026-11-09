Feature: US-32 - Identificación visual del campo con error
  Como usuario
  Deseo que la aplicación resalte claramente y en colores el lugar exacto donde me equivoqué
  Para poder ubicarlo y corregirlo rápidamente

#-------------------------------------------------------------------------------------------
Scenario Outline: Resaltado visual

    Given el usuario omitió el campo obligatorio "<campo>" en el trámite "<tramite>"
    When presiona "Siguiente"
    Then el sistema marca el borde del campo "<campo>" en color rojo y añade debajo el texto "<texto_ayuda>"

    Examples: Datos de entrada y salida
      | tramite           | campo                | texto_ayuda                       |
      | Pago de luz       | Número de suministro | Escribe este dato para continuar. |
      | Renovación de DNI | Número de DNI        | Escribe este dato para continuar. |
      | Pago de cable     | Monto a pagar (S/)   | Escribe este dato para continuar. |


#-------------------------------------------------------------------------------------------
Scenario Outline: Desplazamiento automático

    Given el formulario "<formulario>" es largo y el error está en el campo "<campo>" de la parte superior
    When el usuario presiona "<boton>"
    Then el sistema desliza la pantalla automáticamente hasta dejar a la vista el campo "<campo>" con el cursor dentro

    Examples: Datos de entrada
      | formulario                     | campo                | boton          |
      | Cuéntanos sobre ti             | Nombre completo      | Registrarme    |
      | Cuéntanos sobre ti             | Edad                 | Registrarme    |
      | Escribe los datos de tu recibo | Número de suministro | Guardar recibo |


#-------------------------------------------------------------------------------------------
Scenario Outline: Múltiples errores

    Given el usuario cometió errores en los campos "<campos_con_error>" del formulario "<formulario>"
    When intenta confirmar con el botón "<boton>"
    Then el sistema resalta en rojo todos esos campos a la vez y muestra el aviso "<aviso>"

    Examples: Datos de entrada y salida
      | formulario                     | campos_con_error                                         | boton          | aviso                                 |
      | Escribe los datos de tu recibo | Número de suministro y Monto a pagar                     | Guardar recibo | Hay 2 datos que necesitan tu atención |
      | Escribe los datos de tu recibo | Número de contrato, Monto a pagar y Fecha de vencimiento | Guardar recibo | Hay 3 datos que necesitan tu atención |
      | Anota tus datos                | Número de suministro y Monto a pagar (S/)                | Siguiente      | Hay 2 datos que necesitan tu atención |
