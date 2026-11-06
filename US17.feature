Feature: US-17 - Corrección manual de datos extraídos
  Como usuario
  Deseo corregir un dato mal leído por la app
  Para asegurarme de que la información sea correcta

#-------------------------------------------------------------------------------------------
Scenario: Corrección exitosa

    Given el sistema extrajo un dato del recibo
    When el usuario lo detecta como incorrecto y lo edita
    Then el sistema guarda el valor corregido


#-------------------------------------------------------------------------------------------
Scenario: Campo dejado vacío

    Given el usuario borra un campo obligatorio al corregirlo
    When intenta continuar
    Then el sistema le pide completar el campo antes de avanzar


#-------------------------------------------------------------------------------------------
Scenario: Corrección de varios campos

    Given el usuario detecta más de un dato incorrecto
    When los corrige todos y confirma
    Then el sistema guarda todos los cambios correctamente
