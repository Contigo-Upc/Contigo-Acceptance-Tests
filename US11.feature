Feature: US-11 - Instrucciones una etapa a la vez
  Como usuario con poca experiencia digital
  Deseo ver una sola instrucción por pantalla
  Para no sentirme abrumado

#-------------------------------------------------------------------------------------------
Scenario Outline: Visualización de la primera etapa

    Given el usuario inició el trámite "<tramite>"
    When el sistema presenta el primer paso
    Then se muestra únicamente la instrucción "<instruccion>" con su apoyo visual y el avance "<avance>"

    Examples: Datos de entrada y salida
      | tramite            | instruccion                 | avance      |
      | Pago de luz        | Ten tu recibo a la mano     | Paso 1 de 7 |
      | Pago de internet   | Busca tu recibo de internet | Paso 1 de 7 |
      | Renovación de DNI  | Reúne tus documentos        | Paso 1 de 7 |
      | Consulta de deudas | Ten tu DNI a la mano        | Paso 1 de 6 |


#-------------------------------------------------------------------------------------------
Scenario Outline: Avance a la siguiente etapa

    Given el usuario completó la instrucción del paso "<paso_actual>" del trámite "<tramite>"
    When presiona "Siguiente"
    Then el sistema muestra solo la instrucción "<siguiente_instruccion>" del paso "<paso_siguiente>"

    Examples: Datos de entrada y salida
      | tramite           | paso_actual | siguiente_instruccion         | paso_siguiente |
      | Pago de luz       | Paso 1 de 7 | Busca tu número de suministro | Paso 2 de 7    |
      | Pago de agua      | Paso 3 de 7 | Elige cómo vas a pagar        | Paso 4 de 7    |
      | Renovación de DNI | Paso 2 de 7 | Saca tu cita                  | Paso 3 de 7    |


#-------------------------------------------------------------------------------------------
Scenario Outline: Intento de saltar una etapa

    Given el usuario deja vacío el campo "<campo>" en el paso "Anota tus datos" del trámite "<tramite>"
    When presiona "Siguiente"
    Then el sistema muestra el aviso "<aviso>" y el mensaje "<mensaje>" antes de continuar

    Examples: Datos de entrada y salida
      | tramite           | campo                | aviso                                | mensaje                           |
      | Pago de luz       | Número de suministro | Hay un dato que necesita tu atención | Escribe este dato para continuar. |
      | Pago de cable     | Número de contrato   | Hay un dato que necesita tu atención | Escribe este dato para continuar. |
      | Renovación de DNI | Número de DNI        | Hay un dato que necesita tu atención | Escribe este dato para continuar. |
