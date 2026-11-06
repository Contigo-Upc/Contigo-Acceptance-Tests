Feature: US-44 - Textos alternativos
  Como usuario con dificultades para identificar elementos gráficos
  Deseo que los elementos visuales importantes cuenten con información alternativa
  Para comprender su función y utilizar la plataforma correctamente

#-------------------------------------------------------------------------------------------
Scenario: Visualización de texto alternativo

    Given el usuario se encuentra en una pantalla que contiene un elemento visual importante
    When interactúa con dicho elemento
    Then el sistema proporciona una descripción alternativa que permite comprender su función o contenido


#-------------------------------------------------------------------------------------------
Scenario: Elemento visual sin información relevante

    Given existe un elemento visual que no aporta información necesaria para completar el trámite
    When el usuario navega por la interfaz
    Then dicho elemento no interfiere con la comprensión del contenido principal


#-------------------------------------------------------------------------------------------
Scenario: Comprensión de la función del elemento

    Given el usuario necesita identificar la función de un elemento visual
    When accede a su información alternativa
    Then puede comprender qué representa o qué acción permite realizar
