��    [      �     �      �     �  ]   �  .   G  1   v  1   �  (   �  "   	  '   &	  -   N	     |	     �	  *   �	  )   �	     �	     
  B   %
  >   h
  S   �
     �
  U     S   i     �     �     �          "  .   <  #   k     �  j   �  <     )   S  )   }  /   �  .   �       .     3   H  &   |     �  #   �     �     �     
  #     (   @  #   i  (   �     �  �   �      �  *   �  �   �  �   �  �   7     �     �  l         p  ?   �  �  �  0   a  9   �  K   �       *   5  4   `  %   �  8   �  ;   �  $   0  '   U  *   }  *   �     �  @   �  '        D     ^  '   v  '   �  5   �  M   �     J     h     y     �     �     �  4   �  �    $   �  {     8   �  G   �  8     5   I  +     0   �  6   �          #  *   :  1   e     �     �  I   �  ?     e   W     �  v   �  T   Q      �      �      �   %   �   $   !  @   ;!  4   |!     �!  �   �!  E   X"  7   �"  3   �"  <   
#  6   G#     ~#  3   �#  6   �#  ,   �#     )$  $   H$     m$     �$     �$  -   �$  4   �$  )   %  &   B%     i%    �%  $   �&  B   �&  �   �&  �   �'  �   R(     )     -)  u   D)  %   �)  F   �)  �  '*  =   �+  R   $,  E   w,      �,  2   �,  ?   -  .   Q-  F   �-  J   �-  6   .  3   I.  0   }.  :   �.     �.  W   �.  :   G/  %   �/  "   �/  '   �/  '   �/  3   0  V   O0     �0     �0     �0  '   �0     1     "1  5   :1               2   [                            %           O      S                     ;   9   #       Q       D   X   ,       :   !                           Z   K   8   '   
           I             G   $       E   *   R   L                       H   )   3   +   M   B             	   1   "      T      U           F              (   >   5   C   V          -   4   0       6               A         7   /       W          P       &   Y      =   <   J   .   N       @   ?          -- change password for volume   -- change password for volume, taking password from standard input.
	No prompts are issued.   -- decodes name and prints plaintext version   -- decodes the file and cats it to standard out   -- decrypts a volume and writes results to path   -- encodes a filename and print result   -- print version number and exit   -- show information (Default command)   -- show undecodable filenames in the volume  (NOT supported)
  (using %i:%i:%i)
  -- Supports block sizes of %i to %i bytes  -- Supports key lengths of %i to %i bits  -- block size %i bytes  -- key length %i bits %s (root dir)
  -- displays information about the filesystem, or 
 -------------------------- WARNING --------------------------
 A really old EncFS filesystem was found. 
It is not supported in this EncFS build.
 Build: encfs version %s Config subversion %i found, but this version of encfs only supports up to version %i. Configuration finished.  The filesystem to be created has
the following properties: Creating new encrypted volume. Directory not created. EncFS Password:  Enter current Encfs password
 Enter new Encfs password
 Error decoding volume key, password incorrect
 Error saving modified config file.
 Example: 
%s info ~/.crypt
 External chained IV disabled, as both 'IV chaining'
and 'unique IV' features are required for this option. Failure generating new volume key! Please report this error. Filename encoding: "%s", version %i:%i:%i Filesystem cipher: "%s", version %i:%i:%i For more information, see the man page encfs(1) Found %i invalid file. Found %i invalid files. In directory %s: 
 Incorrect number of arguments for command "%s" Internal error: Caught exception from main loop: %s Internal error: failed to exec program Internal error: fork() failed Internal error: socketpair() failed Invalid password
 Invalid selection. Key Size: %i bits MAC comparison failure in block %li MAC comparison failure, refusing to read Manual configuration mode selected. Missing one or more arguments, aborting. New Encfs Password:  Now you will need to enter a password for your filesystem.
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
Falling through to Manual configuration mode. Standard configuration selected. The directory "%s" does not exist. Should it be created? (y,N)  The external initialization-vector chaining option has been
enabled.  This option disables the use of hard links on the
filesystem. Without hard links, some programs may not work.
The programs 'mutt' and 'procmail' are known to fail.  For
more information, please see the encfs mailing list.
If you would like to choose another configuration setting,
please press CTRL-C now to abort and start over. The requested cipher interface is not available
 The requested filename coding interface is not available
 This version of EncFS doesn't support filesystems created before 2004-08-13 Unable to create directory:  Unable to find cipher %s, version %i:%i:%i Unable to find nameio interface %s, version %i:%i:%i Unable to find specified cipher "%s"
 Unable to initialize encrypted filesystem - check path.
 Unable to instanciate cipher %s, key size %i, block size %i Unable to load or parse config file
 Unable to locate mount point, aborting. Unable to locate root directory, aborting. Unmounting filesystem %s due to inactivity Usage:
 Usage: %s [options] rootDir mountPoint [-- [FUSE Mount Options]] Using filesystem block size of %i bytes Using key size of %i bits Verify Encfs Password:  Version 3 configuration; created by %s
 Version 4 configuration; created by %s
 Version 5 configuration; created by %s (revision %i)
 When specifying daemon mode, you must use absolute paths (beginning with '/') directory %s does not exist.
 encfs version %s encfsctl version %s filesystem block size:  getopt error: %i invalid command: "%s" truncate failure: read %i bytes, partial block of %i Project-Id-Version: Encrypted Filesystem for Linux
Report-Msgid-Bugs-To: https://translations.launchpad.net/encfs/main/+pots/encfs
PO-Revision-Date: 2008-01-26 02:03+0000
Last-Translator: maleses <Unknown>
Language-Team: Catalan <ca@li.org>
Language: ca
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n != 1;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
X-Rosetta-Version: 0.1
   -- canvia la contrasenya pel volum   -- canvia la contrasenya pel volum, agafant la nova contrasenya de l'entrada estàndard.
	No s'utilitza una nova consola.   -- decodifica el nom i n'escriu la versió en text pla   -- codifica un nom de fitxer i categoritza'l com a sortida estàndard   -- descodifica un volum i escriu el resultat a la ruta   -- codifica un nom de fitxer i n'escriu el resultat   -- escriu el número de la versió i surt   -- mostra la informació (comanda per defecte)   -- mostra els noms d'arxiu indecodificables al volum  (NO suportat)
  (utlitzant %i:%i:%i)
  --Suporta mides de block de %i a %i bytes  --Suporta claus de %i fins a %i bits de longitud  --mida de block %i bytes  --longitud de clau %i bits %s (carpeta arrel)
  -- mostra informació sobre el sistema d'arxius, o 
 -------------------------- ATENCIÓ --------------------------
 Un sistema d'arxius EncFS molt antic ha estat trobat. 
No és suportat per aquesta versió de EncFS.
 Construeix: encfs versió %s S'ha trobat l'arxiu de configuració de subversion %i, però aquesta versió d'encfs només suporta fins la versió %i Configuració finalitzada. El sistema d'arxius a crear té les següents propietats: Creant un volum encriptat nou. Directori no creat. Contrassenya d'EncFS:  Introduir l'actual contrasenya Encfs
 Introduir la nova contrasenya Encfs
 Error decodificant la clau del volum, paraula de pas incorrecte
 Error al guardar l'arxiu de configuració modificat
 Exemple: 
%s info ~/.crypt
 Encadenació IV externa deshabilitada, ja que tant les
prestacions 'encadenament IV' com 'IV únic' són 
necessàries per aquesta opció. Error generant nova clau de volum! Per favor, informe d'aquest error. Codificació del nom del fitxer: "%s", versió %i:%i:%i Xifrat del sistema d'arxius: "%s", versió %i:%i:%i Si voleu més informació, consulteu la pàgina man encfs(1) Trobat %i arxiu invàlid. Trobats %i arxius invàlids. Al directori %s: 
 Nombre incorrecte d'arguments per a la comanda "%s" Error intern: excepció agafada de bucle principal: %s Error Intern: execució del programa fallada Error intern: fork() ha fallat Error intern: socketpair() ha fallat Contrasenya incorrecta
 Selecció invàlida. Tamany de la clau: %i bits Error en la comparació de MAC en el bloc %li Error en la comparació de MAC, es refusa la lectura Mode de configuració manual seleccionat. Manquen un o més arguments, abortant. Nova contrassenya d'Encfs:  Ara necessitareu introduïr una paraula de pas per el vostre sistema
de fitxers. Haureu de recordar aquesta paraula de pas, ja que és
absolutament impossible recuperar-lo. De totes formes, és possible 
canviar el mot de pas més tard fent servir encfsctl.

 Configuració paranoica seleccionada Les contrassenyes no es corresponen, si us plau torna-ho a provar
 Si us plau, escull una de les següents opcions:
Insereix "x" per a una configuració en mode expert,
Insereix "p" per al mode paranoia pre-configurat ,
per a qualsevol altre, o camp buit triarem mode estàndard.
?>  Per favor, trie un tamany de clau en bits. El xifrat que ha triat 
suporta tamanys des de %i fins a %i bits, en increments de %i bits.  Trie un tamany de bloc en bytes. El xifrat que ha triat
suporta tamanys des de %i fins a %i bytes en increments de %i
O tan sols pulse entrar per a triar la selecció per defecte (%i bytes)
 Algorisme "%s" seleccionat. Tamany de clau triat:  Ho sentim, impossible trobar el xifrador per la configuració predefinida...
Canviant al mode de configuració Manual Configuració estàndard seleccionada El directori "%s" no existeix. Desitges crear el nou directori? (y,N)  La opció de l'encadenament del vector d'inicialització extern
s'ha habilitat. Aquesta opció deshabilita l'us d'enllaços durs
en el sistema de fitxers. Sense enllaços durs, alguns programes
podrien no funcionar. Se sap que els programes 'mutt' i 'procmail'
fallen. Per més informació, si us plau mireu la llista de correu
de encfs. Si voleu escollir alguna altra opció de configuració,
premeu CTRL-C ara per abortar, i torneu a començar. La interfície el xifrador sol·licitat no està disponible.
 La interfície de codificació de nom de fitxer sol·licitada no està disponible
 Aquesta versió de EncFS no accepta arxius creats abans de 2004-08-13 No s'ha pogut crear la carpeta:  Impossible trobar el xifrador %s, versió %i:%i:%i No s'ha pogut trobar la interfície nameio %s, versió %i:%i:%i Incapaç de trobar la xifra especificada "%s"
 No es pot inicialitzar un sistema d'arxius xifrat - comprova la ruta.
 Impossible instanciar el xifrador %s, tamany de clau %i, tamany de bloc %i No es pot carregar o revisar l'arxiu de configuració
 No s'ha pogut trobar el punt de muntatge, s'aborta. No s'ha pogut trobar la carpeta arrel, s'aborta. ﻿Inmuntant el sitema de fitxers %s a causa d'inactivitat Ús:
 Forma d'ús: %s [opcions] directoriArrel puntDeMuntatge [-- [Opcions De Muntatge FUSE]] Utilitzant tamany de block de sistema d'arxius de %i bytes Utilitzant com a mida de clau %i bits Comprova la contrassenya d'EncFS:  Configuració Versió 3; creada per %s
 Configuració Versió 4; creada per %s
 Configuració Versió 5; creada per %s(Revisió%i)
 Quan especifiquis el mode daemon, has d'utilitzar rutes absolutes (començant per '/') el directori %s no existeix.
 versió encfs %s encfsctl versió %s Tamany de bloc del sistema de fitxers:  error getopt: %i Comanda invàlida: "%s" trencar error: llegint  %i octets, bloc parcial de %i 