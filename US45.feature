Feature: US-45 - Navegación completa por voz
  Como persona con baja alfabetización digital
  Deseo controlar la app usando solo comandos de voz
  Para no depender de leer o escribir

#-------------------------------------------------------------------------------------------
Scenario Outline: Comando ejecutado correctamente

    Given el usuario activa el "Modo voz" en la pantalla "<pantalla>"
    When dice "<comando>"
    Then el sistema ejecuta la acción correspondiente y muestra "<resultado>"

    Examples: Datos de entrada y salida
      | pantalla                              | comando           | resultado    |
      | Mi perfil                             | ir al inicio      | ¡Hola, Rosa! |
      | Guía de Pago de luz en el Paso 2 de 7 | siguiente paso    | Paso 3 de 7  |
      | Guía de Pago de luz en el Paso 3 de 7 | paso anterior     | Paso 2 de 7  |
      | Inicio                                | abrir mis recibos | Mis recibos  |


#-------------------------------------------------------------------------------------------
Scenario Outline: Comando no reconocido

    Given el sistema no entiende el comando "<comando>"
    When el usuario lo repite
    Then el sistema pide que lo diga de otra manera con el mensaje "<mensaje>"

    Examples: Datos de entrada y salida
      | comando       | mensaje                                                                |
      | pasa nomás    | No te entendí bien. Prueba diciendo «siguiente paso» o «ir al inicio». |
      | ya, dale      | No te entendí bien. Prueba diciendo «siguiente paso» o «ir al inicio». |
      | eso de la luz | No te entendí bien. Prueba diciendo «abrir Pago de luz».               |


#-------------------------------------------------------------------------------------------
Scenario Outline: Combinación de voz y táctil

    Given el usuario usa voz y también toca la pantalla en el "<paso_inicial>" de la guía de "<tramite>"
    When dice "<comando>" y luego toca el botón "<boton>"
    Then el sistema responde correctamente a ambos y muestra "<resultado>"

    Examples: Datos de entrada y salida
      | tramite            | paso_inicial | comando        | boton     | resultado   |
      | Pago de agua       | Paso 1 de 7  | siguiente paso | Siguiente | Paso 3 de 7 |
      | Renovación de DNI  | Paso 4 de 7  | paso anterior  | Anterior  | Paso 2 de 7 |
      | Consulta de deudas | Paso 2 de 6  | siguiente paso | Anterior  | Paso 2 de 6 |
