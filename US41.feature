Feature: US-41 - Ajuste del tamaño del texto
  Como usuario con dificultades para leer textos pequeños
  Deseo aumentar o disminuir el tamaño del texto de la interfaz
  Para visualizar la información de Contigo con mayor comodidad

#-------------------------------------------------------------------------------------------
Scenario Outline: Aumentar el tamaño del texto

    Given el usuario se encuentra utilizando Contigo con el texto al "<tamanio_actual>"
    When selecciona la opción "Texto más grande"
    Then el sistema cambia el texto al "<tamanio_nuevo>", con el texto normal de "<texto_normal>" y el título principal de "<titulo_principal>", y la información se mantiene legible

    Examples: Datos de entrada y salida
      | tamanio_actual | tamanio_nuevo | texto_normal | titulo_principal |
      | 100 %          | 125 %         | 17,5 px      | 35 px            |
      | 125 %          | 150 %         | 21 px        | 42 px            |
      | 150 %          | 200 %         | 28 px        | 56 px            |


#-------------------------------------------------------------------------------------------
Scenario Outline: Disminuir el tamaño del texto

    Given el usuario tiene aumentado el tamaño del texto al "<tamanio_actual>"
    When selecciona la opción "Texto más pequeño"
    Then el sistema reduce el texto al "<tamanio_nuevo>", con el texto normal de "<texto_normal>", manteniendo la correcta visualización de la interfaz

    Examples: Datos de entrada y salida
      | tamanio_actual | tamanio_nuevo | texto_normal |
      | 200 %          | 150 %         | 21 px        |
      | 150 %          | 125 %         | 17,5 px      |
      | 125 %          | 100 %         | 14 px        |


#-------------------------------------------------------------------------------------------
Scenario Outline: Mantener la funcionalidad

    Given el usuario ha modificado el tamaño del texto al "<tamanio>"
    When continúa navegando por la pantalla "<pantalla>"
    Then el botón "<boton>" se ve completo y sigue siendo accesible y utilizable

    Examples: Datos de entrada
      | tamanio | pantalla            | boton                  |
      | 125 %   | Inicio              | Preguntar al asistente |
      | 150 %   | Guía de Pago de luz | Siguiente              |
      | 200 %   | Mi perfil           | Cerrar sesión          |
