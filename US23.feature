Feature: US-23 - Explicación de un término técnico
  Como usuario
  Deseo tocar una palabra que no entiendo
  Para que me expliquen su significado sin salir del trámite

#-------------------------------------------------------------------------------------------
Scenario: Explicación mostrada

    Given el sistema muestra un término técnico subrayado
    When el usuario lo toca
    Then aparece una explicación breve en lenguaje cotidiano


#-------------------------------------------------------------------------------------------
Scenario: Solicitud de mayor detalle

    Given el usuario no entendió la explicación breve
    When toca "Explicar más"
    Then el sistema amplía la explicación con un ejemplo


#-------------------------------------------------------------------------------------------
Scenario: Término sin definición disponible

    Given un término no tiene una explicación registrada
    When el usuario lo toca
    Then el sistema muestra un mensaje genérico y ofrece derivar la consulta al asistente
