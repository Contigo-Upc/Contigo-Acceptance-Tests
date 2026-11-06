Feature: US-28 - Verificación de datos antes de realizar el trámite
  Como usuario que teme equivocarse
  Deseo revisar todos los datos que reuní durante la guía
  Para tenerlos correctos antes de ingresarlos en la plataforma oficial

#-------------------------------------------------------------------------------------------
Scenario: Visualización del resumen

    Given el usuario completó todos los pasos de la guía
    When llega a la etapa final
    Then el sistema muestra un resumen con todos los datos reunidos durante el proceso


#-------------------------------------------------------------------------------------------
Scenario: Corrección desde el resumen

    Given el usuario detecta un dato incorrecto en el resumen
    When toca ese dato
    Then el sistema lo lleva al paso correspondiente conservando el resto de la información


#-------------------------------------------------------------------------------------------
Scenario: Datos listos para usar

    Given el usuario revisó y validó todos los datos
    When presiona "Listo"
    Then el sistema le permite copiar los datos y le indica dónde continuar el trámite
