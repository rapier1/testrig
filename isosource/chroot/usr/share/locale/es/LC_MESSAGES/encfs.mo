��    �      <  �   \      (     )  ]   I  .   �  1   �  1     (   :  "   c  '   �     �  -   �  �   �  R   �      �    �            *   )  )   T     ~     �  B   �  >   �  S   /  P  �     �  )   �  2        F  �   ^  U   ,  S   �     �     �  6     &  C  `   j  �   �  &  n  �   �     s     �     �  /   �     �        .     #   D     h  j   �  <   �  (   ,  )   U  )     *   �  )   �  /   �  .   .     ]     p  .   �  3   �  +   �  &        D  #   b     �     �     �  #   �  (   �  #   
  (   .  4   W  #   �     �  �   �  �   w      G  *   h  �   �  �   [      �      �   �   !     �!     �!  l   �!      >"  :   _"  ?   �"  �  �"  :   j$  .   �$  9   �$  ?   %  0   N%  9   %  K   �%     &  *   "&  4   M&  %   �&  8   �&  ;   �&  $   '  '   B'  *   j'  *   �'     �'  @   �'      	(  '   *(     R(     l(  '   �(  '   �(  5   �(  5   
)  !   @)  M   b)  !   �)     �)  \   �)     M*     ^*     r*  {   �*     +     +  +   -+  4   Y+  �  �+  +   l-     �-  5   .  >   N.  8   �.  9   �.  ,    /  -   -/     [/  E   n/  �   �/  p   ]0  !   �0  P  �0     A2     R2  4   f2  1   �2     �2     �2  O   3  >   \3  n   �3  q  
4     |5  6   �5  @   �5     6  �   /6  u   7  g   �7     �7     8  H   08  k  y8     �9  �   e:  w  M;  )  �<     �=  *   >  &   .>  6   U>     �>     �>  C   �>  :   �>     8?  �   S?  N   �?  N   /@  7   ~@  =   �@  P   �@  8   EA  5   ~A  R   �A     B  !   B  5   @B  ?   vB  -   �B  .   �B  '   C  -   ;C     iC     �C     �C  *   �C  -   �C  #   D  (   /D  F   XD  2   �D     �D  �   �D  �   �E  &   �F  :   �F  �   -G  �   "H     �H     �H  �   �H     �I     �I  w   �I  &   eJ  9   �J  ;   �J  �  K  R   �L  6   
M  U   AM  S   �M  7   �M  T   #N  R   xN  !   �N  6   �N  8   $O  3   ]O  T   �O  S   �O  @   :P  6   {P  6   �P  3   �P     Q  T   #Q      xQ  @   �Q  $   �Q      �Q  /    R  0   PR  >   �R  >   �R  *   �R  U   *S  -   �S     �S  �   �S     cT     xT  +   �T  �   �T     SU     dU  A   }U  9   �U         N      9   '   e       ]   p   -       G   �   j             H   [          U   y   g                 !   <      �   M   P       X      ~   ;      +              >   x          a   %   h      A           z   *   V          s   `   S      k   Z           {   T   }   J   i   .   B       K      2   O       �   E   �         W   ^       ,   w   Y       8   m      R   6   4   o   I   c                        )   |                  u       v   7   L   /   @       b   #   $           
      5   D   	       3       f       ?   �   0       "   l   t   :   1       _       d                    n   \           =   r       q          (       F   Q                         &   C          -- change password for volume   -- change password for volume, taking password from standard input.
	No prompts are issued.   -- decodes name and prints plaintext version   -- decodes the file and cats it to standard out   -- decrypts a volume and writes results to path   -- encodes a filename and print result   -- print version number and exit   -- show information (Default command)   -- show key   -- show undecodable filenames in the volume   --extpass=program	Use external program for password prompt

Example, to mount at ~/crypt with raw storage in ~/.crypt :
    encfs ~/.crypt ~/crypt

   --public		act as a typical multi-user filesystem
			(encfs must be run as root)
   --reverse		reverse encryption
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
 Add random bytes to each block header?
This adds a performance penalty, but ensures that blocks
have different authentication codes.  Note that you can
have the same benefits by enabling per-file initialization
vectors, which does not come with as great of performance
penalty. 
Select a number of bytes, from 0 (no random bytes) to 8:  Block Size: %i bytes Block Size: %i bytes + %i byte MAC header Block Size: %i bytes, including %i byte MAC header Build: encfs version %s Common Options:
  -H			show optional FUSE Mount Options
  -s			disable multithreaded operation
  -f			run in foreground (don't spawn daemon).
			Error messages will be sent to stderr
			instead of syslog.
 Config subversion %i found, but this version of encfs only supports up to version %i. Configuration finished.  The filesystem to be created has
the following properties: Creating new encrypted volume. Directory not created. Each file contains 8 byte header with unique IV data.
 Enable block authentication code headers
on every block in a file?  This adds about 12 bytes per block
to the storage requirements for a file, and significantly affects
performance but it also means [almost] any modifications or errors
within a block will be caught and will cause a read error. Enable file-hole pass-through?
This avoids writing encrypted blocks when file holes are created. Enable filename initialization vector chaining?
This makes filename encoding dependent on the complete path, 
rather then encoding each path element individually. Enable filename to IV header chaining?
This makes file data encoding dependent on the complete file path.
If a file is renamed, it will not decode sucessfully unless it
was renamed by encfs with the proper key.
If this option is enabled, then hard links will not be supported
in the filesystem. Enable per-file initialization vectors?
This adds about 8 bytes per file to the storage requirements.
It should not affect performance except possibly with applications
which rely on block-aligned file io for performance. EncFS Password:  Enter current Encfs password
 Enter new Encfs password
 Enter the number corresponding to your choice:  Error creating key
 Error creating salt
 Error decoding volume key, password incorrect
 Error saving modified config file.
 Example: 
%s info ~/.crypt
 External chained IV disabled, as both 'IV chaining'
and 'unique IV' features are required for this option. Failure generating new volume key! Please report this error. File data IV is chained to filename IV.
 File holes passed through to ciphertext.
 Filename encoding: "%s", version %i:%i:%i Filenames encoded using IV chaining mode.
 Filesystem cipher: "%s", version %i:%i:%i For more information, see the man page encfs(1) Found %i invalid file. Found %i invalid files. In directory %s: 
 Incorrect number of arguments Incorrect number of arguments for command "%s" Internal error: Caught exception from main loop: %s Internal error: Caught unexpected exception Internal error: failed to exec program Internal error: fork() failed Internal error: socketpair() failed Invalid password
 Invalid selection. Key Size: %i bits MAC comparison failure in block %li MAC comparison failure, refusing to read Manual configuration mode selected. Missing one or more arguments, aborting. Must set password program when using mount-on-demand Name coding interface not supported New Encfs Password:  Note: requested single-threaded mode, but an idle
timeout was specified.  The filesystem will operate
single-threaded, but threads will still be used to
implement idle checking. Now you will need to enter a password for your filesystem.
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
For example:  Remount failed Salt Size: %i bits Select a block size in bytes.  The cipher you have chosen
supports sizes from %i to %i bytes in increments of %i.
Or just hit enter for the default (%i bytes)
 Selected algorithm "%s" Selected key size:  Sorry, unable to locate cipher for predefined configuration...
Falling through to Manual configuration mode. Standard configuration selected. The configuration loaded is not compatible with --reverse
 The directory "%s" does not exist. Should it be created? (y,N)  The external initialization-vector chaining option has been
enabled.  This option disables the use of hard links on the
filesystem. Without hard links, some programs may not work.
The programs 'mutt' and 'procmail' are known to fail.  For
more information, please see the encfs mailing list.
If you would like to choose another configuration setting,
please press CTRL-C now to abort and start over. The filename encoding interface requested is not available The following cipher algorithms are available: The following filename encoding algorithms are available: The raw directory may not be a subdirectory of the mount point. The requested cipher interface is not available
 The requested filename coding interface is not available
 This version of EncFS doesn't support filesystems created before 2004-08-13 Unable to create directory:  Unable to find cipher %s, version %i:%i:%i Unable to find nameio interface %s, version %i:%i:%i Unable to find specified cipher "%s"
 Unable to initialize encrypted filesystem - check path.
 Unable to instanciate cipher %s, key size %i, block size %i Unable to load or parse config file
 Unable to locate mount point, aborting. Unable to locate root directory, aborting. Unmounting filesystem %s due to inactivity Usage:
 Usage: %s [options] rootDir mountPoint [-- [FUSE Mount Options]] Using PBKDF2, with %i iterations Using filesystem block size of %i bytes Using key size of %i bits Verify Encfs Password:  Version 3 configuration; created by %s
 Version 4 configuration; created by %s
 Version 5 configuration; created by %s (revision %i)
 Version 6 configuration; created by %s (revision %i)
 Volume Key successfully updated.
 When specifying daemon mode, you must use absolute paths (beginning with '/') Zero length password not allowed
 directory %s does not exist.
 encfs [options] rootDir mountPoint -- [FUSE Mount Options]
valid FUSE Mount Options follow:
 encfs version %s encfsctl version %s filesystem block size:  fuse failed.  Common problems:
 - fuse kernel module not installed (modprobe fuse)
 - invalid options -- see usage message
 getopt error: %i invalid command: "%s" option '--public' ignored for non-root user truncate failure: read %i bytes, partial block of %i Project-Id-Version: es(2)
Report-Msgid-Bugs-To: https://translations.launchpad.net/encfs/main/+pots/encfs
PO-Revision-Date: 2013-11-15 19:02+0000
Last-Translator: Jose Luis Tirado <Unknown>
Language-Team: español <es@li.org>
Language: es
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n != 1;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
X-Rosetta-Version: 0.1
   -- cambiar la contraseña para el volumen   -- cambiar la contraseña para el volumen, se leerá la contraseña de la entrada estándar.
	 No se imprime ningún mensaje.   -- decodifica el nombre y lo muestra en texto plano   -- decodifica el archivo y lo muestra en la salida estándar   descifra un volumen y escribe los resultados a la ruta   -- codifica un nombre de archivo y muestra el resultado   -- imprima el numero de versión y termine   -- mostrar información (orden por defecto)   -- mostrar clave   -- muestra los nombres de los archivos indescifrables en el volumen   --extpass=programa	Usar programa externo para solicitar contraseña

Por ejemplo, para montar en ~/crypt con almacenamiento en ~/.crypt :
    encfs ~/.crypt ~/crypt

   --public		actuar como un sistema de archivos multiusuario común
			(encfs debe ejecutarse como superusuario)
   --reverse 		 Cifrado invertida
   -v, --verbose		verbose: mostrar mensajes de depuración de encfs
  -i, --idle=MINUTOS	Desmontar automáticamente tras periodo de inactividad
  --anykey		No verificar que se esté usando la clave correcta
  --forcedecode		decodificar datos incluso si se detecta un error
			(para sistemas de archivos que usen cabeceras de bloque MAC)
  (NO soportado)
  (usando %i:%i:%i)
  -- Acepta tamaños de bloque de entre %i y %i bytes  -- Soporta claves de entre %i y %i bits de largo  -- tamaño de bloque: %i bytes  -- largo  de clave de %i bits %s (directorio raíz)
-- muestra información sobre el sistema de archivos, o 
 ------------------------ ADVERTENCIA ------------------------
 Se ha encontrado un sistema de archivos EncFS realmente viejo.
No está soportado por esta versión de EncFS.
 ¿Añadir bytes aleatorios a la cabecera de cada bloque? Esto afecta negativamente al rendimiento, pero garantiza que los bloques tengan distintos códigos de autenticación. Observe que puede obtener el mismo  resultado activando vectores de inicialización por archivo, lo cual tiene un impacto menor.
Seleccione un número de bytes, de 0 (sin bytes aleatorios) a 8:  Tamaño de bloque: %i bytes Tamaño de bloque: %i bytes + %i bytes de cabecera MAC Tamaño de bloque: %i bytes, incluyendo %i bytes de cabecera MAC Compilar: versión de encfs %s Opciones comunes:
  -H			mostrar las opciones de montaje de FUSE
  -s			deshabilitar operación multitarea
  -f			ejecutar en primer plano (no lanzar como demonio).
			Los mensajes de error se enviarán a stderr
			en lugar de a syslog.
 Se ha encontrado la subversión %i de configuración, pero esta versión de encfs sólo soporta hasta la versión %i. Configuración finalizada. El sistema de archivos que se va a crear tendrá las siguientes propiedades: Creando nuevo volumen cifrado. Directorio no creado. Cada archivo contiene una cabecera de 8 bytes con datos únicos del IV.
 ¿Habilitar la autenticación de bloques en las cabeceras de código
en cada bloque de un archivo? Esto añade unos 12 bytes por bloque
a los requisitos de almacenamiento por cada archivo, y afecta
negativamente al rendimiento; pero también implica que
[casi] cualquier modificación o error dentro de un bloque serán
capturados y causarán un error de lectura. ¿Permitir la opción de atravesar huecos en archivos?
Esto evita escribir bloques cifrados cuando se crean huecos en archivos. ¿Activar el encadenamiento  de vectores de inicialización de nombres de archivo?
Esto hace que la codificación de los nombres de archivo dependa de la ruta completa, 
en vez de codificar individualmente cada elemento de la ruta. Activar el encadenamiento del archivo a la cabecera IV?
Esto hace la codificación de datos dependiente de la ruta completa del archivo.
Si un archivo es renombrado, no se descodificará bien a no ser que
fuese renombrado por EncFS utilizando la clave adecuada.
Si esta opción no se activa, los enlaces duros (rutas completas) no serán soportados
en el sistema de archivos. ¿Habilitar vectores de inicialización para cada archivo?
Esto añade unos 8 bytes por archivo a los requisitos de almacenamiento.
No debería afectar al rendimiento excepto, posiblemente, con aplicaciones
que dependan del rendimiento de la lectura o escritura de un archivo
alineado por bloques. Contraseña EncFS:  Introduzca la contraseña actual de Encfs
 Ingrese la nueva contraseña de Encfs
 Introduzca el número correspondiente a su elección:  Error al crear clave
 Error al crear la sal
 Error descodificando la clave del volumen, contraseña incorrecta.
 Error al guardar el archivo de configuración modificado.
 Ejemplo:
%s info ~/.crypt
 Se ha deshabilitado el encadenamiento externo de IV, ya que esta opción requiere las características 'encadenamiento de IV' y 'IV único'. ¡Error generando la nueva clave de volumen! Por favor, informe de este error. El IV de los datos del archivo está encadenado al IV del nombre del archivo.
 Agujeros en archivos pasados a través del ciphertext.
 Codificación de nombres de archivos: "%s", versión %i:%i:%i Los nombres de archivos se codificarán usando el modo de encadenamiento de IV.
 Cifrado del sistema de archivos: "%s", versión %i:%i:%i Para más información vea la página man de encfs(1) Se ha encontrado %i archivo no válido. Se han encontrado %i archivos no válidos. En el directorio %s: 
 Número de parámetros incorrecto Número incorrecto de argumentos para el comando "%s" Error interno: excepción recibida desde el bucle principal: %s Error interno: recibida excepción inesperada Error interno: no se pudo ejecutar el programa Error interno: fallo en función fork() Error interno: fallo en función socketpair() Contraseña incorrecta
 Selección no válida. Tamaño de clave: %i bits Fallo de comparación MAC en el bloque %li Fallo de comparación MAC, cancelando lectura Configuración manual seleccionada. Faltan uno o más argumentos; abortando. Debe establecer una contraseña al programa cuando use mount-on-demand Interfaz de codificación de nombres no disponible Nueva contraseña EncFS:  Nota: se ha solicitado el modo monotarea, pero se ha
especificado un tiempo máximo de inactividad. El sistema
de archivos trabajará en modo monotarea, pero se usarán
tareas para implementar el seguimiento de periodos
de inactividad. A continuación se le pedirá una contraseña para el sistema de archivos.
Debe recordar esta contraseña, ya que no existe absolutamente ningún mecanismo de recuperación. No obstante, la contraseña puede cambiarse después con encfsctl.

 Configuración paranoica seleccionada. La contraseña no coincide, por favor vuelva a intentarlo
 Por favor, seleccione una de las siguientes opciones:
introduzca "x" para modo de configuración para expertos,
introduzca "p" para el modo preconfigurado paranoico,
cualquier otra cosa (o una línea vacía) seleccionará el modo estándar.
?>  Por favor, seleccione un tamaño de clave en bits. El cifrado que ha elegido acepta tamaños de entre %i y %i bits en incrementos de %i bits. Por ejemplo:  Remonte fallado Tamaño de la sal: %i bits Seleccione un tamaño de bloque en bytes. El cifrado que ha elegido acepta tamaños de entre %i y %i bytes en incrementos de %i bytes. O pulse Intro para aceptar el tamaño por defecto (%i bytes).
 Algoritmo seleccionado «%s» Tamaño de clave seleccionado:  No se ha podido determinar el cifrado para la configuración predeterminada...
Pasando a modo de configuración manual. Configuración estándar seleccionada. La configuración cargada no es compatible con --reverse
 El directorio "%s" no existe. ¿Debería ser creado? (y,N)  Se ha habilitado  la opción de encadenamiento de vectores externos de inicialización.
Esta opción impide el uso de enlaces duros en el sistema de archivos. Sin enlaces duros, algunos programas pueden fallar; por ejemplo los programas 'mutt' y 'procmail'. 
Para más información, por favor revise la lista de correo de encfs.
Si desea elegir otra configuración, por favor pulse CTRL-C para abortar la ejecución y comience de nuevo. El interfaz de configuración de nombres de archivo solicitado no está disponible Están disponibles los siguientes algoritmos cifrados: Están disponibles los siguientes algoritmos de codificación de nombres de archivos: El directorio de almacenamiento no puede ser un subdirectorio del punto de montaje. El interfaz de cifrado solicitado no está disponible.
 El interfaz de codificación de nombres de archivos solicitado no está disponible.
 Esta versión de EncFS no soporta sistemas de ficheros creados antes de 2004-08-13 No se puede crear el directorio:  No se puede encontrar el cifrado %s, versión %i:%i:%i No se puede encontrar la interfaz  %s, versión %i:%i:%i No se puede encontrar el cifrado especificado "%s"
 No se ha podido inicializar el sistema de ficheros encriptados - compruebe la ruta.
 No se ha podido instanciar el cifrado %s, tamaño de clave %i, tamaño de bloque %i No se ha podido leer o interpretar el archivo de configuración
 No se puede determinar el punto de montaje; abortando. No se puede determinar el directorio raíz; abortando. Desmontando sistema de archivos %s por inactividad. Uso:
 Uso: %s [opciones] DirectorioRaíz PuntoDeMontaje [-- [opciones de montaje de FUSE]] Usando PBKDF2 con %i iteraciones Usando tamaño de bloque de %i bytes para el sistema de archivos Usando %i bits como tamaño de clave Verifique la contraseña EncFS:  Configuración de la versión 3; creado por %s
 Configuración de la versión 4; por %s  creada
 Configuración de la versión 5; creada por %s (revisión %i)
 Configuración de la versión 6; creada por %s (revisión %i)
 Clave del volumen actualizada con éxito.
 Al especificar el modo demonio, han de usarse rutas absolutas (que comiencen por '/') No se permiten contraseñas de longitud cero
 El directorio %s no existe.
 encfs [opciones] DirectorioRaíz PuntoDeMontaje -- [opciones de montaje de FUSE]
A continuación se muestran las opciones de montaje de FUSE válidas:
 versión %s de encfs encfsctl versión %s tamaño de bloque del sistema de archivos:  fuse ha fallado. Problemas comunes:
- No está instalado el módulo del núcleo de fuse (modprobe fuse)
- opciones inválidas -- vea el mensaje de ayuda
 error getopt: %i Comando no válido: "%s" La opción '--public' sólo se acepta para el Superusuario (root) fallo de truncaje: leídos %i bytes, bloque parcial de %i 