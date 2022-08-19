# Recorrido mvp Proyecto en Ruby On Rails

En el siguiente repositorio encontrara los archivos necesarios para ejecutar la parte del API del projecto de monitoreo

## Estructura

El proyecto tiene la siguiente estructura

```
RECORRIDO-MVP
│   README.md
│   .rubocop.yml
│   .ruby-version
│   Gemfile
│   Gemfile.lock
│
└─── app
    └───controllers
        │   availability_schedules_controller.rb
        │   contrats_controller.rb
        │   monitoring_schedules_controller.rb
        │   monitoring_services_controller.rb
        │   users_controller.rb
    └───models
        │   availability_schedule.rb
        │   contrat.rb
        │   monitoring_schedule.rb
        │   monitoring_service.rb
        │   users_controller.rb
    └───services
        │   schedule_logic.rb
└─── bin
└─── config
└─── db
└─── lib
└─── log
└─── public
└─── spect
└─── storage
└─── test
└─── temp
└─── vendor

```

La estructura mostrada anteriormente ha sido acortada a los archivos que se utilizan en el project.

### Files

##### schedule_logic.rb

Es el archivo principal, es el encargado de la asignación de las disponibildiades a la vista final, esta es una clase la cual se inicia con `week`, `services` y se declaran dos variables a utilizar entre los métodos `max_available` y `schedules`

El algoritmo implementado trata de buscar el usuario que tiene mayor disponibilidad por día a partir de este comienza a evaluar los espacios al rededor y deja de lado a este usuario.

##### availability_schedules_controller

En este se utilizo para la creación de cada record cuando una persona indica que esta disponible la ruta

##### monitoring_schedules_controller

En este se utilizo para el despliegue de la vista final con los servicios

##### monitoring_services_controller

Brinda una estructura para la configuración de services en los dropdowns

## Ejecución

Al igual que cualquier proyecto de Ruby on Rails es necesario tener instalado Ruby o bien manejar con RVM su instalación.

Las versiones de ruby y rails para estre proyecto son:

- Ruby `ruby-3.0.0`
- Rails `Rails 7.0.3.1`

En dado caso este proyecto tiene conectado un RDS con postgres el cual ya tiene una base de datos creada, si usted quisiera probar en su local debe seguir los siguientes pasos:

Instalar las gemas necesarias para el funcinamiento del proyecto

```console
bundle install
```

Crear la base de datos

```console
rails db:create
```

Correr las migraciones

```console
rails db:migrate
```

Llegar las tablas creadas con sus respectivos seeders

```console
rails db:seed
```

A su vez se le provee el siguiente script `development.sh` para correr los pasos anteriores usando solo un comando

```console
sh .dev-scripts/development.sh
```

Después de la instalación recuerde tener un servidor de postgres previamente configurado e instalado. A su vez crear las credenciales necesarias para correr. Para mayor información [How to use PostgreSQL with your Ruby on Rails application ](https://www.ionos.com/digitalguide/server/know-how/use-postgresql-with-ruby-on-rails-on-ubuntu/)
