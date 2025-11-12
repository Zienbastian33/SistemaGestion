# 🏥 Sistema de Gestión de Pacientes

Sistema web de gestión de registros de pacientes desarrollado con Ruby on Rails 7. Permite crear, leer, actualizar y eliminar información de pacientes con validaciones robustas y búsqueda inteligente.

[![Ruby Version](https://img.shields.io/badge/Ruby-3.3.6-red.svg)](https://www.ruby-lang.org/)
[![Rails Version](https://img.shields.io/badge/Rails-7.0.7-red.svg)](https://rubyonrails.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database-blue.svg)](https://www.postgresql.org/)

## 📋 Descripción del Proyecto

Sistema de gestión hospitalaria que permite administrar la información de pacientes de manera eficiente y segura. Incluye funcionalidades de registro completo de datos personales, búsqueda por apellido, validaciones de formato para datos chilenos (RUT), y una interfaz intuitiva con Bootstrap.

### ✨ Características Principales

- 📝 **CRUD Completo**: Crear, leer, actualizar y eliminar registros de pacientes
- 🔍 **Búsqueda Inteligente**: Filtrado case-insensitive por apellido
- 🛡️ **Validaciones Robustas**:
  - Formato de RUT chileno (12345678-9 o 12.345.678-9)
  - Validación de email
  - Validación de teléfono
  - Validación de fechas de nacimiento
- 🔒 **Seguridad**: Protección contra SQL Injection
- 📱 **Interfaz Responsive**: Diseño adaptable con Bootstrap
- 🎨 **UX Mejorada**: Mensajes de error claros y feedback visual
- 🌐 **Internacionalización**: Interfaz completamente en español

## 🛠️ Stack Tecnológico

### Backend
- **Ruby** 3.3.6
- **Rails** 7.0.7.2
- **PostgreSQL** (Base de datos)
- **Puma** (Servidor web)

### Frontend
- **Hotwire** (Turbo & Stimulus)
- **Bootstrap** 5 (Framework CSS)
- **Importmap** (Gestión de JavaScript)
- **ERB** (Motor de plantillas)

### Testing
- **Minitest** (Framework de testing)
- **Capybara** (Testing de integración)
- **Selenium WebDriver** (Testing de sistema)

### Herramientas de Desarrollo
- **Faker** (Generación de datos de prueba)
- **Debug** (Debugging)
- **Web Console** (Consola en el navegador)

## 📦 Requisitos Previos

Antes de instalar el proyecto, asegúrate de tener instalado:

- Ruby 3.3.6 o superior
- Rails 7.0.7 o superior
- PostgreSQL 12 o superior
- Node.js (para asset pipeline)
- Git

### Instalación de Dependencias del Sistema

**Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install -y ruby-dev libpq-dev postgresql postgresql-contrib
```

**macOS:**
```bash
brew install postgresql ruby
brew services start postgresql
```

## 🚀 Instalación

### 1. Clonar el Repositorio

```bash
git clone https://github.com/Zienbastian33/FormularioEvaluado.git
cd FormularioEvaluado
```

### 2. Instalar Gemas

```bash
bundle install
```

### 3. Configurar Base de Datos

Edita el archivo `config/database.yml` con tus credenciales de PostgreSQL:

```yaml
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: tu_usuario
  password: tu_contraseña
  host: localhost
```

### 4. Crear y Migrar la Base de Datos

```bash
rails db:create
rails db:migrate
```

### 5. (Opcional) Poblar con Datos de Prueba

```bash
rails db:seed
```

### 6. Iniciar el Servidor

```bash
rails server
```

Visita [http://localhost:3000](http://localhost:3000) en tu navegador.

## 💻 Uso

### Página Principal

Al acceder a la aplicación, verás la lista de todos los pacientes registrados con opciones para:
- **Ver** detalles completos
- **Editar** información
- **Eliminar** registros

### Registrar un Nuevo Paciente

1. Click en "New paciente"
2. Completa el formulario con los siguientes campos:
   - **RUT**: Formato chileno (ej: 12345678-9)
   - **Nombres**: Nombre(s) del paciente
   - **Apellidos**: Apellido(s) del paciente
   - **Dirección**: Domicilio completo
   - **Ciudad**: Ciudad de residencia
   - **Teléfono**: Entre 8 y 15 caracteres
   - **Email**: Correo electrónico válido
   - **Fecha de Nacimiento**: Fecha válida (no futura)
   - **Estado Civil**: Selecciona una opción
   - **Comentarios**: Información adicional (opcional)

3. Click en "Create Paciente"

### Buscar Pacientes

Utiliza el campo de búsqueda en la página principal para filtrar pacientes por apellido. La búsqueda es case-insensitive y busca coincidencias parciales.

### Editar o Eliminar

En la lista de pacientes:
- **Botón Editar** (amarillo): Modificar datos del paciente
- **Botón Eliminar** (rojo): Eliminar registro (con confirmación)
- **Botón Mostrar** (azul): Ver todos los detalles

## 📁 Estructura del Proyecto

```
FormularioEvaluado/
├── app/
│   ├── controllers/
│   │   └── pacientes_controller.rb    # Lógica de negocio
│   ├── models/
│   │   └── paciente.rb                # Modelo con validaciones
│   ├── views/
│   │   ├── layouts/
│   │   │   └── application.html.erb   # Layout principal
│   │   └── pacientes/
│   │       ├── index.html.erb         # Lista de pacientes
│   │       ├── show.html.erb          # Detalle de paciente
│   │       ├── new.html.erb           # Nuevo paciente
│   │       ├── edit.html.erb          # Editar paciente
│   │       ├── _form.html.erb         # Formulario compartido
│   │       └── _paciente.html.erb     # Partial de paciente
│   ├── assets/
│   │   └── stylesheets/               # Estilos CSS
│   └── javascript/                     # JavaScript/Stimulus
├── config/
│   ├── routes.rb                       # Rutas de la aplicación
│   ├── database.yml                    # Configuración de BD
│   └── environments/                   # Configuración por entorno
├── db/
│   ├── migrate/                        # Migraciones de BD
│   └── schema.rb                       # Esquema actual
├── test/                               # Tests
├── Gemfile                             # Dependencias de Ruby
└── README.md                           # Este archivo
```

## ✅ Validaciones Implementadas

### Modelo Paciente

| Campo | Validaciones |
|-------|-------------|
| **RUT** | Presencia, unicidad, formato chileno |
| **Nombres** | Presencia |
| **Apellidos** | Presencia |
| **Dirección** | Presencia |
| **Ciudad** | Presencia |
| **Teléfono** | Presencia, formato, longitud (8-15) |
| **Email** | Presencia, formato válido |
| **Fecha Nacimiento** | Presencia, no futuro, máx 150 años |
| **Estado Civil** | Presencia |

### Formato de RUT Chileno

El sistema acepta los siguientes formatos de RUT:
- `12345678-9`
- `12.345.678-9`
- Dígito verificador: 0-9 o K/k

## 🔒 Seguridad

El sistema implementa las siguientes medidas de seguridad:

- ✅ **Protección SQL Injection**: Uso de `sanitize_sql_like()` en búsquedas
- ✅ **Strong Parameters**: Solo parámetros permitidos en controlador
- ✅ **Índice Único**: Prevención de RUT duplicados a nivel de BD
- ✅ **Validaciones de Formato**: Prevención de datos maliciosos
- ✅ **CSRF Protection**: Protección contra Cross-Site Request Forgery
- ✅ **Turbo Confirmations**: Confirmación en acciones destructivas

## 🧪 Testing

Ejecutar la suite de tests:

```bash
# Todos los tests
rails test

# Tests específicos
rails test:models
rails test:controllers
rails test:system
```

## 🌐 Rutas Principales

| Método HTTP | Ruta | Acción | Descripción |
|-------------|------|--------|-------------|
| GET | `/` | `pacientes#index` | Lista de pacientes |
| GET | `/pacientes` | `pacientes#index` | Lista de pacientes |
| GET | `/pacientes/:id` | `pacientes#show` | Detalle de paciente |
| GET | `/pacientes/new` | `pacientes#new` | Formulario nuevo paciente |
| POST | `/pacientes` | `pacientes#create` | Crear paciente |
| GET | `/pacientes/:id/edit` | `pacientes#edit` | Formulario editar |
| PATCH/PUT | `/pacientes/:id` | `pacientes#update` | Actualizar paciente |
| DELETE | `/pacientes/:id` | `pacientes#destroy` | Eliminar paciente |

## 📊 Base de Datos

### Tabla: pacientes

| Campo | Tipo | Restricciones |
|-------|------|---------------|
| id | bigint | PRIMARY KEY |
| rut | string | NOT NULL, UNIQUE INDEX |
| nombres | string | NOT NULL |
| apellidos | string | NOT NULL |
| direccion | string | NOT NULL |
| ciudad | string | NOT NULL |
| telefono | string | NOT NULL |
| email | string | NOT NULL |
| fecha_nacimiento | date | NOT NULL |
| estado_civil | string | NOT NULL |
| comentarios | text | - |
| created_at | datetime | NOT NULL |
| updated_at | datetime | NOT NULL |

### Índices

- `index_pacientes_on_rut` (UNIQUE)

## 🏗️ Cómo se Construyó el Proyecto

### Fase 1: Scaffolding Inicial (Septiembre 2023)

El proyecto comenzó con la generación de un scaffold de Rails para el modelo Paciente:

```bash
rails new FormularioEvaluado --database=postgresql
cd FormularioEvaluado
rails generate scaffold Paciente rut:string nombres:string apellidos:string \
  direccion:string ciudad:string telefono:string email:string \
  fecha_nacimiento:date estado_civil:string comentarios:text
rails db:create db:migrate
```

Esto generó automáticamente:
- Modelo `Paciente` con migraciones
- Controlador `PacientesController` con acciones CRUD
- Vistas completas para todas las acciones
- Rutas RESTful
- Tests básicos

### Fase 2: Personalización de la Interfaz

Se integró Bootstrap 5 para mejorar la interfaz de usuario:

1. Actualización de vistas con clases Bootstrap
2. Implementación de formularios responsivos
3. Adición de botones con colores semánticos
4. Mejora de tablas y layouts

### Fase 3: Implementación de Validaciones

Se añadieron validaciones robustas al modelo:

```ruby
# Validación básica de presencia
validates :rut, :nombres, :apellidos, presence: true

# Validación de formato RUT chileno
validates :rut, format: { with: /\A\d{7,8}[-][0-9kK]{1}\z/ }

# Validación de email
validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

# Validación personalizada de fecha
validate :fecha_nacimiento_valida
```

### Fase 4: Funcionalidad de Búsqueda

Implementación de búsqueda por apellido:

```ruby
def index
  if params[:apellido].present?
    @pacientes = Paciente.where("apellidos ILIKE ?",
      "%#{sanitize_sql_like(params[:apellido])}%")
  else
    @pacientes = Paciente.all
  end
end
```

### Fase 5: Correcciones de Seguridad (Noviembre 2025)

Auditoría completa de seguridad y mejores prácticas:

1. **Corrección de SQL Injection**: Implementación de `sanitize_sql_like()`
2. **Índice Único en BD**: Migración para prevenir duplicados
3. **Actualización a Rails 7**: Cambio de `method: :delete` a `turbo_method`
4. **Mensajes en Español**: Estandarización de idioma
5. **Validaciones Mejoradas**: Formatos específicos para datos chilenos
6. **Visualización de Errores**: Alert de Bootstrap en formularios

### Fase 6: Optimización y Documentación

- Refactorización de código redundante
- Eliminación de lógica duplicada en controladores
- Documentación completa del proyecto
- Mejora de opciones de estado civil (6 opciones)
- Actualización de Ruby a versión 3.3.6

### Tecnologías y Decisiones de Diseño

**¿Por qué PostgreSQL?**
- Robusto y confiable para aplicaciones en producción
- Soporte excelente para índices únicos y constraints
- Mejor rendimiento en búsquedas ILIKE

**¿Por qué Hotwire en lugar de React/Vue?**
- Menor complejidad de desarrollo
- Experiencia SPA sin JavaScript pesado
- Mejor para aplicaciones CRUD tradicionales
- Mantenimiento más simple

**¿Por qué Bootstrap?**
- Componentes pre-diseñados
- Responsive por defecto
- Documentación extensa
- Rápido prototipado

### Lecciones Aprendidas

1. **Validaciones a Nivel de Modelo Y Base de Datos**: La validación dual previene errores de condiciones de carrera
2. **Seguridad Primero**: Siempre sanitizar inputs del usuario
3. **UX Importa**: Mensajes de error claros mejoran la experiencia
4. **Testing**: Los tests desde el inicio hubieran evitado bugs

## 🤝 Contribución

Las contribuciones son bienvenidas. Para contribuir:

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

### Guía de Estilo

- Seguir convenciones de Ruby on Rails
- Mensajes de commit descriptivos en español
- Tests para nuevas funcionalidades
- Comentarios en código complejo

## 📝 Licencia

Este proyecto es de código abierto y está disponible bajo la licencia MIT.

## 📧 Contacto

**Desarrollador**: Zienbastian33
**Repositorio**: [https://github.com/Zienbastian33/FormularioEvaluado](https://github.com/Zienbastian33/FormularioEvaluado)

---

Desarrollado con ❤️ usando Ruby on Rails
