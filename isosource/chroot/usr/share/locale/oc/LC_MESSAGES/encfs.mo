��    |      �  �   �      x
     y
  ]   �
  .   �
  1   &  1   X  (   �  "   �  '   �  -   �  �   ,  R   �          7     F     X  *   k  )   �     �     �  B   �  >   2  0   q     �  S   �  P  
     [  )   p  2   �  -   �  �   �  U   �  S        s     �  6   �     �     �       /   )  .   Y  #   �     �  j   �  <   3  (   p  )   �  *   �  )   �  /     .   H  (   w     �  .   �  3   �  +     &   B     i  #   �     �     �     �  #   �  (     #   /  (   S  4   |  #   �     �  �   �  �   �  2   l      �  *   �  �   �  �   �     ;  �   J     �       l         �  5   �  :   �  ?     �  U  :   �  .       9   O   ?   �   0   �   9   �   K   4!     �!  *   �!  4   �!  %   �!  8   #"  ;   \"  $   �"  '   �"  *   �"  *   #     ;#  @   C#  '   �#     �#     �#  '   �#  '   $  5   .$  !   d$  M   �$  !   �$     �$  \   %     q%     �%     �%  {   �%     *&     ;&  +   Q&  4   }&  �  �&      �(  k   �(  -   &)  #   T)  6   x)  4   �)      �)  1   *  ;   7*  �   s*  m   !+  "   �+  P  �+     -     -  0   0-  .   a-     �-     �-  K   �-  A   .  :   Y.  !   �.  t   �.  �  +/     �0  5   �0  =   1  I   I1  �   �1  k   �2  g   �2  #   d3     �3  I   �3     �3      �3      4  4   :4  ;   o4  W   �4     5  �   5  X   �5  I   �5  6   G6  A   ~6  :   �6  >   �6  8   :7  D   s7     �7  2   �7  9   8  %   ?8  2   e8  #   �8  )   �8     �8     �8     
9  +   "9  ,   N9  *   {9  '   �9  X   �9  0   ':     X:  �   o:  �   L;  B   @<  &   �<  2   �<  �   �<  �   �=     Q>  �   i>     ?     9?  �   W?  &   �?  K   @  B   W@  ;   �@  �  �@  F   mB  7   �B  J   �B  K   7C  8   �C  I   �C  d   D  $   kD  @   �D  >   �D  <   E  Y   ME  d   �E  A   F  5   NF  5   �F  ?   �F     �F  N   	G  F   XG  *   �G     �G  -   �G  -   H  ;   CH  6   H  ]   �H  %   I     :I  �   ZI     �I     �I  *   J  �   9J     �J     �J  4   �J  @   /K           D       
   x       n   C      -              m   k   a   |      E   M   d   K   @   /   W   L   h   1   !   o   V      T   u   0      G                  ?       e       .       ,               A   Y   ;      z       &   	       $          =       "   4      `   i   #      H   B   )       5   S   2   %   3   r   b           g   8   P   I      X   Z            j                       '   ]   <   6   ^   {          q                  y   \       c   9       s   F   O          *                          Q   >           :      +   (   l   t             _       p   U   N   v           J   [           7   R       w       f         -- change password for volume   -- change password for volume, taking password from standard input.
	No prompts are issued.   -- decodes name and prints plaintext version   -- decodes the file and cats it to standard out   -- decrypts a volume and writes results to path   -- encodes a filename and print result   -- print version number and exit   -- show information (Default command)   -- show undecodable filenames in the volume   --extpass=program	Use external program for password prompt

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
 --reverse specified, not using unique/chained IV 8 byte block cipher A really old EncFS filesystem was found. 
It is not supported in this EncFS build.
 Add random bytes to each block header?
This adds a performance penalty, but ensures that blocks
have different authentication codes.  Note that you can
have the same benefits by enabling per-file initialization
vectors, which does not come with as great of performance
penalty. 
Select a number of bytes, from 0 (no random bytes) to 8:  Block Size: %i bytes Block Size: %i bytes + %i byte MAC header Block Size: %i bytes, including %i byte MAC header Block encoding, hides file name size somewhat Common Options:
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
 External chained IV disabled, as both 'IV chaining'
and 'unique IV' features are required for this option. Failure generating new volume key! Please report this error. File data IV is chained to filename IV.
 Filename encoding: "%s", version %i:%i:%i Filenames encoded using IV chaining mode.
 Filesystem cipher: "%s", version %i:%i:%i For more information, see the man page encfs(1) Found %i invalid file. Found %i invalid files. Found config file %s, but failed to load In directory %s: 
 Incorrect number of arguments for command "%s" Internal error: Caught exception from main loop: %s Internal error: Caught unexpected exception Internal error: failed to exec program Internal error: fork() failed Internal error: socketpair() failed Invalid password
 Invalid selection. Key Size: %i bits MAC comparison failure in block %li MAC comparison failure, refusing to read Manual configuration mode selected. Missing one or more arguments, aborting. Must set password program when using mount-on-demand Name coding interface not supported New Encfs Password:  Note: requested single-threaded mode, but an idle
timeout was specified.  The filesystem will operate
single-threaded, but threads will still be used to
implement idle checking. Now you will need to enter a password for your filesystem.
You will need to remember this password, as there is absolutely
no recovery mechanism.  However, the password can be changed
later using encfsctl.

 Paranoia configuration not supported for --reverse Paranoia configuration selected. Passwords did not match, please try again
 Please choose from one of the following options:
 enter "x" for expert configuration mode,
 enter "p" for pre-configured paranoia mode,
 anything else, or an empty line will select standard mode.
?>  Please select a key size in bits.  The cipher you have chosen
supports sizes from %i to %i bits in increments of %i bits.
For example:  Remount failed Select a block size in bytes.  The cipher you have chosen
supports sizes from %i to %i bytes in increments of %i.
Or just hit enter for the default (%i bytes)
 Selected algorithm "%s" Selected key size:  Sorry, unable to locate cipher for predefined configuration...
Falling through to Manual configuration mode. Standard configuration selected. Stream encoding, keeps filenames as short as possible The configuration loaded is not compatible with --reverse
 The directory "%s" does not exist. Should it be created? (y,n)  The external initialization-vector chaining option has been
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
 getopt error: %i invalid command: "%s" option '--public' ignored for non-root user truncate failure: read %i bytes, partial block of %i Project-Id-Version: encfs
Report-Msgid-Bugs-To: vgough@pobox.com
POT-Creation-Date: 2010-11-18 00:12-0800
PO-Revision-Date: 2008-03-25 10:34+0000
Last-Translator: Cédric VALMARY (Tot en òc) <cvalmary@yahoo.fr>
Language-Team: Occitan (post 1500) <oc@li.org>
Language: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n > 1;
X-Launchpad-Export-Date: 2010-06-17 04:44+0000
X-Generator: Launchpad (build Unknown)
   -- cambiar lo senhal pel volum   -- cambiar lo senhal pel volum, en lo legissent sus l'entrada estandarda.
	 Cap de convit es pas afichat.   -- decòda lo nom e aficha la version tèxt   -- decòda un fichièr e l'aficha   -- deschifra un nom de fichièr e aficha lo resultat   -- encòda un nom de fichièr e aficha lo resultat   -- afichar la version e quitar   -- mostrar las entresenhas (Comanda per defaut)   -- mostrar los noms de fichièrs non decodables del volum   --extpass=programa	Utiliza un programa extèrn per la demanda del senhal

Per exemple, per montar sus ~/crypt amb un estocatge raw dins ~/.crypt :
encfs ~/.crypt ~/crypt

   --public		agís coma un sistèma de fichièrs multiutilizaires classic
			(encfs deu èsser aviat en root)
   --reverse		 chiframent inversat
   -v, --verbose		verbose : aficha los messatges de debogatge de encfs
-i, --idle=MINUTES	Autodemontatge aprèp un periòde d'inactivitat
--anykey		Verificar pas se una clau corrècta es utilizada
--forcedecode		Decòda las donadas quitament se una error es detectada
			(pels sistèmas de fichièr utilizant las entèstas de blòt MAC)
  (NON suportat)
  (utilizacion de %i:%i:%i)
  -- Suporta de talhas de blòt de %i a %i octets  -- Suporta de longors de clau de %i a %i bits  -- talha de blòt %i octets  -- longor de la clau %i bits %s (repertòri raiç)
-- aficha d'entresenhas sul sistèma de fichièr, o 
 -------------------------- AVERTIMENT --------------------------
 --reverse especificat, pas d'utilizacion d'IV unic/cadenat chiframent per blòcs de 8 octets Un sistèma de fichièr EncFS vertadièrament ancian es estat trobat.
Aquesta version d'EncFS la pren pas en carga.
 Ajustar d'octets aleatòris a cada entèsta de blòt ?
Aquò penalizarà las performàncias, mas garantirà que los blòts
an diferents còdes d'autentificacion. Notatz que podètz obténer lo meteis benefici en activant los vectors
d'inicializacion per fichièr, qu'aportan pas una
degradacion de perfomància tant importanta.
Seleccionatz un nombre d'octets, de 0 (pas d'octets
aleatòris) a 8 :  Talha de blòt : %i octets Talha de blòt : %i octets + %i octets d'entèsta MAC Talha de blòt : %i octets, incluses %i octets d'entèsta MAC Encodatge per blòt, dissimula un pauquet la longor dels noms de fichièr Opcions correntas :
-H			mòstra las opcions de montatge opcionalas de FUSE
-s			desactiva las operacions multithreadadas
-f			s'executa en abans plan (engendra pas de demon).
			Los messatges d'error seràn mandats vèrs stderr
			al luòc de syslog.
 Sosversion de configuracion %i trobada, mas aquesta version d'EncFS suporta pas que las versions fins a %i. Configuracion acabada. Lo sistèma de fichièrs a
mand d'èsser creat a las caracteristicas seguentas : Creacion d'un volum chifrat novèl. Repertòri pas creat. Cada fichièr compren una entèsta de 8 octets amb de donadas IV unicas.
 Senhal EncFS :  Picatz lo senhal actual d'Encfs
 Picatz lo senhal novèl d'Encfs
 Picatz lo nombre correspondent de vòstra causida :  Error al decodatge de la clau de volum, senhal incorrècte
 Error al moment de la salvagàrdia de las modificacions del fichièr de configuracion.
 Exemple :
%s info ~/.crypt
 Cadenatge IV extèrn desactivat, donat que las foncionalitats
'cadenatge IV' e 'IV unic' son totas doas requesas per
aquesta opcion. Fracàs a la generacion d'una clau de volum novèla ! Mercés de senhalar aquesta error. L'IV de las donadas del fichièr es cadenada a l'IV del nom de fichièr.
 Encodatge del nom de fichièr : "%s", version %i:%i:%i Nom de fichièrs chifrats en utilizant lo mòde de cadenatge IV.
 Chiframent de sistèma de fichièrs "%s", version %i:%i:%i Per mai d'entresenhas, consultatz la pagina de manual encfs(1) %i fichièr invalid trobat %i fichièrs invalids trobats Fichièr de configuracion %s trobat, mas son cargament a pas capitat Dins lo repertòri %s : 
 Nombre d'arguments incorrècte per la comanda "%s" Error intèrna : exceptcion dins la bocla principala : %s Error intèrna : excepcion inesperada Error intèrna : impossible d'executar un programa Error intèrna : fork() a fracassat Error intèrna : socketpair() a fracassat Senhal invalid
 Seleccion invalida. Talha de clau : %i bits Fracàs de comparason MAC dins lo blòt %li Fracàs de comparason MAC, refús de lectura Mòde de configuracion manual seleccionat. Manca un o maites paramètres, abandon. Cal absolutament especificar un programa de senhal per utilizar lo montatge-a-la-demanda L'interfàcia de codatge de nom es pas suportada Senhal EncFS novèl :  Nòta : lo mòde monothread es estat requesit, mas una sosta
d'inactivitat es estada indicada. Lo sistèma de fichièrs serà
gerit en monothread, mentrestant, de threads seràn 
utilizats per la deteccion d'inactivitat. Ara anatz dever picar un senhal
per vòstre sistèma de fichièrs.
Anatz dever absolutament vos remembrar d'aqueste senhal,
perque i a pas cap de mecanisme de secors.
Çaquelà, lo senhal poirà èsser cambiat mai tard
en utilizant encfsctl.

 La configuracion paranoiaca es incompatibla amb l'opcion --reverse Configuracion paranoiaca seleccionada. Los senhals correspòndon pas, ensajatz tornamai.
 Causissètz al mens una de las opcions seguentas :
picatz "x" pel mòde de configuracion expèrt,
picatz "p" per un mòde preconfigurat paranoiac,
qué que siá d'autre o una linha voida seleccionarà lo mòde estandard.
?>  Seleccionatz una talha de clau en bits.
Lo chiframent qu'avètz causit suporta de
talhas de %i a %i bits per increments de %i bits.
Per exemple :  lo montatge a fracassat Seleccionatz una talha de blòt en octets. L'algoritme causit
suporta de talhas de %i a %i octets per increments de %i.
O quichatz just Entrada per la valor per defaut (%i octets)
 Algoritme seleccionat "%s" Talha de clau seleccionada :  O planhèm, impossible de localizar l'algoritme de
chiframent per la configuracion predefinida...
Passatge al mòde de configuracion manual. Configuracion estandarda seleccionada. Encodatge de flus, consèrva los noms de fichièrs tant corts coma possible La configuracion cargada es pas compatibla amb l'opcion --reverse
 Lo repertòri "%s" existís pas. Deu èsser creat ? (ò/n)  Lo vector d'inicializacion extèrn es estat activat.
Aquesta opcion autoriza pas l'usatge de ligams durs dins lo sistèma de fichièrs.
Sens ligams durs, qualques programas pòdon foncionar pas.
Los programas «mutt» e «procmail» son coneguts per capitar pas.
Per mai d'entresenhas, reportatz-vos a la lista de discussion d'encfs.
Per causir una autra configuracion, quichatz CTRL-C e tornatz començar. L'interfàcia d'encodatge de nom de fichièr requesa es pas disponibla Los algoritmes de chiframent seguents son disponibles : Los algoritmes d'encodatge de noms de fichièrs seguents son disponibles : Lo repertòri chifrat pòt pas èsser un sosrepertòri del punt de montatge L'interfàcia de chiframent demandada es pas disponibla
 L'interfàcia de codatge del nom de fichièr demandada es pas disponibla
 Aquesta version de EncFS pòt manipular de sistèmas de fichièrs creats abans lo 13 d'agost de 2004 Impossible de crear lo repertòri :  Impossible de trobar lo modul de chiframent %s, version %i:%i:%i Impossible de trobar l'interfàcia nameio %s, version %i:%i:%i Impossible de trobar l'algoritme de chiframent indicat "%s"
 Impossible d'inicializar lo sistèma de fichièr criptat - verificatz lo camin d'accès.
 Impossible d'instanciar lo modul de chiframent %s, amb una talha de clau %i, e una talha de blòt %i Impossible de legir o d'interpretar lo fichièr de configuracion
 Impossible de localizar lo punt de montatge, abandon. Impossible de localizar lo repertòri raiç, abandon. Desmontatge del sistèma de fichièr %s per causa d'inactivitat Utilizacion :
 Usatge : %s [opcions] respRaiç puntDeMontatge [-- [Opcions de montatge FUSE]] Utilizacion d'una talha de blòt del sistèma de fichièr de %i octets Utilizacion d'una talha de clau de %i bits Verifcatz lo senhal EncFS :  Configuracion de la version 3; creada per %s
 Configuracion de la version 4; creada per %s
 Configuracion de la version 5; creada per %s (revision %i)
 La clau de volum es estada mesa a jorn corrèctament.
 Quand lo mòde demon es especificat, devètz utilizar de camins absoluts (començant per '/') Senhal de longor zèro pas autorizat
 Lo repertòri %s existís pas.
 Utilizacion : %s [opcions] respRaiç puntDeMontatge -- [Opcions de montatge FUSE]
las opcions de montatge validas de FUSE son las seguentas :
 encfs version %s encfsctl version %s talha de blòt del sistèma de fichièr :  fuse a fracassat. Problèmas corrents :
- lo modul del nucli fuse es pas installat (modprobe fuse)
- opcions invalidas -- vejatz lo messatge d'usatge
 error getopt : %i comanda invalida : "%s" option '--public' ignorada per l'utilizaire non-root fracàs de la troncadura : %i octets legits, blòt parcial de %i 