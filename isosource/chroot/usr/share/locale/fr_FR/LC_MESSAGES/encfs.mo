��    l      |  �   �      0	     1	  .   Q	  "   �	  '   �	  �   �	    b
     q     �  *   �  )   �     �       B     >   ]  S   �  P  �     A  )   V  2   �     �  �   �  U   �  S   �     C     b  6   y     �     �     �  /   �  .   )  #   X     |  j   �  <     (   @  )   i  *   �  )   �  /   �  .        G  .   Z  3   �  +   �  &   �       #   .     R     d     w  #   �  (   �  #   �  (   �  #   #     G  �   \  �         �  *   �  �   *  �   �  �   z          2  l   F      �  :   �  ?     :   O  .   �  9   �  0   �  9   $  K   ^     �  *   �  4   �  %   '  8   M  ;   �  $   �  '   �  *     *   :     e  @   m  '   �     �     �  '     '   0  5   X  5   �  !   �  M   �  !   4     V  \   t     �     �     �  {         �      �   4   �     �   &   �"  6   #  .   P#  1   #  �   �#  n  p$     �%     �%  )   &  1   7&     i&     �&  W   �&  D   �&  o   >'  q  �'      )  5   ;)  ?   q)     �)    �)  i   �*  X   A+  &   �+     �+  N   �+     (,  -   8,  .   f,  1   �,  D   �,  ;   -     H-  t   d-  W   �-  G   1.  *   y.  <   �.  8   �.  :   /  ;   U/     �/  2   �/  7   �/  $   0  4   <0  !   q0  '   �0     �0     �0     �0  *    1  .   +1  ,   Z1  -   �1  )   �1     �1  �   �1  �   �2  *   �3  =   �3  �   44  �   5  �   �5     �6      �6  r   �6  %   A7  G   g7  <   �7  H   �7  +   58  J   a8  7   �8  H   �8  a   -9  &   �9  6   �9  =   �9  '   +:  R   S:  L   �:  =   �:  3   1;  5   e;  -   �;     �;  R   �;  E   +<  (   q<     �<  &   �<  &   �<  +   =  +   1=  *   ]=  c   �=  6   �=      #>  z   D>     �>     �>  )   �>  �   ?     �?     �?  7   �?     T           5   Y   
       F   M   G   U      L       B       g       E         1   !          -   <      #   @          [      )   7       H      2           V   D   *   a       A   d   .   h   :       C   %             f                      W   ;              3       S   ?       i       N       Z   ^      (       	   +   &                 P   J      R   '   e   X                       b   `       8   O              K      ]   k   c       6   \   _   l   9   >   ,       4                                I      "      $       0       Q          /   j   =      -- change password for volume   -- decodes name and prints plaintext version   -- print version number and exit   -- show information (Default command)   --extpass=program	Use external program for password prompt

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
 Enter the number corresponding to your choice:  Error decoding volume key, password incorrect
 Error saving modified config file.
 Example: 
%s info ~/.crypt
 External chained IV disabled, as both 'IV chaining'
and 'unique IV' features are required for this option. Failure generating new volume key! Please report this error. File data IV is chained to filename IV.
 Filename encoding: "%s", version %i:%i:%i Filenames encoded using IV chaining mode.
 Filesystem cipher: "%s", version %i:%i:%i For more information, see the man page encfs(1) Found %i invalid file. Found %i invalid files. In directory %s: 
 Incorrect number of arguments for command "%s" Internal error: Caught exception from main loop: %s Internal error: Caught unexpected exception Internal error: failed to exec program Internal error: fork() failed Internal error: socketpair() failed Invalid password
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
For example:  Select a block size in bytes.  The cipher you have chosen
supports sizes from %i to %i bytes in increments of %i.
Or just hit enter for the default (%i bytes)
 Selected algorithm "%s" Selected key size:  Sorry, unable to locate cipher for predefined configuration...
Falling through to Manual configuration mode. Standard configuration selected. The configuration loaded is not compatible with --reverse
 The directory "%s" does not exist. Should it be created? (y,N)  The filename encoding interface requested is not available The following cipher algorithms are available: The following filename encoding algorithms are available: The requested cipher interface is not available
 The requested filename coding interface is not available
 This version of EncFS doesn't support filesystems created before 2004-08-13 Unable to create directory:  Unable to find cipher %s, version %i:%i:%i Unable to find nameio interface %s, version %i:%i:%i Unable to find specified cipher "%s"
 Unable to initialize encrypted filesystem - check path.
 Unable to instanciate cipher %s, key size %i, block size %i Unable to load or parse config file
 Unable to locate mount point, aborting. Unable to locate root directory, aborting. Unmounting filesystem %s due to inactivity Usage:
 Usage: %s [options] rootDir mountPoint [-- [FUSE Mount Options]] Using filesystem block size of %i bytes Using key size of %i bits Verify Encfs Password:  Version 3 configuration; created by %s
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
 getopt error: %i invalid command: "%s" truncate failure: read %i bytes, partial block of %i Project-Id-Version: Encrypted Filesystem for Linux
Report-Msgid-Bugs-To: https://translations.launchpad.net/encfs/main/+pots/encfs
PO-Revision-Date: 2008-02-24 14:06+0000
Last-Translator: John McGuckian <jaymac@jaymac.info>
Language-Team: French (France) <fr_FR@li.org>
Language: fr_FR
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n > 1;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
X-Rosetta-Version: 0.1
   -- changer le mot de passe du volume   -- déchiffrer les noms et afficher la version texte   -- afficher le numéro de version et quitter   -- voir les informations (commande par défaut)   --extpass=programme\tUtiliser un programme externe pour la demande de mot de passe

Par exemple, pour monter sur ~/crypt, avec le stockage brut dans ~/.crypt :
    encfs ~/.crypt ~/crypt

   -v, --verbose\t\tmode verbeux : afficher les messages de déboguage
  -i, --idle=MINUTES\tDémonter automatiquement après une période d'inactivité
  --anykey\t\tNe pas vérifier que la bonne clé est utilisée
  --forcedecode\t\tDécoder les données même si une erreur est détectée
\t\t\t(pour les systèmes de fichier utilisant des en-têtes de blocs MAC)
  (NON supporté)
  (utilisation de %i:%i:%i)
  -- supporte des blocs de %i à %i octets  -- supporte des tailles de clé de %i à %i bits  -- taille de bloc %i octets  -- taille de clé %i bits %s (répertoire racine)
  -- afficher les informations sur le système de fichier, ou 
 -------------------------- AVERTISSEMENT --------------------------
 Un système de fichiers EncFS très vieux a été trouvé.
Il n'est pas supporté dans cette version de EncFS.
 Ajouter des octets aléatoires à chaque en-tête de bloc ? 
Ceci pénalise les performances, mais fait en sorte que les blocs ont des codes d'authentification différents. Vous pouvez obtenir les mêmes bénéfices en activant les  vecteurs d'initialisation par fichier, qui ne pénalisent pas tant les performances. Sélectionnez un nombre d'octets allant de 0 à 8.  Taille de bloc : %i octets Taille de bloc : %i octets + %i octets d'en-tête MAC Taille de bloc : %i octets, y compris %i octets d'en-tête MAC. Build : encfs version %s Options communes :
  -H\t\t\tafficher les options de montage FUSE
  -s\t\t\tdésactiver le fonctionnement multithreadé
  -f\t\t\tfonctionner devant (ne pas lancer de démon)
\t\t\tLes messages d'erreur sont envoyés sur stderr
\t\t\tau lieu du log système (syslog).
 Version de configuration %i trouvée, mais cette version de encfs ne supporte que jusqu'à la version %i. Configuration terminée. Le système de fichier à créer a les propriétés suivantes : Création du nouveau volume encrypté. Répertoire non créé. Chaque fichier contient un en-tête de 8 octets avec des données IV uniques.
 Mot de passe :  Veuillez entrer le mot de passe Encfs actuel
 Veuillez entrer le nouveau mot de passe Encfs
 Entrez le numéro correspondant à votre choix :  Impossible de décrypter la clé de volume, mot de passe incorrect.
 Erreur de sauvegarde du fichier de configuration modifié.
 Exemple :
%s info ~/.crypt
 IV externes chainés désactivés, car les options "chaînage d'IV" et "IV uniques" sont requises pour cette option. Erreur de génération de la nouvelle clé de volume ! Merci de rapporter cette erreur. Les données IV du fichier sont chaînées à celles du nom de fichier
 Encodage de fichier "%s", version %i:%i:%i Noms de fichier encodés à l'aide du mode de chaînage IV.
 Cryptage du système de fichiers : "%s" version %i:%i:%i Pour plus d'information, voir la page de manuel d'encfs(1) Trouvé %i fichier invalide. Trouvé %i fichiers invalides. Dans le répertoire %s : 
 Nombre d'arguments incorrect pour la commande "%s" Erreur interne : exception de la boucle principale : %s Erreur interne : exception imprévue Erreur interne : impossible d'exécuter le programme Erreur interne : erreur de fork() Erreur interne : erreur de socketpair() Mot de passe invalide
 Sélection invalide. Taille de clé : %i bits Erreur de comparaison MAC dans le bloc %li Erreur de comparaison MAC, impossible de lire. Mode de configuration manuelle sélectionné Un ou plusieurs arguments manquants, abandon. Interface de codage de nom non supportée Nouveau mot de passe :  Note : vous avez demandé un mode mono-thread, 
mais un délai d'inactivité a été spécifié. 
Le système de fichiers fonctionnera en mode 
mono-thread, mais des threads seront néanmoins 
utilisés pour la vérification d'inactivité. Vous devez entrer un mot de passe pour votre système de fichiers.
Vous devez vous en souvenir, car il n'existe aucun mécanisme de récupération.
Toutefois, le mot de passe peut être changé plus tard à l'aide d'encfsctl.

 Configuration paranoïaque sélectionnée. Les mots de passe ne correspondent pas, veuillez réessayer.
 Veuillez choisir l'une des options suivantes :
 entrez "x" pour le mode de configuration expert,
 entrez "p" pour le mode paranoïaque préconfiguré,
 toute autre entrée ou une ligne vide sélectionnera le mode normal.
?>  Veuillez choisir une taille de clé en bit. 
L'algorithme que vous avez sélectionné supporte 
des clés de %i à %i bits par paliers de %i bits.
Par exemple :  Veuillez choisir une taille de bloc en octets. 
L'algorithme que vous avez sélectionné supporte 
des blocs de %i à %i octets par paliers de %i octets.
Ou appuyez sur entrée pour la valeur par défaut (%i octets).
 Algorithme sélectionn "%s" Taille de clé sélectionnée :  Impossible de trouver l'algorithme pour la 
configuration prédéfinie. Retour au mode de 
configuration manuelle. Configuration normale sélectionnée. La configuration chargée n'est pas compatible avec l'option --reverse
 Le répertoire "%s" n'existe pas. Faut-il le créer ? (y,N)  L'interface d'encodage de nom de fichier demandée n'est pas disponible. Les algorithmes suivants sont disponibles : Les algorithmes d'encodage de noms de fichiers suivants sont disponibles : L'interface de cryptage demandée n'est pas disponible
 L'interface de codage de nom de fichier demandée n'est pas disponible.
 Cette version de EncFS ne peut manipuler des systèmes de fichiers créés avant le 13 août 2004 Impossible de créer le répertoire :  Impossible de trouver le cryptage %s, version %i:%i:%i Impossilbe de trouver l'interface nameio %s, version %i:%i:%i Impossible de trouver le cryptage "%s"
 Impossible d'initialiser le système de fichiers encrypté - vérifier le chemin.
 Impossible d'instancier le cryptage %s, taille de clé %i, taille de bloc %i Impossible de charger ou de lire le fichier de configuration
 Impossible de trouver le point de montage, abandon. Impossible de trouver le répertoire racine, abandon. Démontage du système de fichiers inactif %s Utilisation :
 Utilisation :  %s [options] repRacine pointDeMontage [--[Options de montage FUSE]] Utilisation de blocs de taille %i octets pour le système de fichiers Utilisation d'une clé de taille %i bits Vérifier le mot de passe :  Configuration version 3; crée par %s
 Configuration version 4; crée par %s
 Configuration version 5; crée par %s (%i)
 Configuration version 6; crée par %s (%i)
 Clé de volume mise à jour avec succès.
 Lors de l'utilisation du mode démon, vous devez utiliser des chemins absolus (commençant par '/') Les mots de passe de longeur nulle ne sont pas permis
 Le répertoire %s n'existe pas.
 encfs [options] repRacine pointDeMontage -- [Options de montage de FUSE]
les options de montage de FUSE valides suivent :
 encfs version %s encfsctl version %s taille du bloc de système de fichiers :  Erreur de fuse. Problèmes courants :
 - module noyau fuse non installé (faites "modprobe fuse")
 - options invalides -- voir le message d'utilisation
 Erreur de getopt : %i Commande invalide "%s" erreur de troncature : %i octets lu, bloc partiel de %i 