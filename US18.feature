Feature: US-18 - Alerta de imagen ilegible
  Como usuario
  Deseo que la app me avise si la foto no se ve bien
  Para volver a tomarla antes de continuar

#-------------------------------------------------------------------------------------------
Scenario Outline: Imagen borrosa

    Given el usuario fotografía un recibo de "<servicio>" borroso
    When el sistema intenta procesar la imagen
    Then muestra el aviso "<aviso>" con el mensaje "<mensaje>"

    Examples: Datos de entrada y salida
      | servicio | aviso                 | mensaje                                                                                          |
      | Luz      | La foto salió borrosa | No pudimos leer tu recibo. Apoya el celular en la mesa, espera a que enfoque y vuelve a tomarla. |
      | Cable    | La foto salió borrosa | No pudimos leer tu recibo. Apoya el celular en la mesa, espera a que enfoque y vuelve a tomarla. |


#-------------------------------------------------------------------------------------------
Scenario Outline: Imagen con poca luz

    Given la fotografía del recibo de "<servicio>" se tomó en un ambiente oscuro
    When el sistema no logra leer el texto
    Then muestra el aviso "<aviso>" con el mensaje "<mensaje>"

    Examples: Datos de entrada y salida
      | servicio | aviso                  | mensaje                                                                                               |
      | Agua     | La foto tiene poca luz | No pudimos leer tu recibo. Busca un lugar con más luz o prende la luz del cuarto, y vuelve a tomarla. |
      | Internet | La foto tiene poca luz | No pudimos leer tu recibo. Busca un lugar con más luz o prende la luz del cuarto, y vuelve a tomarla. |


#-------------------------------------------------------------------------------------------
Scenario Outline: Foto repetida válida

    Given el usuario presionó "Volver a tomar" y tomó una nueva foto de su recibo de "<servicio>"
    When el sistema la procesa
    Then muestra "¡Leímos tu recibo!" con el número "<numero>" y el monto "<monto>"

    Examples: Datos de entrada y salida
      | servicio | numero   | monto    |
      | Luz      | 1234567  | S/ 85.40 |
      | Agua     | 7654321  | S/ 42.60 |
      | Cable    | 23456789 | S/ 59.90 |
