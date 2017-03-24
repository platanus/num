# CTA.LY

Abreviador de cuentas bancarias

## Objetivos

1. Que una persona nunca tenga que volver a escribir los datos de una cuenta bancaria
2. Que cualquier persona pueda usar datos ya ingresados para hacer una transferencia
3. Que otros servicios puedan consumir los datos de manera automatizada

## Propuesta de funcionamiento:

### Inscripción de cuenta
1. Se registra una cuenta bancaria (`nombre de la persona`, `rut de la persona`, `banco`, `número de cuenta`, `tipo de cuenta?`)
2. Se almacenan los datos y se entrega un link corto para referencia (ie https://cta.ly/aZks87V). Este link identifica de manera unívoca la información ingresada
3. Si el usuario quiere un link personalizado con su correo tiene que verificarlo (ie https://cta.ly/camilo.ignacio@gmail.com)


###  Consumo de información
#### Via browser
- Se muestra una pantalla linda y amigable con la información para que se copie y pegue (idealmente con botones como los de copiar repo de github)

#### Via otra cosa
- Retorna un objeto JSON con los datos

## TODO:
- ¿Qué algoritmo utilizar para transformar esos datos a un string lo más breve posible?
- Hacerlo?


