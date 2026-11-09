Feature: US-03 - Inicio de sesión simplificado
  Como usuario
  Deseo iniciar sesión con mi número de celular y un código
  Para no tener que recordar contraseñas complejas

#-------------------------------------------------------------------------------------------
Scenario Outline: Código correcto

    Given el usuario ingresa su número de celular "<celular>"
    When recibe e ingresa el código de verificación correcto "<codigo>"
    Then el sistema le da acceso a su cuenta y lo saluda con "<saludo>"

    Examples: Datos de entrada y salida
      | celular     | codigo | saludo        |
      | 987 654 321 | 482915 | ¡Hola, María! |
      | 912 345 678 | 730264 | ¡Hola, Jorge! |
      | 956 111 222 | 159837 | ¡Hola, Lucía! |


#-------------------------------------------------------------------------------------------
Scenario Outline: Código incorrecto

    Given el usuario ingresa por <intento> vez el código de verificación incorrecto "<codigo>"
    When presiona "Verificar"
    Then el sistema muestra "<titulo>" con el mensaje "<mensaje>" y permite reintentar

    Examples: Datos de entrada y salida
      | intento | codigo | titulo                    | mensaje                                               |
      | primera | 111111 | Ese código no es correcto | Revísalo y vuelve a intentarlo. Te quedan 2 intentos. |
      | segunda | 482951 | Ese código no es correcto | Revísalo y vuelve a intentarlo. Te quedan 1 intento.  |


#-------------------------------------------------------------------------------------------
Scenario Outline: Código expirado

    Given pasaron <minutos> minutos desde el envío del código
    When el usuario intenta usarlo
    Then el sistema muestra "<titulo>" con el mensaje "<mensaje>" y ofrece reenviar uno nuevo

    Examples: Datos de entrada y salida
      | minutos | titulo              | mensaje                                                                                    |
      | 6       | Tu código ya venció | Por seguridad, los códigos duran 5 minutos. Toca «Reenviar código» para recibir uno nuevo. |
      | 15      | Tu código ya venció | Por seguridad, los códigos duran 5 minutos. Toca «Reenviar código» para recibir uno nuevo. |
