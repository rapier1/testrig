��    i      d  �   �       	     	  ]   !	  .   	  (   �	  "   �	  '   �	  -   "
  �   P
    �
     �       *     )   F     p     �  B   �  >   �  S   !     u  )   �  2   �     �  �   �  U   �  S   #     w     �  6   �     �     �       /   -  .   ]  #   �     �  <   �  )   	  *   3  )   ^  /   �  .   �     �  .   �  3   )  +   ]  &   �     �  #   �     �            #   )  (   M  #   v  (   �  #   �     �  �   �      �  *   �  �     �   �  �   h             l   4      �  ?   �  :     .   =  9   l  0   �  9   �       *   .  4   Y  %   �  8   �  ;   �  $   )  '   N  *   v  *   �     �  @   �  '        =     W  '   o  '   �  5   �  !   �  M     !   e     �  \   �               '  {   ?     �     �  +   �  4       C  +   ]   i   �   >   �   /   2!  -   b!  /   �!  ?   �!  �    "  |  �"     C$     T$  -   h$  /   �$     �$     �$  G    %  ?   H%  h   �%     �%  5   &  C   C&     �&  �   �&  {   �'  `   (     i(     �(  D   �(     �(  *   �(  )   ')  0   Q)  A   �)  9   �)     �)  M   *  ;   g*  C   �*  8   �*  3    +  D   T+     �+  5   �+  @   �+  .   $,  ,   S,     �,  "   �,     �,     �,     �,  -   -  3   6-  +   j-  (   �-  0   �-     �-     
.  &   /  :   2/  �   m/  �   =0  �   �0     �1     �1  u   �1  &   G2  :   n2  N   �2  7   �2  M   03  5   ~3  5   �3  !   �3  5   4  4   B4  2   w4  G   �4  M   �4  ?   @5  3   �5  0   �5  2   �5     6  R   6  "   q6  "   �6      �6  ,   �6  ,   7  ;   27  2   n7  T   �7  *   �7     !8  �   ;8     �8     �8  +   �8  �   9     �9     �9  9   �9  8   
:     Q           5   V          ^       E   R   	          A       c       D         1   #          -   ;      N   ?          X      )   7       F      2       T   S   C   *   ]       @   `   .   d   :       B           H   
   b                      (   O              3       P   >       e       J       W   [      !          +   &                 M           _   '   a   U   "           h                   8   L              I      Z   g   K       6   Y   \   i   9   =   ,       4                               G      $      %       0                  /   f   <      -- change password for volume   -- change password for volume, taking password from standard input.
	No prompts are issued.   -- decodes name and prints plaintext version   -- encodes a filename and print result   -- print version number and exit   -- show information (Default command)   -- show undecodable filenames in the volume   --extpass=program	Use external program for password prompt

Example, to mount at ~/crypt with raw storage in ~/.crypt :
    encfs ~/.crypt ~/crypt

   -v, --verbose		verbose: output encfs debug messages
  -i, --idle=MINUTES	Auto unmount after period of inactivity
  --anykey		Do not verify correct key is being used
  --forcedecode		decode data even if an error is detected
			(for filesystems using MAC block headers)
  (NOT supported)
  (using %i:%i:%i)
  -- Supports block sizes of %i to %i bytes  -- Supports key lengths of %i to %i bits  -- block size %i bytes  -- key length %i bits %s (root dir)
  -- displays information about the filesystem, or 
 -------------------------- WARNING --------------------------
 A really old EncFS filesystem was found. 
It is not supported in this EncFS build.
 Block Size: %i bytes Block Size: %i bytes + %i byte MAC header Block Size: %i bytes, including %i byte MAC header Build: encfs version %s Common Options:
  -H			show optional FUSE Mount Options
  -s			disable multithreaded operation
  -f			run in foreground (don't spawn daemon).
			Error messages will be sent to stderr
			instead of syslog.
 Config subversion %i found, but this version of encfs only supports up to version %i. Configuration finished.  The filesystem to be created has
the following properties: Creating new encrypted volume. Directory not created. Each file contains 8 byte header with unique IV data.
 EncFS Password:  Enter current Encfs password
 Enter new Encfs password
 Enter the number corresponding to your choice:  Error decoding volume key, password incorrect
 Error saving modified config file.
 Example: 
%s info ~/.crypt
 Failure generating new volume key! Please report this error. Filename encoding: "%s", version %i:%i:%i Filenames encoded using IV chaining mode.
 Filesystem cipher: "%s", version %i:%i:%i For more information, see the man page encfs(1) Found %i invalid file. Found %i invalid files. In directory %s: 
 Incorrect number of arguments for command "%s" Internal error: Caught exception from main loop: %s Internal error: Caught unexpected exception Internal error: failed to exec program Internal error: fork() failed Internal error: socketpair() failed Invalid password
 Invalid selection. Key Size: %i bits MAC comparison failure in block %li MAC comparison failure, refusing to read Manual configuration mode selected. Missing one or more arguments, aborting. Name coding interface not supported New Encfs Password:  Now you will need to enter a password for your filesystem.
You will need to remember this password, as there is absolutely
no recovery mechanism.  However, the password can be changed
later using encfsctl.

 Paranoia configuration selected. Passwords did not match, please try again
 Please choose from one of the following options:
 enter "x" for expert configuration mode,
 enter "p" for pre-configured paranoia mode,
 anything else, or an empty line will select standard mode.
?>  Please select a key size in bits.  The cipher you have chosen
supports sizes from %i to %i bits in increments of %i bits.
For example:  Select a block size in bytes.  The cipher you have chosen
supports sizes from %i to %i bytes in increments of %i.
Or just hit enter for the default (%i bytes)
 Selected algorithm "%s" Selected key size:  Sorry, unable to locate cipher for predefined configuration...
Falling through to Manual configuration mode. Standard configuration selected. The directory "%s" does not exist. Should it be created? (y,N)  The filename encoding interface requested is not available The following cipher algorithms are available: The following filename encoding algorithms are available: The requested cipher interface is not available
 The requested filename coding interface is not available
 Unable to create directory:  Unable to find cipher %s, version %i:%i:%i Unable to find nameio interface %s, version %i:%i:%i Unable to find specified cipher "%s"
 Unable to initialize encrypted filesystem - check path.
 Unable to instanciate cipher %s, key size %i, block size %i Unable to load or parse config file
 Unable to locate mount point, aborting. Unable to locate root directory, aborting. Unmounting filesystem %s due to inactivity Usage:
 Usage: %s [options] rootDir mountPoint [-- [FUSE Mount Options]] Using filesystem block size of %i bytes Using key size of %i bits Verify Encfs Password:  Version 3 configuration; created by %s
 Version 4 configuration; created by %s
 Version 5 configuration; created by %s (revision %i)
 Volume Key successfully updated.
 When specifying daemon mode, you must use absolute paths (beginning with '/') Zero length password not allowed
 directory %s does not exist.
 encfs [options] rootDir mountPoint -- [FUSE Mount Options]
valid FUSE Mount Options follow:
 encfs version %s encfsctl version %s filesystem block size:  fuse failed.  Common problems:
 - fuse kernel module not installed (modprobe fuse)
 - invalid options -- see usage message
 getopt error: %i invalid command: "%s" option '--public' ignored for non-root user truncate failure: read %i bytes, partial block of %i Project-Id-Version: Encrypted Filesystem for Linux
Report-Msgid-Bugs-To: https://translations.launchpad.net/encfs/main/+pots/encfs
PO-Revision-Date: 2006-08-14 11:12+0000
Last-Translator: Vicente D. Fernandez <quasar@losplutonianos.net>
Language-Team: Spanish (Spain) <es_ES@li.org>
Language: es_ES
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n != 1;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
X-Rosetta-Version: 0.1
   -- cambiar la contraseña para el volumen   -- cambia contraseña para un volumen cogiendola de la entrada estandar.
	No se mostrara ningun prompt.   -- decodifica el nombre y muestra la versión en texto plano   -- codifica un fichero y muestra el resultado   -- muestra el número de versión y termina   -- mostrar información (comando por defecto)   -- muestra nombres de archivo no decodificables en el volumen   --extpass=program	Usar un programa externo para introducir la contraseña

Ejemplo, para montar en ~/crypt con almacenamiento 'sin formato'(raw format) en ~/.crypt :

    encfs ~/.crypt ~/crypt

   -v, --verbose		Detallado(verbose): Muestra los mensajes de depuración(debug) de encfs
  -i, --idle=MINUTOS	Desmonta automáticamente después de un periodo de inactividad
  --anykey		No verifica que la llave correcta está siendo usada
  --forcedecode	Desencripta(decode) los datos incluso si se detectan errores
			(para sistemas de ficheros que usan cabeceras de bloque MAC)
  (NO soportado)
  (usando %i:%i:%i)
  Soporta bloques de tamaño %i hasta %i bytes  -- Soporta claves de longitud %i hasta %i bits  Tamaño de bloque %i bytes  -- longitud de clave %i bits %s (root dir)
  -- muestra informacion sobre el sistema de ficheros o 
 ----------------------- ADVERTENCIA --------------------------
 Un sistema de ficheros de un EncFS antiguo fue encontrado. 
No esta soportado en esta version de EncFS.
 Tamaño de Bloque: %i bytes Tamaño de Bloque: %i bytes + %i byte de cabecera MAC Tamaño de Bloque: %i bytes, incluyendo %i bytes de la cabecera MAC Versión: encfs versión %s Opciones comunes:
  -H			muestra opciones de montaje FUSE opcionales
  -s			deshabilita las operaciones multithread
  -f			ejecuta en el frente (no crea al daemon).
Los mensajes de error serán enviados a stderr
en vez de a syslog.
 Se ha encontrado la sub-versión %i de configuración, pero esta versión de encfs no acepta versiones posteriores a la %i. Configuración finalizada. El sistema de ficheros a ser creado tiene
las siguientes propiedades: Creando nuevo volumen cifrado. No se creó el directorio. Cada fichero contiene una cabecera de 8 bytes con datos IV únicos.
 Contraseña EncFS:  Introduzca la contraseña actual de Encfs
 Introduzca la nueva contraseña de Encfs
 Teclee el numero correspondiente a su eleccion:  Error decodificando la llave del volumen, contraseña incorrecta
 Error guardando el fichero de configuración modificado.
 Ejemplo:
%s info ~/.crypt
 Fallo generando una nueva llave del volument!. por favor, reporta este error. Codificacion del nombre de fichero: "%s", versión %i:%i:%i Nombres de fichero encodeados usando el modo IV de encadenamiento.
 Cifrado del sistema de ficheros: "%s", versión %i:%i:%i Para mas información, mire la página man encfs(1) Encontrado %i fichero inválido. Encontrados %i ficheros inválidos. En directorio %s: 
 Número incorrecto de argumentos para el comando "%s" Error interno: Capturada excepción desde el bucle principal: %s Error interno: Capturada excepción inesperada Error interno: Falló ejecución de programa Error interno: fork() falló Error interno: socketpair() falló Contraseña inválida
 Seleccion invalida Tamaño de la llave: %i bytes Fallo de comparación de MAC en el bloque %li Fallo en comparación de MAC, denegando la lectura. Seleccionado modo de configuración Manual. Faltan uno o más argumentos, abortando. Interface de codificacion de nombre no soportada Nueva contraseña Encfs:  Ahora tendrás que introducir una contraseña para tu sistema de ficheros.
Necesitaras recordar esta contraseña, dado que no hay absolutamente
ningún mecanismo de recuperación. Sin embargo, la contraseña puede ser cambiada
más tarde usando encfsctl.

 Seleccionada configuración Paranoica. La contraseña no coincide, por favor vuelva a intentarlo
 Por favor, elige una de las siguientes opciones:
 pulsa "x" para modo experto de configuracion,
 pulsa "p" para modo paranoia pre-configurado,
 cualquier otra, o una linea vacia elegira el modo estandar.
?>  Por favor, elige un tamaño de clave en bits. El cifrado que  has elegido
soporta tamaños desde %i a %i bits en incrementos de %i bits.
Por ejemplo:  Elige un tamaño de bloque en bytes. El cifrado que tu has elegido
soporta tamaños desde %i a %i bytes en incrementos de %i.
O bien, pulsa Intro para elegir el tamaño por defecto (%i bytes)
 Algoritmo seleccionado "%s" Tamaño de clave seleccionada:  Lo siento, imposible encontrar cifrado para la configuración predefinida...
Pasando a modo de configuración Manual. Seleccionada configuración Estándar. El directorio "%s" no existe. ¿Deberia ser creado? (y,N)  El interface de codificado de nombres de fichero requerida no está disponible Los siguientes algoritmos de cifrado estan disponibles: Los siguientes algoritmos de cifrado de nombres de archivo estan disponibles: La interfaz de cifrado requerida no está disponible
 La interfaz de cifrado requerida no está disponible
 No fue posible crear directorio:  No se pudo encontrar el cifrado %s, versión %i:%i:%i No se pudo encontrar interface %s, versión %i:%i:%i No se pudo encontrar el cifrado especificado "%s"
 Imposible inicializar sistema de ficheros encriptado - comprobar ruta.
 No se pudo encontrar el cifrado %s, tamaño de llave %i, tamaño de bloque %i No es posible cargar o interpretar el fichero de configuracion
 Imposible localizar el punto de montaje, abortando. No se pudo encontrar directorio raiz, abortando. Desmontando sistema de ficheros %s por inactividad Uso:
 Forma de uso: %s [opciones] rootDir puntodemontaje [-- [FUSE Opciones de Montaje]] Usando tamaño de clave de %i bits Usando tamaño de clave de %i bits Verifique la contraseña Encfs:  Configuración de Versión 3; creada por %s
 Configuración de Versión 4; creada por %s
 Configuración de versión 5; creada por %s (revisión %i)
 Contraseña del volumen actualizada correctamente
 Cuando se especifica el modo demonio, debes usar rutas absolutas (empezando con '/') Contraseña de longitud cero no permitida
 directorio %s no existe.
 encfs [opciones] dirRaiz puntoMontaje -- [Opciones de Montaje de FUSE]
Las Opciones de Montaje FUSE válida se muestran a continuación:
 versión encfs %s versión de encfsctl %s Tamaño de bloque del sistema de ficheros:  fuse ha fallado. Problemas habituales:
 - el modulo del kernel no esta instalado (modprobe fuse)
 - opciones invalidas -- ver opciones.
 error de getopt: %i comando inválido: "%s" opción '--public' ignorada para usuario diferente a root Fallo, truncado!: leidos %i bytes, bloque  parcial de %i 