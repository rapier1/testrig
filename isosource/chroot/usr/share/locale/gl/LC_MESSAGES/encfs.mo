��    }        �   �      �
     �
  ]   �
  .     1   6  1   h  (   �  "   �  '   �       -     �   J  R   �      4    U     d     v  *   �  )   �     �     �  B     >   P  S   �  P  �     4  )   I  2   s     �  �   �  U   �  S   �     6     U  6   l     �     �     �  /   �          0  .   E  #   t     �  j   �  <     (   \  )   �  *   �  )   �  /     .   4     c     v  .   �  3   �  +   �  &   #     J  #   h     �     �     �  #   �  (   �  #     (   4  #   ]     �  �   �  �   H        *   9  �   d  �   ,     �     �  �   �     v     �  l   �        :   0  ?   k  �  �  :   ;  .   v  9   �  ?   �  0      9   P   K   �      �   *   �   4   !  %   S!  8   y!  ;   �!  $   �!  '   "  *   ;"  *   f"     �"  @   �"      �"  '   �"     ##     =#  '   U#  '   }#  5   �#  5   �#  !   $  M   3$  !   �$     �$  \   �$     %     /%     C%  {   [%     �%     �%  +   �%  4   *&  �  _&  *   !(  l   L(  7   �(  .   �(  6    )  ,   W)  %   �)  -   �)     �)  ;   �)  �   (*  i   �*     F+  Y  e+     �,     �,  3   �,  5   -     O-     n-  N   �-  @   �-  h   .  �  �.     0  5   /0  A   e0      �0  �   �0  k   �1  T   2  "   f2     �2  a   �2     3  (   3  &   C3  3   j3  #   �3  "   �3  >   �3  6   $4     [4  �   w4  H   5  6   c5  9   �5  [   �5  7   06  4   h6  >   �6     �6      �6  4   7  9   F7  2   �7  -   �7     �7  #   �7     #8     :8     P8  *   j8  2   �8  -   �8  (   �8  0   9     P9  �   i9  �   .:  '   ;  .   F;  �   u;  �   Y<     �<     =  �   =     �=     �=  v   >  (   �>  :   �>  5   �>  �  *?  P   �@  7   A  K   VA  K   �A  7   �A  7   &B  ^   ^B  $   �B  3   �B  5   C  0   LC  J   }C  K   �C  B   D  2   WD  2   �D  6   �D     �D  P   �D  !   KE  ;   mE  %   �E     �E  ,   �E  ,   F  ;   IF  ;   �F  0   �F  S   �F  ,   FG     sG  �   �G     H     1H  *   IH  �   tH     I     #I  =   ;I  3   yI            D          y      n          .              m       `   }      E   L   c   J   A   0   V   K   g   2       o   U   
   S   v   1      G                  @       d       /       -       p   )   B   X   <      {       %   	       #   x       >       !   [      _   h   "      k   C   *       5   q   3   $   4   s   a               9   P   H      W   Y            j                   T   &   \   =      ]   |          r                  z   f       b   :       t   F   N          +           (             Q   ?           ;      ,   '   l   u              ^   i           7   w   O       I   Z           8   R       6   M   e         -- change password for volume   -- change password for volume, taking password from standard input.
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
 EncFS Password:  Enter current Encfs password
 Enter new Encfs password
 Enter the number corresponding to your choice:  Error creating key
 Error creating salt
 Error decoding volume key, password incorrect
 Error saving modified config file.
 Example: 
%s info ~/.crypt
 External chained IV disabled, as both 'IV chaining'
and 'unique IV' features are required for this option. Failure generating new volume key! Please report this error. File data IV is chained to filename IV.
 Filename encoding: "%s", version %i:%i:%i Filenames encoded using IV chaining mode.
 Filesystem cipher: "%s", version %i:%i:%i For more information, see the man page encfs(1) Found %i invalid file. Found %i invalid files. In directory %s: 
 Incorrect number of arguments Incorrect number of arguments for command "%s" Internal error: Caught exception from main loop: %s Internal error: Caught unexpected exception Internal error: failed to exec program Internal error: fork() failed Internal error: socketpair() failed Invalid password
 Invalid selection. Key Size: %i bits MAC comparison failure in block %li MAC comparison failure, refusing to read Manual configuration mode selected. Missing one or more arguments, aborting. Name coding interface not supported New Encfs Password:  Note: requested single-threaded mode, but an idle
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
 getopt error: %i invalid command: "%s" option '--public' ignored for non-root user truncate failure: read %i bytes, partial block of %i Project-Id-Version: encfs
Report-Msgid-Bugs-To: https://translations.launchpad.net/encfs/main/+pots/encfs
PO-Revision-Date: 2015-03-08 04:59+0000
Last-Translator: Marcos Lans <Unknown>
Language-Team: Galician <gl@li.org>
Language: gl
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n != 1;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
   --cambiar o contrasinal para este volume   --cambiar o contrasinal para un volume colléndoa da entrada estándar.
	Non se amosará ningunha mensaxe.   --decodifica o nome e amosa a versión en texto plano   --decodifica un ficheiro e amosa o resultado   --decodifica un volume e escribe o resultado na ruta   --codifica un ficheiro e amosa o resultado   --amosa o número de versión e sae   --amosar información (comando por defecto)   -- amosar a chave   --amosar os nomes de arquivo non decodificables no volume   --extpass=program	Usa un programa externo para introducir o contrasinal

Por exemplo, para montar ~/crypt con almacenamento sen formato en ~/.crypt:

    encfs ~.crypt ~/crypt

   --public		actúa coma un sistema de arquivos multiusuario típico
			(EncFS debe executarse coma root)
   --reverse		 cifrado inverso
   -v, --verbose		Detallado: Amosa as mensaxes de depuración de EncFS
  -i, --idle=MINUTOS	Desmonta automáticamente despois dun período de inactividade
  --anykey		Non verifica que a chave correcta estea a ser usada
  --forcedecode		Decodifica os datos incluso se detecta erros
			(para sistemas de arquivos que usan cabeceiras de bloque MAC)
  (NON soportado)
  (usando %i:%i:%i)
  -- Soporta bloques cun tamaño entre %i e %i bytes  -- Soporta claves dunha lonxitude entre %i e %i bits  -- tamaño do bloque %i bytes  -- lonxitude de clave %i bits %s (directorio raíz)
  --amosa información sobre o sistema de arquivos, ou 
 -------------------------- ATENCIÓN --------------------------
 Foi atopado un sistema de arquivos EncFS realmente vello. 
Non está soportado nesta versión de EncFS.
 Quere engadir bytes aleatorios a cada cabecera de bloque?
Isto implica unha penalización no rendemento, pero asegura que os bloques
teñan diferentes códigos de autenticación. Note que pode
obter os mesmos beneficios activando os vectores de inicialización
por arquivo, que non deriva nun descenso tan grande do
rendemento. 
Escolla un número de bytes, entre 0 (ningún byte aleatorio) e 8:  Tamaño de Bloque: %i bytes Tamaño de Bloque: %i bytes + %i byte de cabecera MAC Tamaño de Bloque: %i bytes, incluíndo %i bytes da cabeceira MAC Construcción: EncFS versión %s Opcións comúns:
  -H			amosa as opcións de montaxe FUSE
  -s			desactiva as operacións multithread
  -f			executa no frente (non invoca ao daemon).
			As mensaxes de erro enviaránse a stderr
			en troques de syslog
 Foi atopada a sub-versión %i de configuración, pero esta versión de EncFS só acepta versións ata a %i. Configuración rematada. O sistema de arquivos a crear ten
as seguintes propiedades: Creando un novo volume encriptado. Non se creou o directorio. Cada arquivo contén unha cabeceira de 8 bytes con datos de Vectores de Inicialización únicos.
 Contrasinal EncFS:  Introduza o contrasinal actual de EncFS
 Introduza o novo contrasinal de EncFS
 Marque o número correspondente á súa elección:  Produciuse un erro creando a chave
 Produciuse un erro creando o salt
 Erro ao decodificar a chave do volume, contrasinal incorrecto
 Erro gardando o arquivo de configuración modificado.
 Exemplo: 
%s info ~/.crypt
 Encadeamento externo de vectores de inicialización desactivado,
xa que as opcións 'encadeamento de vectores' e 'Vector único'
son necesarias para esta opción. Fallo ao xerar unha nova chave do volume! Por favor, informa deste erro. Datos do arquivo IV encadeados ao nome de arquivo IV.
 Codificación do nome de arquivo: "%s", versión %i:%i:%i Nomes de arquivo codificados usando o modo de encadeamento de Vectores de Inicialización.
 Cifrado do sistema de arquivos: "%s", versión %i:%i:%i Para máis información, mire a páxina man encfs(1) Atopado %i arquivo inválido. Atopados %i arquivos inválidos. No directorio %s: 
 Número de argumentos incorrecto Número incorrecto de argumentos para o comando "%s" Erro interno: Detectada excepción no bucle principal: %s Erro interno: Detectada unha excepción inesperada Erro interno: fallou a execución do programa Erro interno: fallou o fork() Erro interno: fallou o socketpair() Contrasinal inválido
 Selección inválida. Tamaño da Chave: %i bits Fallo de comparación de MAC no bloque %li Fallo na comparación de MAC, denegando a lectura. Seleccionado o modo de configuración Manual. Falta un ou máis argumentos, abortando. Interface de codificación do nome non soportada Novo contrasinal EncFS:  Nota: Requeriuse o modo de 'unha soa tarefa', pero
especificouse un problema de exceso de espera. O sistema
ha operar como 'unha soa tarefa' pero haberá tarefas
activas para comprobar o problema. Agora terá que introducir un contrasinal para o seu sistema de arquivos.
Terá que lembrar este contrasinal, xa que non hai ningún sistema de
recuperación. En calquera caso, o contrasinal poderáse cambiar máis tarde
usando encfsctl.

 Seleccionada a configuración Paranoia. O contrasinal non coincide, inténteo de novo
 Por favor, escolla unha das seguintes opcións:
 prema "x" para o modo experto de configuración,
 prema "p" para o modo paranoia preconfigurado,
 calquera outa cousa, ou unha liña en branco, tomaráse como modo estándar.
?>  Por favor, seleccione un tamaño de clave en bits. O cifrado que escolleu
soporta tamaños entre %i e %i bits en incrementos de %i bits.
Por exemplo:  Fallou a re-montaxe Tamaño do salt: %i bits Escolla un tamaño de bloque en bytes. O cifrado que escolleu
soporta tamaños entre %i e %i bytes en incrementos de %i.
Tamén pode premer intro para elixir o tamaño por defecto (%i bytes)
 Algoritmo seleccionado "%s" Tamaño de clave seleccionado:  Disculpe, é imposible atopar un cifrado para a configuración predefinida...
Pasando a modo de configuración Manual. Seleccionada a configuración Estándar. A configuración cargada non é compatíbel con --reverse
 O directorio "%s" non existe. Debería crealo? (y,N)  O encadeamento externo de vectores de inicialización foi
activado. Esta opción desactiva o uso de ligazóns directas no
sistema de arquivos. Sen ligazóns directas, pode que algúns
programas non funcionen. Sábese que os programas 'mutt' e
'procmail' fallan. Para máis información, vexa a lista de correo EncFS.
Se quere escoller outra opción de configuración, prema CTRL-C
agora para abortar e comezar de novo. O interface de codificación de nomes de arquivo requerida non está dispoñible Os seguintes algoritmos de cifrado están dispoñibles: Os seguintes algoritmos de cifrado de nomes de arquivo están dispoñibles: O directorio sen formato pode non ser un subdirectorio do punto de montaxe. A interface de cifrado requerida non está dispoñible
 A interface de cifrado requerida non está dispoñible
 Esta verión de EncFS non é compatíbel cos sistemas de ficheiros creados antes do 13-08-2004 Non foi posible crear o directorio:  Non se puido atopar o cifrado %s, versión %i:%i:%i Non se puido atopar a interface %s, versión %i:%i:%i Non se puido atopar o cifrado especificado "%s"
 Foi imposible iniciar o sistema de arquivos encriptado - comprobe a ruta.
 Non se puido atopar o cifrado %s, tamaño de clave %i, tamaño de bloque %i Non é posible cargar ou interpretar o ficheiro de configuración
 Non se puido atopar o punto de montaxe, abortando. Non se puido atopar o directorio raíz, abortando. Desmontando o sistema de ficheiros %s por inactividade Uso:
 Uso: %s [opciones] DirectorioRaiz puntodemontaxe [-- [FUSE Opcións de Montaxe]] Usando PBKDF2, con %i iteracións A usar tamaño de bloque de sistema de arquivos de %i bytes Usando un tamaño de clave de %i bits Verifique o contrasinal EncFS:  Configuración da versión 3; creada por %s
 Configuración da versión 4; creada por %s
 Configuración da versión 5; creada por %s (revisión %i)
 Configuración da versión 6; creada por %s (revisión %i)
 Contrasinal do volume actualizado correctamente
 Cando se especifica o modo daemon, ten que usar rutas absolutas (comezando por '/') Contrasinal de lonxitude cero non permitida
 o directorio %s non existe.
 encfs [opcións] DirectorioRaiz PuntodeMontaxe -- [Opcións de montaxe de FUSE]
As opcións de montaxe de FUSE válidas amósanse de seguido:
 EncFS versión %s versión de encfsctl %s tamaño de bloque do sistema de arquivos:  FUSE fallou. Os problemas máis frecuentes son:
 - o módulo do kernel de FUSE non está instalado (modprobe fuse)
 - opcións inválidas -- ver opcións.
 Erro de getopt: %i comando inválido: "%s" opción '--public' ignorada para os usuarios que non son root Erro truncado: lidos %i bytes, bloque parcial de %i 