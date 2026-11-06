Feature: US-09 - Acceso a trámites frecuentes
  Como usuario
  Deseo tener acceso directo a los trámites que realizo seguido
  Para ahorrar tiempo

#-------------------------------------------------------------------------------------------
Scenario: Trámite marcado como frecuente

    Given el usuario marcó un trámite como frecuente
    When ingresa a la pantalla principal
    Then el sistema lo muestra en la sección "Frecuentes"


#-------------------------------------------------------------------------------------------
Scenario: Quitar un trámite de frecuentes

    Given el usuario tiene un trámite en frecuentes
    When lo desmarca
    Then el sistema lo retira de esa sección


#-------------------------------------------------------------------------------------------
Scenario: Sección vacía

    Given el usuario es nuevo y no marcó ningún trámite
    When revisa la sección "Frecuentes"
    Then el sistema muestra un mensaje invitando a marcar trámites
