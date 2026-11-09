Feature: US-09 - Acceso a trámites frecuentes
  Como usuario
  Deseo tener acceso directo a los trámites que realizo seguido
  Para ahorrar tiempo

#-------------------------------------------------------------------------------------------
Scenario Outline: Trámite marcado como frecuente

    Given el usuario marcó el trámite "<tramite>" como frecuente
    When ingresa a la pantalla principal
    Then el sistema lo muestra en la sección "Trámites frecuentes" con el detalle "<detalle>"

    Examples: Datos de entrada y salida
      | tramite            | detalle                 |
      | Pago de luz        | Unos 6 min · Servicios  |
      | Renovación de DNI  | Unos 8 min · Documentos |
      | Consulta de deudas | Unos 4 min · Consultas  |


#-------------------------------------------------------------------------------------------
Scenario Outline: Quitar un trámite de frecuentes

    Given el usuario tiene el trámite "<tramite>" en frecuentes
    When lo desmarca
    Then el sistema lo retira de esa sección y muestra el mensaje "<mensaje>"

    Examples: Datos de entrada y salida
      | tramite           | mensaje                                                  |
      | Pago de agua      | Quitamos «Pago de agua» de tus trámites frecuentes.      |
      | Pago de cable     | Quitamos «Pago de cable» de tus trámites frecuentes.     |
      | Renovación de DNI | Quitamos «Renovación de DNI» de tus trámites frecuentes. |


#-------------------------------------------------------------------------------------------
Scenario: Sección vacía

    Given el usuario es nuevo y no marcó ningún trámite
    When revisa la sección "Trámites frecuentes"
    Then el sistema muestra un mensaje invitando a marcar trámites
