Feature: US-34 - Intervención del Asistente IA ante fallos repetitivos
  Como adulto mayor
  Deseo que el asistente virtual me ofrezca ayuda automáticamente si me equivoco varias veces en el mismo paso
  Para no frustrarme y evitar abandonar el trámite

#-------------------------------------------------------------------------------------------
Scenario: Ayuda tras múltiples errores

    Given el usuario ingresa un dato erróneo 3 veces consecutivas
    When ocurre el tercer fallo
    Then el sistema despliega automáticamente un mensaje del Asistente IA preguntando: "¿Necesitas ayuda con este paso?"


#-------------------------------------------------------------------------------------------
Scenario: Aceptación de ayuda

    Given el asistente ofreció ayuda proactiva
    When el usuario selecciona "Sí"
    Then el asistente inicia un diálogo explicando específicamente qué dato se requiere y cómo encontrarlo en su documento físico


#-------------------------------------------------------------------------------------------
Scenario: Rechazo de ayuda

    Given el asistente ofrece ayuda proactiva
    When el usuario selecciona "No, gracias"
    Then la ventana del asistente se minimiza y permite al usuario seguir intentándolo
