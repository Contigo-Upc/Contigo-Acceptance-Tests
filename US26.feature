Feature: US-26 - Indicador de progreso del trámite
  Como usuario con poca experiencia digital
  Deseo ver en qué paso me encuentro y cuántos faltan
  Para no sentir que estoy perdido durante el proceso

#-------------------------------------------------------------------------------------------
Scenario Outline: Visualización del indicador

    Given el usuario inició el trámite "<tramite>" de varios pasos
    When avanza a la etapa "<etapa>"
    Then el sistema muestra de forma permanente el indicador "<indicador>"

    Examples: Datos de entrada y salida
      | tramite            | etapa                         | indicador   |
      | Pago de luz        | Busca tu número de suministro | Paso 2 de 7 |
      | Renovación de DNI  | Saca tu cita                  | Paso 3 de 7 |
      | Consulta de deudas | Anota tus datos               | Paso 4 de 6 |


#-------------------------------------------------------------------------------------------
Scenario Outline: Actualización al avanzar

    Given el usuario completó el paso "<paso_actual>" del trámite "<tramite>"
    When presiona "Siguiente"
    Then el indicador se actualiza mostrando la nueva posición "<indicador>"

    Examples: Datos de entrada y salida
      | tramite            | paso_actual                     | indicador   |
      | Pago de agua       | Ten tu recibo a la mano         | Paso 2 de 7 |
      | Pago de internet   | Entra a la página de tu empresa | Paso 4 de 7 |
      | Consulta de deudas | Escribe tu número de DNI        | Paso 4 de 6 |


#-------------------------------------------------------------------------------------------
Scenario Outline: Actualización al retroceder

    Given el usuario regresa desde el paso "<paso_actual>" del trámite "<tramite>" con "<boton>"
    When el sistema muestra el paso previo
    Then el indicador refleja nuevamente "<indicador>" sin alterar el total de pasos

    Examples: Datos de entrada y salida
      | tramite            | paso_actual            | boton          | indicador   |
      | Pago de luz        | Elige cómo vas a pagar | Anterior       | Paso 3 de 7 |
      | Renovación de DNI  | Revisa tus datos       | Corregir datos | Paso 5 de 7 |
      | Consulta de deudas | Revisa tus datos       | Corregir datos | Paso 4 de 6 |
