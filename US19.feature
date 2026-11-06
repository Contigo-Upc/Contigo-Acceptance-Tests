Feature: US-19 - Extracción de datos desde documentos de identidad
  Como usuario
  Deseo fotografiar mi DNI
  Para que la app complete automáticamente mis datos personales en un trámite

#-------------------------------------------------------------------------------------------
Scenario: Extracción exitosa

    Given un trámite requiere datos del DNI
    When el usuario fotografía el documento
    Then el sistema extrae nombre y número de documento y los completa en el formulario


#-------------------------------------------------------------------------------------------
Scenario: Documento dañado o vencido

    Given el DNI fotografiado está dañado o vencido
    When el sistema intenta procesarlo
    Then muestra un mensaje indicando que no pudo validar el documento


#-------------------------------------------------------------------------------------------
Scenario: Confirmación de datos extraídos

    Given el sistema completó los campos automáticamente
    When el usuario revisa la información
    Then puede confirmar o corregir los datos antes de continuar
