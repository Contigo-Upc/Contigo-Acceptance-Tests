Feature: US-10 - Filtrado de trámites por categoría
  Como usuario
  Deseo filtrar los trámites por tipo (pagos, consultas, documentos)
  Para encontrar más rápido lo que busco

#-------------------------------------------------------------------------------------------
Scenario Outline: Filtro por categoría "Pagos"

    Given el usuario está en el menú principal
    When selecciona la categoría "Pagos"
    Then el sistema muestra solo los trámites de esa categoría, entre ellos "<tramite>" con el texto "<resumen>"

    Examples: Datos de salida
      | tramite          | resumen                                 |
      | Pago de luz      | Paga tu recibo de luz desde el celular. |
      | Pago de agua     | Paga tu recibo de agua paso a paso.     |
      | Pago de internet | Paga tu internet sin complicaciones.    |
      | Pago de cable    | Paga tu servicio de cable con calma.    |


#-------------------------------------------------------------------------------------------
Scenario Outline: Filtro sin resultados

    Given la categoría "<categoria>" no tiene trámites disponibles
    When el usuario la selecciona
    Then el sistema muestra el mensaje "<mensaje>"

    Examples: Datos de entrada y salida
      | categoria | mensaje                                                       |
      | Salud     | Todavía no hay trámites de Salud. Pronto agregaremos más.     |
      | Pensiones | Todavía no hay trámites de Pensiones. Pronto agregaremos más. |
      | Bancos    | Todavía no hay trámites de Bancos. Pronto agregaremos más.    |


#-------------------------------------------------------------------------------------------
Scenario Outline: Quitar filtro aplicado

    Given el usuario tiene activo el filtro "<categoria>", que muestra "<mensaje_filtro>"
    When presiona "Todos"
    Then el sistema muestra nuevamente todos los trámites disponibles con el mensaje "<mensaje_todos>"

    Examples: Datos de entrada y salida
      | categoria  | mensaje_filtro        | mensaje_todos         |
      | Pagos      | Mostrando 4 trámites. | Mostrando 6 trámites. |
      | Documentos | Mostrando 1 trámite.  | Mostrando 6 trámites. |
      | Consultas  | Mostrando 1 trámite.  | Mostrando 6 trámites. |
