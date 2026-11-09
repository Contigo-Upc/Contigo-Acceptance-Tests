Feature: US-14 - Retroceder a un paso anterior
  Como usuario
  Deseo poder volver al paso anterior si me equivoqué
  Para corregir sin reiniciar todo el trámite

#-------------------------------------------------------------------------------------------
Scenario Outline: Retroceso con datos conservados

    Given el usuario está en el paso "<paso_actual>" del trámite "<tramite>" y ya escribió "<dato>"
    When presiona "<boton>"
    Then el sistema regresa al paso "<paso_anterior>" conservando el dato "<dato>"

    Examples: Datos de entrada y salida
      | tramite           | paso_actual | dato     | boton          | paso_anterior |
      | Pago de luz       | Paso 6 de 7 | 3058214  | Corregir datos | Paso 5 de 7   |
      | Pago de agua      | Paso 6 de 7 | 42.60    | Corregir datos | Paso 5 de 7   |
      | Renovación de DNI | Paso 5 de 7 | 45872136 | Anterior       | Paso 4 de 7   |


#-------------------------------------------------------------------------------------------
Scenario Outline: Retroceso desde el primer paso

    Given el usuario está en el primer paso "<instruccion>" del trámite "<tramite>"
    When presiona "Anterior"
    Then el sistema lo regresa al menú principal

    Examples: Datos de entrada
      | tramite            | instruccion              |
      | Pago de luz        | Ten tu recibo a la mano  |
      | Pago de cable      | Busca tu recibo de cable |
      | Consulta de deudas | Ten tu DNI a la mano     |


#-------------------------------------------------------------------------------------------
Scenario Outline: Retroceso tras un error

    Given el usuario recibió el mensaje de error "<mensaje>" en el paso "Anota tus datos"
    When vuelve al paso anterior
    Then el sistema conserva el dato válido "<dato_valido>" en el campo "<campo_valido>"

    Examples: Datos de entrada y salida
      | mensaje                                               | campo_valido         | dato_valido |
      | Escribe el monto solo con números. Ejemplo: 85.50     | Número de suministro | 3058214     |
      | Escribe 7 u 8 números, sin espacios ni letras.        | Monto a pagar (S/)   | 85.40       |
      | Escribe entre 6 y 10 números, sin espacios ni letras. | Monto a pagar (S/)   | 79.90       |
