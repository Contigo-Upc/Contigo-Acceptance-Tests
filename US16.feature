Feature: US-16 - Escaneo de recibo por foto
  Como usuario
  Deseo tomar una foto de mi recibo
  Para que la app identifique los datos automáticamente

#-------------------------------------------------------------------------------------------
Scenario: Escaneo exitoso

    Given el usuario selecciona "Escanear recibo"
    When toma la fotografía
    Then el sistema procesa la imagen y extrae número de suministro, monto y fecha


#-------------------------------------------------------------------------------------------
Scenario: Extracción parcial

    Given la foto solo permite identificar algunos datos
    When el sistema procesa la imagen
    Then completa los campos identificados y deja en blanco los que no pudo leer, señalándolo


#-------------------------------------------------------------------------------------------
Scenario: Cancelar el escaneo

    Given el usuario tomó la foto
    When decide no continuar y presiona "Cancelar"
    Then el sistema descarta la imagen sin guardar datos
