Feature: US-06 - Menú principal con íconos
  Como usuario
  Deseo ver los trámites disponibles como íconos grandes y claros
  Para identificar rápidamente lo que necesito

#-------------------------------------------------------------------------------------------
Scenario: Visualización del menú

    Given el usuario ingresa a la app
    When llega a la pantalla principal
    Then el sistema muestra cada trámite con ícono, imagen y texto breve


#-------------------------------------------------------------------------------------------
Scenario: Menú sin conexión

    Given el usuario no tiene conexión a internet
    When abre la app
    Then el sistema muestra solo los trámites disponibles sin conexión, indicándolo claramente


#-------------------------------------------------------------------------------------------
Scenario: Modo accesibilidad activado

    Given el usuario activó el modo de accesibilidad
    When visualiza el menú principal
    Then los íconos se muestran con etiquetas de texto ampliado
