Feature: US-16 - Escaneo de recibo por foto
  Como usuario
  Deseo tomar una foto de mi recibo
  Para que la app identifique los datos automáticamente

#-------------------------------------------------------------------------------------------
Scenario Outline: Escaneo exitoso

    Given el usuario selecciona "Escanear mi recibo" para su recibo de "<servicio>"
    When toma la fotografía
    Then el sistema muestra "¡Leímos tu recibo!" con el número "<numero>", el monto "<monto>" y la fecha "<fecha_vencimiento>"

    Examples: Datos de salida
      | servicio | numero   | monto    | fecha_vencimiento |
      | Luz      | 1234567  | S/ 85.40 | 20/11/2026        |
      | Agua     | 7654321  | S/ 42.60 | 24/11/2026        |
      | Internet | 45678901 | S/ 79.90 | 02/12/2026        |


#-------------------------------------------------------------------------------------------
Scenario Outline: Extracción parcial

    Given la foto del recibo solo permite leer "<datos_leidos>"
    When el sistema procesa la imagen
    Then completa los campos leídos, deja en blanco "<campo_vacio>" y muestra el aviso "<aviso>"

    Examples: Datos de entrada y salida
      | datos_leidos                      | campo_vacio          | aviso                         |
      | número 1234567 y monto S/ 85.40   | Fecha de vencimiento | No pudimos detectar la fecha  |
      | número 7654321 y fecha 25/11/2026 | Monto a pagar (S/)   | No pudimos detectar el monto  |
      | monto S/ 79.90 y fecha 28/11/2026 | Número de contrato   | No pudimos detectar el número |


#-------------------------------------------------------------------------------------------
Scenario: Cancelar el escaneo

    Given el usuario tomó la foto
    When decide no continuar y presiona "Cancelar"
    Then el sistema descarta la imagen sin guardar datos
