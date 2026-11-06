Feature: US-18 - Alerta de imagen ilegible
  Como usuario
  Deseo que la app me avise si la foto no se ve bien
  Para volver a tomarla antes de continuar

#-------------------------------------------------------------------------------------------
Scenario: Imagen borrosa

    Given el usuario fotografía un recibo borroso
    When el sistema intenta procesar la imagen
    Then muestra un mensaje pidiendo repetir la foto


#-------------------------------------------------------------------------------------------
Scenario: Imagen con poca luz

    Given la fotografía se tomó en un ambiente oscuro
    When el sistema no logra leer el texto
    Then sugiere tomar la foto con mejor iluminación


#-------------------------------------------------------------------------------------------
Scenario: Foto repetida válida

    Given el usuario tomó una nueva fotografía tras el aviso
    When el sistema la procesa
    Then extrae los datos correctamente
