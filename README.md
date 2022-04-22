# Test grupo nach
comparto la prueba solicitada por Rosalba balbuena

# Título del Proyecto TestNach2022 -> respuestas del pdf adicionales

6.- Explique el ciclo de vida de un view controller.
R: viewdidload -> se carga en memoria antes de iniciar la vista.
  viewWillAppear -> es cuando la vista va a aparecer
  viewDidAppear -> la vista ya aparecio, justo despues de haber haber ejecutado el willAppear
  viewWillDisappear -> notifica cuando la vista va a ser removida
  viewDidDisappear -> la vista ya desaparecio, justo despues de haber llamado el didAppear del controlador que aparecio.
  
7.- Explique el ciclo de vida de una aplicación.
R: Una aplicacion puede tener N scenes, y las scenes pueden tener diferentes view controllers.
sceneDidBecomeActive -> llama a la scene cuando passa de un estado inactivo a activo
sceneWillResignActive -> llama la scene cuando se va a mover de un estado activo a inactivo
sceneWillEnterForeground -> llama la scene cuando se va mover de un background a un foreground
sceneDidEnterBackground -> caso contrario al anterior

8.- En que casos se usa un weak, un strong y un unowned.
R: las variables weak no generan un contador por lo que el RCA las puede liberar cuando no se encuentre en uso, una variable strong genera un contador por lo que si se encuentra referenciada a en otro objeto esta no puede ser liberada de memoria hasta eliminar ambas referencias.

9.-  ¿Qué  es el ARC?
R: es el contador de memoría, se puede interpretar como un garbage colector, es el encargado de liberar la memoria que no se encuentra en uso.

Punto Extra
Imagen 1:
1.- el color se mostaría en color rojo.

Imagen 2:
1.- asumiendo el codigo de la imagen es que no se declara la variable window, por lo que se generaría un error.
2.- el nombre del storyboard usualmete se genera automaticamente con M mayuscula, esto si no se modifico igual en el info.plist a minuscula, de lo contrario generaria otro error
3.- asumiendo que no se generan errores, el color se mostraria blanco.

## Comenzando 🚀
### Arquitectura utilizada MVC 
se utilizo una arquitectura en MVC, ya que el alcance de la aplicación era corto y no requeria mucho negocio adicional cómo para implementar una arquitectura MVVM, tampoco se utilizo una arquitectura VIPER ya que tampoco requeria de muchas pantallas para implementar.

### Librerias externas utilizadas 🔧

Para este proyecto no se utilizaron ningunas librerias de terceros, se pudo haber implementado AlamoFire para el consumo de servicios, pero se utilizo el consumo de manera nativa con UrlSessions, para la presentacion de imagenes se pudo usar KingFisher pero no era soportado por iOS 10.

### Si alguno de los puntos solicitados no los concluiste, menciona por qué
la parte de los headers cutomized, pude haber implementado un header customized con un uitableviewcell

## Construido con 🛠️

Xcode
URLSessions
StoryBoards
xibs
protocolos y delegados

## Versionado XCode📌
Xcode 13.2.1

## Autores ✒️

_Menciona a todos aquellos que ayudaron a levantar el proyecto desde sus inicios_

* **Luis Angel Rodríguez Angeles** - *Trabajo Inicial* - [Mougly64](https://github.com/Mougly64)

## Licencia 📄

Este proyecto está bajo la Licencia (Luan Road)
