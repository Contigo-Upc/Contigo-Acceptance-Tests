Feature: US-42 - Ajuste de contraste
  Como usuario con dificultades para distinguir los elementos visuales
  Deseo ajustar el contraste de la interfaz
  Para identificar con mayor facilidad los textos y componentes de Contigo

#-------------------------------------------------------------------------------------------
Scenario Outline: Activar un contraste adecuado

    Given el usuario se encuentra utilizando Contigo con el contraste predeterminado
    When selecciona el modo de contraste "<modo>"
    Then el sistema muestra los textos en "<color_texto>" sobre un fondo "<color_fondo>" y los elementos interactivos con un borde "<borde_botones>"

    Examples: Datos de entrada y salida
      | modo                 | color_texto      | color_fondo    | borde_botones            |
      | Alto contraste       | negro #000000    | blanco #FFFFFF | negro de 3 px            |
      | Fondo oscuro         | blanco #FFFFFF   | negro #121212  | amarillo #F4C430 de 3 px |
      | Amarillo sobre negro | amarillo #F4C430 | negro #000000  | amarillo #F4C430 de 3 px |


#-------------------------------------------------------------------------------------------
Scenario Outline: Visualización correcta de los elementos

    Given el usuario ha activado el modo de contraste "<modo>"
    When navega a la pantalla "<pantalla>"
    Then el elemento "<elemento>" permanece claramente diferenciado y legible

    Examples: Datos de entrada
      | modo                 | pantalla             | elemento                           |
      | Alto contraste       | Inicio               | tarjeta Tienes un trámite a medias |
      | Fondo oscuro         | Mis recibos          | filtro En proceso                  |
      | Amarillo sobre negro | Guía de Pago de agua | botón Siguiente                    |


#-------------------------------------------------------------------------------------------
Scenario Outline: Desactivar el ajuste

    Given el usuario tiene activado el modo de contraste "<modo>"
    When selecciona la opción "Contraste predeterminado"
    Then la interfaz recupera su configuración visual original, con los textos en verde "#1F5C46" sobre fondo blanco "#FFFFFF"

    Examples: Datos de entrada
      | modo                 |
      | Alto contraste       |
      | Fondo oscuro         |
      | Amarillo sobre negro |
