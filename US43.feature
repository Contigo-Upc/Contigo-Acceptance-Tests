Feature: US-43 - Respeto de la configuración del sistema
  Como usuario que ya configuró un tamaño de letra grande en su teléfono
  Deseo que Contigo respete esa configuración
  Para no tener que ajustarla nuevamente dentro de la app

#-------------------------------------------------------------------------------------------
Scenario: La app toma el tamaño configurado

    Given el usuario configuró un tamaño de letra mayor en su teléfono
    When abre Contigo
    Then la interfaz se muestra con ese tamaño sin necesidad de ajustarlo dentro de la app


#-------------------------------------------------------------------------------------------
Scenario: Escalado hasta el 200 %

    Given el usuario tiene configurado un escalado de hasta el 200 %
    When navega por las pantallas de Contigo
    Then puede seguir accediendo a todos los contenidos y funcionalidades sin perder información ni desplazarse horizontalmente


#-------------------------------------------------------------------------------------------
Scenario: Mantener la funcionalidad

    Given la interfaz se muestra con el texto ampliado
    When el usuario avanza en un trámite
    Then los botones y campos conservan su área táctil mínima y siguen siendo utilizables
