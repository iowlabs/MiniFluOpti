# MiniFluOpti

Versión mini del proyecto FluOpti. Desarrollo conjunto con equipo docente del Instituto de Ingeniería Biológica UC. 
Este proyecto consiste en un controlador de LEDs configurable por I2C. La placa controla 4 canales controladores de LEDs, por medio de señales PWM generadas *on-board*. Los grupos de LEDs considerado para esta versión son: rojos, verde, azul y blanco. Adicionalmente la placa 
incluye un controlador de *heater* y un par de canales de lectura de sensores de temperatura del tipo termistor.


## Características:

* Voltaje de entrada 12[V].
* 4 Canales de salida LEDs: Rojo, Verde, Azul, Blanco.
* 1 Controlador de heater. Max: 12[V] - 3[A]
* 2 Canales de lector de termistor.
* Voltaje de salida para alimentar Rpi 5[V] 2.5[A] (Raspy 3b+)
* Voltaje en placa 3.3[V] para componentes digitales.
* Voltajes disponibles: 3.3[V] 5[V], 9[V] y 12[V]
* Protocolo de control: I2C (deseado)
 
Dependencias:
* Generador de PWMs PCA9685
* Drivers de corriente IRF740
* Drivers de baja corriente (500mA) ULN2803A
* Lector de termistor MAX6682
* Reguladores de voltaje
* Conversores DC-DC






