Feature: US-13 - Apoyo visual con íconos e imágenes
  Como persona con baja alfabetización
  Deseo que cada instrucción tenga una imagen o ícono asociado
  Para entender qué hacer sin depender solo del texto

#-------------------------------------------------------------------------------------------
Scenario Outline: Visualización del ícono

    Given el sistema muestra la instrucción "<instruccion>"
    When el usuario visualiza la pantalla
    Then aparece el apoyo visual "<apoyo_visual>" relacionado con la acción solicitada

    Examples: Datos de entrada y salida
      | instruccion                   | apoyo_visual           |
      | Ten tu recibo a la mano       | ilustración de recibos |
      | Busca tu número de suministro | ícono de lupa          |
      | Saca tu cita                  | ícono de calendario    |
      | Anota tus datos               | ícono de lápiz         |


#-------------------------------------------------------------------------------------------
Scenario Outline: Imagen no disponible por conexión

    Given el usuario tiene conexión limitada en la instrucción "<instruccion>"
    When el sistema no puede cargar la imagen "<imagen>"
    Then muestra el "<icono_alternativo>" almacenado localmente

    Examples: Datos de entrada y salida
      | instruccion             | imagen                 | icono_alternativo  |
      | Ten tu recibo a la mano | ilustración de recibos | ícono de documento |
      | Elige cómo vas a pagar  | ilustración de pagos   | ícono de tarjeta   |
      | Reúne tus documentos    | ilustración del DNI    | ícono de DNI       |


#-------------------------------------------------------------------------------------------
Scenario Outline: Ampliar la imagen

    Given el usuario quiere ver con más detalle la imagen de la instrucción "<instruccion>"
    When la toca
    Then el sistema muestra la "<imagen>" en pantalla completa

    Examples: Datos de entrada y salida
      | instruccion             | imagen                 |
      | Ten tu recibo a la mano | ilustración de recibos |
      | Elige cómo vas a pagar  | ilustración de pagos   |
      | Reúne tus documentos    | ilustración del DNI    |
