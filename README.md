# Recorrido mvp Proyecto en Ruby On Rails

En el siguiente repositorio encontrara los archivos necesarios para ejecutar la parte del API del projecto de monitoreo

## Estructura

El proyecto tiene la siguiente estructura

```
RECORRIDO-MVP-VIEWS
│   README.md
│   babel.config.js
│   jsconfig.json
│   package.json
│   vue.config.js
│   yarn.lock.json
│
└─── public
└─── src
    │   App.vue
    │   main.js
        └───assets
        │   alert.png
            └───sass
        └───components
        │   CustomTable.vue
        │   ListTable.vue
        │   MainNav.vue
        └───router
        │   index.js
        └───views
            └───Schedules
            │   AvailabilityView.vue
            │   MonitoringView.vue

```

La estructura mostrada anteriormente ha sido acortada a los archivos que se utilizan en el project.

### Views

##### AvailabilityView.vue

En este archivo se encuentra toda la logica y estrucura de la vista que permite editar la disponibilidad de las personas.

##### MonitoringView.vue

En este archivo se encuentra toda la logica y estrucura de la vista que permite visualizar la disponibilidad de las personas.

##### App.vue

La vista principal contiene un `<router-view>` en el cual se cargan las demás vistas

##### CustomTable.vue y ListTable.vue

Ambos son componentes que le dan estructura a como se despliegan la información en AvailabilityView.vue y MonitoringView.vue

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
