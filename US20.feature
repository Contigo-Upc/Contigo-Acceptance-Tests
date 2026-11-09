Feature: US-20 - Historial de documentos escaneados
  Como usuario
  Deseo ver los recibos que ya escaneé anteriormente
  Para reutilizarlos sin volver a fotografiarlos

#-------------------------------------------------------------------------------------------
Scenario Outline: Visualización del historial

    Given el usuario escaneó su "<documento>" el "<fecha_escaneo>"
    When busca en "Mis documentos"
    Then el sistema muestra "<documento>" en la lista con la fecha "<fecha_escaneo>"

    Examples: Datos de entrada y salida
      | documento          | fecha_escaneo |
      | Recibo de luz      | 03/11/2026    |
      | Recibo de agua     | 05/11/2026    |
      | Recibo de internet | 12/11/2026    |


#-------------------------------------------------------------------------------------------
Scenario: Historial vacío

    Given el usuario nunca escaneó un documento
    When ingresa a "Mis documentos"
    Then el sistema muestra un mensaje indicando que aún no hay documentos guardados


#-------------------------------------------------------------------------------------------
Scenario Outline: Eliminar un documento

    Given el usuario ya no necesita su "<documento>" escaneado el "<fecha_escaneo>"
    When lo selecciona y presiona "Eliminar"
    Then el sistema lo retira del historial y muestra el mensaje "<mensaje>"

    Examples: Datos de entrada y salida
      | documento       | fecha_escaneo | mensaje                                        |
      | Recibo de luz   | 03/11/2026    | Quitamos tu recibo de luz de Mis documentos.   |
      | Recibo de cable | 18/11/2026    | Quitamos tu recibo de cable de Mis documentos. |
