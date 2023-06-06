# 3D Printer monitoring

This is just for fun project to learn flutter and clean architecture. I want to create simple application to monitor 3D printer status.

## Task

Application for basic 3D printer status monitoring. Splitted into three stages of development. 3D printer status will ve visualized in simple gauge.

Status will show:
- Is printing and other status
- % of current job
- temperatures for bed a nozzle
- Printer name
- Job name
- ETA

### 1. Stage

Monitoring just one 3d printer. Status will be refreshed by button event

#### Use-cases
- User can add printer
- User can remove printer
- User can edit printer (IP address, name)

### 2. Stage

- Monitoring multiple 3d printer.
- Information will be automatically updated.
- Printers will be shown in 2x5 grid - limit to max 10 printers

#### Use-cases

- Use-cases from stage 1
- User can select witch printer wont to edit
- User can select witch printer wont to delete

### 3. Stage

Application should be desktop or web application to be able to run on Raspberry pi

---

## Arch decomposition

Application will follow principles of Clean Architecture

### Entities

- Machine
    - Name
    - IP address
- Job
    - Name
    - % of current status
    - ETA
- Status
    - Is printing
    - bed temperature
    - nozzle temperature

### Use cases and repositories

This is very simple app, uses cases are equal to repository requirements

- add machine
- get machine
- remove machine
- update machine
- getAll machines
- get machine status
- listen status for machine
- listen job for machine

### Repositories implementation

- Local
    - Isar for persistence
- Remote(Moonraker API)
    - Rest API
        - Retrofit
    - Websocket
        - json-rpc

## Presentation

- Each page MUST HAVE own controller
- App will use IoC to join individual layers
- State management will be used

## UI

Platform based flutter UI

- [Gauges](https://pub.dev/packages/syncfusion_flutter_gauges)

## Arch drawing

![architecture decomposition](doc/resources/arch_drawing.png)