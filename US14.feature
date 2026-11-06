Feature: US-14 - Retroceder a un paso anterior
  Como usuario
  Deseo poder volver al paso anterior si me equivoqué
  Para corregir sin reiniciar todo el trámite

#-------------------------------------------------------------------------------------------
Scenario: Retroceso con datos conservados

    Given el usuario está en el paso 3 de un trámite
    When presiona "Atrás"
    Then el sistema regresa al paso 2 conservando los datos ya ingresados


#-------------------------------------------------------------------------------------------
Scenario: Retroceso desde el primer paso

    Given el usuario está en el primer paso del trámite
    When presiona "Atrás"
    Then el sistema lo regresa al menú principal


#-------------------------------------------------------------------------------------------
Scenario: Retroceso tras un error

    Given el usuario retrocede después de haber recibido un mensaje de error
    When vuelve al paso anterior
    Then el sistema conserva los datos válidos ya ingresados
