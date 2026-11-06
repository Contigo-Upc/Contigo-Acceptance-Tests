Feature: US-42 - Ajuste de contraste
  Como usuario con dificultades para distinguir los elementos visuales
  Deseo ajustar el contraste de la interfaz
  Para identificar con mayor facilidad los textos y componentes de Contigo

#-------------------------------------------------------------------------------------------
Scenario: Activar un contraste adecuado

    Given el usuario se encuentra utilizando Contigo
    When selecciona una opción de contraste
    Then el sistema modifica el contraste de la interfaz para mejorar la diferenciación entre textos, fondos y elementos interactivos


#-------------------------------------------------------------------------------------------
Scenario: Visualización correcta de los elementos

    Given el usuario ha activado un modo de contraste
    When navega por las diferentes pantallas de Contigo
    Then los textos y elementos principales permanecen claramente diferenciados y legibles


#-------------------------------------------------------------------------------------------
Scenario: Desactivar el ajuste

    Given el usuario tiene activado un modo de contraste
    When selecciona la opción para volver al contraste predeterminado
    Then la interfaz recupera su configuración visual original
