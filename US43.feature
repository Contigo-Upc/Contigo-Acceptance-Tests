Feature: US-43 - Respeto de la configuración del sistema
  Como usuario que ya configuró un tamaño de letra grande en su teléfono
  Deseo que Contigo respete esa configuración
  Para no tener que ajustarla nuevamente dentro de la app

#-------------------------------------------------------------------------------------------
Scenario Outline: La app toma el tamaño configurado

    Given el usuario configuró el tamaño de letra de su teléfono al "<tamanio_telefono>"
    When abre Contigo
    Then la interfaz muestra el texto normal de "<texto_normal>" y el título principal de "<titulo_principal>" sin necesidad de ajustarlo dentro de la app

    Examples: Datos de entrada y salida
      | tamanio_telefono | texto_normal | titulo_principal |
      | 125 %            | 17,5 px      | 35 px            |
      | 150 %            | 21 px        | 42 px            |
      | 200 %            | 28 px        | 56 px            |


#-------------------------------------------------------------------------------------------
Scenario Outline: Escalado hasta el 200 %

    Given el usuario tiene configurado un escalado del "<escalado>"
    When navega por la pantalla "<pantalla>" en un celular de "<ancho_pantalla>" de ancho
    Then puede seguir accediendo a todos los contenidos y funcionalidades sin perder información ni desplazarse horizontalmente

    Examples: Datos de entrada
      | escalado | pantalla     | ancho_pantalla |
      | 150 %    | Inicio       | 360 px         |
      | 200 %    | Mis recibos  | 360 px         |
      | 200 %    | Mis trámites | 412 px         |


#-------------------------------------------------------------------------------------------
Scenario Outline: Mantener la funcionalidad

    Given la interfaz se muestra con el texto ampliado al "<escalado>"
    When el usuario avanza en el trámite "<tramite>"
    Then el "<elemento>" conserva su área táctil mínima de 48 px y sigue siendo utilizable

    Examples: Datos de entrada
      | escalado | tramite           | elemento            |
      | 150 %    | Pago de luz       | botón Siguiente     |
      | 200 %    | Renovación de DNI | campo Número de DNI |
      | 200 %    | Pago de agua      | botón Anterior      |
