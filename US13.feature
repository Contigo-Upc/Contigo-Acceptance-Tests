Feature: US-13 - Apoyo visual con íconos e imágenes
  Como persona con baja alfabetización
  Deseo que cada instrucción tenga una imagen o ícono asociado
  Para entender qué hacer sin depender solo del texto

#-------------------------------------------------------------------------------------------
Scenario: Visualización del ícono

    Given el sistema muestra una instrucción
    When el usuario visualiza la pantalla
    Then aparece un ícono o imagen relacionado con la acción solicitada


#-------------------------------------------------------------------------------------------
Scenario: Imagen no disponible por conexión

    Given el usuario tiene conexión limitada
    When el sistema no puede cargar la imagen
    Then muestra un ícono alternativo almacenado localmente


#-------------------------------------------------------------------------------------------
Scenario: Ampliar la imagen

    Given el usuario quiere ver la imagen con más detalle
    When la toca
    Then el sistema la muestra en pantalla completa
