Feature: US-34 - Intervención del Asistente IA ante fallos repetitivos
  Como adulto mayor
  Deseo que el asistente virtual me ofrezca ayuda automáticamente si me equivoco varias veces en el mismo paso
  Para no frustrarme y evitar abandonar el trámite

#-------------------------------------------------------------------------------------------
Scenario Outline: Ayuda tras múltiples errores

    Given el usuario ya ingresó 2 veces seguidas un dato erróneo en el paso "Anota tus datos" del trámite "<tramite>"
    When escribe "<dato_erroneo>" en el campo "<campo>" y presiona "Siguiente" por tercera vez
    Then el sistema despliega automáticamente el mensaje "¿Necesitas ayuda con este paso?" con el texto "Este fue el tercer intento. Te mostramos dónde encontrar el dato: <texto_ayuda>"

    Examples: Datos de entrada y salida
      | tramite          | campo                | dato_erroneo | texto_ayuda                                                                                            |
      | Pago de luz      | Número de suministro | 24681        | El número de suministro está arriba, cerca de tu nombre. A veces dice «N.º de cliente» o «Suministro». |
      | Pago de agua     | Número de suministro | 75A1902      | El número de suministro está arriba del recibo. Tiene 7 u 8 números.                                   |
      | Pago de internet | Número de contrato   | 5678         | El número de contrato está junto a tu nombre y tu dirección.                                           |


#-------------------------------------------------------------------------------------------
Scenario Outline: Aceptación de ayuda

    Given el asistente ofreció ayuda proactiva en el campo "<campo>" del trámite "<tramite>"
    When el usuario selecciona "Sí"
    Then el asistente explica qué dato se requiere y cómo encontrarlo en su <documento> con el mensaje "<explicacion>"

    Examples: Datos de entrada y salida
      | tramite           | campo                | documento       | explicacion                                    |
      | Pago de luz       | Número de suministro | recibo de luz   | Tiene 7 u 8 números. Está arriba de tu recibo. |
      | Renovación de DNI | Número de DNI        | DNI             | Son 8 números. Los encuentras en tu DNI.       |
      | Pago de cable     | Número de contrato   | recibo de cable | Tiene entre 6 y 10 números. Está en tu recibo. |


#-------------------------------------------------------------------------------------------
Scenario Outline: Rechazo de ayuda

    Given el asistente ofrece ayuda proactiva en el campo "<campo>" del trámite "<tramite>"
    When el usuario selecciona "No, gracias"
    Then la ventana del asistente se minimiza y el campo "<campo>" queda listo para que siga intentándolo

    Examples: Datos de entrada
      | tramite            | campo                |
      | Pago de luz        | Número de suministro |
      | Consulta de deudas | Número de DNI        |
