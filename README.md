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



## Sending Emails

The emails can be send through the gem `aws-sdk-rails` using the `aws_sdk` delivery method.
All the `action_mailer` configuration can be found at `config/mailer.rb`, which is loaded only on production environments.

All emails should be sent using background jobs, by default we install `sidekiq` for that purpuse.

#### Testing in staging

If you add the `EMAIL_RECIPIENTS=` environmental variable, the emails will be intercepted and redirected to the email in the variable.


## Internal dependencies

### Queue System

For managing tasks in the background, this project uses [Sidekiq](https://github.com/mperham/sidekiq)

## Deployment

This project is pre-configured to be (easily) deployed to Heroku servers, but needs you to have the Potassium binary installed. If you don't, then run:

    $ gem install potassium

Then, make sure you are logged in to the Heroku account where you want to create the app and run

    $ potassium install heroku --force

this will create the app on heroku, create a pipeline and link the app to the pipeline.

You'll still have to manually log in to the heroku dahsboard, go to the new pipeline and 'configure automatic deploys' using Github
You can run the following command to open the dashboard in the pipeline page

    $ heroku pipelines:open

![Hint](https://cloud.githubusercontent.com/assets/313750/13019759/fa86c8ca-d1af-11e5-8869-cd2efb5513fa.png)

Remember to connect each stage to the corresponding branch:

1. Staging -> Master
2. Production -> Production

That's it. You should already have a running app and each time you push to the corresponding branch, the system will (hopefully) update accordingly.

