��    �      <  �   \      (     )  ]   I  .   �  1   �  1     (   :  "   c  '   �     �  -   �  �   �  R   �      �    �            *   )  )   T     ~     �  B   �  >   �  S   /  P  �     �  )   �  2        F  �   ^  U   ,  S   �     �     �  6     &  C  `   j  �   �  &  n  �   �     s     �     �  /   �     �        .     #   D     h  j   �  <   �  (   ,  )   U  )     *   �  )   �  /   �  .   .     ]     p  .   �  3   �  +   �  &        D  #   b     �     �     �  #   �  (   �  #   
  (   .  4   W  #   �     �  �   �  �   w      G  *   h  �   �  �   [      �      �   �   !     �!     �!  l   �!      >"  :   _"  ?   �"  �  �"  :   j$  .   �$  9   �$  ?   %  0   N%  9   %  K   �%     &  *   "&  4   M&  %   �&  8   �&  ;   �&  $   '  '   B'  *   j'  *   �'     �'  @   �'      	(  '   *(     R(     l(  '   �(  '   �(  5   �(  5   
)  !   @)  M   b)  !   �)     �)  \   �)     M*     ^*     r*  {   �*     +     +  +   -+  4   Y+  �  �+  '   �-  {   �-  :   2.  L   m.  R   �.  >   /  (   L/  .   u/     �/  G   �/  �   0     �0  �   11  m  �1     (3     ?3  ?   U3  B   �3     �3  (   �3  M   4  >   h4  l   �4  �  5     �6  -   �6  0   �6     7    )7  i   28  W   �8  2   �8     '9  @   B9  a  �9  �   �:  �   �;  �  v<  !  )>     K?  "   \?     ?  '   �?  &   �?      �?  F   @  ;   U@     �@  v   �@  V   %A  /   |A  @   �A  ,   �A  9   B  +   TB  3   �B  =   �B     �B     C  2   'C  4   ZC  ,   �C  9   �C  &   �C  ,   D     JD     `D     tD  !   �D  &   �D  $   �D  +   �D  Y   (E  >   �E     �E  �   �E  �   �F  &   �G  ?   �G  �   �G  �   �H  "   eI     �I  �   �I     zJ     �J  �   �J  %   CK  >   iK  G   �K  �  �K  D   zM  ;   �M  Q   �M  V   MN  I   �N  W   �N  _   FO  *   �O  -   �O  ;   �O  C   ;P  L   P  K   �P  A   Q  1   ZQ  8   �Q  9   �Q     �Q  J   R  ,   WR  A   �R  -   �R     �R  )   S  )   ;S  7   eS  ;   �S  E   �S  Q   T  &   qT      �T  i   �T     #U     4U     HU  �   cU     �U     V  :   'V  ;   bV         N      9   '   e       ]   p   -       G   �   j             H   [          U   y   g                 !   <      �   M   P       X      ~   ;      +              >   x          a   %   h      A           z   *   V          s   `   S      k   Z           {   T   }   J   i   .   B       K      2   O       �   E   �         W   ^       ,   w   Y       8   m      R   6   4   o   I   c                        )   |                  u       v   7   L   /   @       b   #   $           
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
 getopt error: %i invalid command: "%s" option '--public' ignored for non-root user truncate failure: read %i bytes, partial block of %i Project-Id-Version: Encrypted Filesystem for Linux
Report-Msgid-Bugs-To: https://translations.launchpad.net/encfs/main/+pots/encfs
PO-Revision-Date: 2013-02-23 13:34+0000
Last-Translator: Moritz Baumann <Unknown>
Language-Team: German (Germany) <de_DE@li.org>
Language: de
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n != 1;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
X-Rosetta-Version: 0.1
   -- Passwort für Datenträger ändern   -- Passwort für Speichermedium ändern (wird von der Standardeingabe gelesen).
		Es erscheint keine Eingabeaufforderung.   -- entschlüsselt den Namen und gibt die Textversion aus   -- entschlüsselt die Datei und gibt den Inhalt an der Standardausgabe aus   -- einen Datenträger entschlüsseln und das Ergebnis unter dem Pfad abspeichern   -- einen Dateinamen verschlüsseln und das Ergebnis ausgeben   -- Versionsnummer ausgeben und beenden   -- Informationen anzeigen (Standardkommando)   -- Schlüssel zeigen   -- Nicht entschlüsselbare Dateinamen auf dem Speichermedium anzeigen   --extpass=PROGRAMM	Angegebenes PROGRAMM zur Passworteingabe benutzen

Beispiel: Um den verschlüsselten Speicher ~/.crypt in ~/crypt einzuhängen:
encfs ~/.crypt ~/crypt

   --public		Wie ein typisches Mehrbenutzer-Dateisystem verhalten:
			Dazu muss encfs vom Benutzer »root« ausgeführt werden.
   --reverse		Als Quelle unverschlüsselte Daten annehmen und diese in
			verschlüsselter Form am Einhängepunkt zur Verfügung stellen
   -v, --verbose		Ausführlichen Modus verwenden:
			Meldungen zur Fehlerdiagnose von EncFS ausgeben.
  -i, --idle=MINUTEN	Nach der angegebenen Zeit ohne Aktivität aushängen
  --anykey		Gültigkeit eines Schlüssels nicht überprüfen
  --forcedecode		Daten auch bei Erhalt eines Fehlers entschlüsseln:
			Nützlich bei Dateisystemen, die MAC-Block-Header haben.
  (NICHT unterstützt)
  (verwende %i:%i:%i)
  -- Eine Blockgröße zwischen %i und %i Byte wird unterstützt  -- Eine Schlüssellänge zwischen %i und %i Bit wird unterstützt  -- Blockgröße %i Byte  -- Die Schlüssellänge beträgt %i Bit %s (Wurzelverzeichnis)
  -- zeige Informationen über das Dateisystem, oder 
 -------------------------- WARNUNG --------------------------
 Ein sehr altes EncFS-Dateisystem wurde gefunden, 
das in dieser EncFS-Version nicht mehr unterstützt wird.
 Jedem Block-Header zufällige Bytes hinzufügen?
Das wird die Geschwindigkeit verringern, stellt jedoch sicher, dass Blöcke
unterschiedliche Authentifizierungscodes verwenden. Sie können diesen
gleichen Vorteil mit geringeren Leistungseinbußen erzielen, indem Sie
die Initialisierungsvektoren für jede Datei aktivieren.
Anzahl der Bytes eingeben, von 0 (keine zufälligen Bytes) bis 8:  Blockgröße: %i Bytes Blockgrösse: %i Bytes + %i Byte MAC-Vorspann Blockgröße: %i Byte, enthält %i Byte MAC-Kopf Build: EncFS-Version %s Allgemeine Optionen:
  -H			Optionale FUSE-Mount-Optionen anzeigen
  -s			Parallelverarbeitung abschalten
  -f			Im Vordergrund ausführen (keinen Dienst starten):
			Fehlermeldungen werden an die Standardfehlerausgabe,
			anstatt an das Systemprotokoll gesendet.
 Konfiguration für Unterversion %i gefunden. Diese EncFS-Version unterstützt aber höchstens Version %i. Konfiguration abgeschlossen. Das angelegte Dateisystem hat die
folgenden Eigenschaften: Neuer verschlüsselter Datenträger wird erstellt. Kein Verzeichnis angelegt. Jede Datei enthält acht Byte Vorspann mit einmaligen IV Daten.
 Block-Authentifizierungscode-Header für jeden Block in Dateien aktivieren?
Dies wird den Speicherplatzbedarf für Dateien um ca. 12 Bytes pro Block
erhöhen sowie die Geschwindigkeit deutlich beeinträchtigen. Jedoch
bedeutet es, dass (fast) beliebige Veränderungen oder Fehler innerhalb
eines Blocks bemerkt werden und ein Lesefehler verursacht wird. »Durchreichen« von Dateilöchern (unverschlüsselt) ermöglichen?
Dies verhindert die Verschlüsselung beim Schreiben von Blöcken,
wenn Dateilöcher (Abschnitte mit Nullen) erzeugt werden. Verkettung der Initialisierungsvektoren für Dateinamen aktivieren?
Das wird die Verschlüsselung von Dateinamen vom vollständigen Pfad
abhängig machen, anstatt jedes Pfad-Element einzeln zu verschlüsseln. Verkettung der Initialisierungsvektoren von Dateinamen mit Headern aktivieren?
Das wird die Verschlüsselung von Datei-Inhalten vom vollständigen Pfad
abhängig machen. Nach dem Umbenennen einer Datei, wird sie sich solange
nicht mehr entschlüsseln lassen, bis sie von EncFS unter Verwendung
des richtigen Schlüssels umbenannt wurde.
Es werden keine harten Verweise in dem Dateisystem unterstützt,
wenn diese Option aktiviert ist. Initialisierungsvektoren für jede Datei aktivieren?
Dies erhöht den Speicherbedarf um etwa 8 Byte je Datei. Das sollte die
Geschwindigkeit nicht beeinflussen, außer evtl. bei Anwendungen, die
auf blockorientierte Datei-Eingabe und -Ausgabe angewiesen sind,
um ihre Leistung zu erzielen. EncFS-Passwort:  Aktuelles EncFS-Passwort eingeben
 Neues EncFS-Passwort eingeben
 Geben Sie die Nummer Ihrer Auswahl an:  Fehler beim Erstellen des Schlüssels
 Fehler beim Erstellen des Salts
 Fehler beim Entschlüsseln des Datenträgers! Das Passwort ist falsch
 Fehler beim Speichern der geänderten Konfigurationsdatei.
 Beispiel: 
%s info ~/.crypt
 Externe IV Verkettung abgeschaltet, da 'IV Verkettung'
und 'einmalige IV' Merkmale für diese Option benötigt werden. Fehler beim Erzeugen des neuen Dateisystemschlüssels! Bitte melden Sie diesen Fehler. Dateidaten IV sind mit Dateiname IV verkettet.
 Dateilöcher wurden zur verschlüsselten Ausgabe durchgereicht.
 Dateinamenskodierung: "%s", Version %i:%i:%i Dateinamensverschlüsselung benutzt IV Verkettungsmodus.
 Dateisystem Chiffre: "%s", Version %i:%i:%i Für weitere Informationen, siehe man-Page encfs(1) %i ungültige Datei gefunden. %i ungültige Dateien gefunden. Im Verzeichnis %s: 
 Ungültige Anzahl an Argumenten Falsche Anzahl von Argumenten für den Befehl "%s" Interner Fehler: Ausnahmefehler im Hauptprogramm: %s Interner Fehler: Unerwarteter Ausnahmefehler Interner Fehler: Ausführung des Programms fehlgeschlagen Interner Fehler: fork() fehlgeschlagen Interner Fehler: socketpair() fehlgeschlagen Ungültiges Passwort
 Ungültige Auswahl. Schlüssellänge: %i Bits MAC-Vergleichsfehler im Block %li MAC-Vergleichsfehler, verweigere Lesen Manuelle Einrichtung wurde gewählt. Ein oder mehrere Argumente fehlen, Abbruch. Passwortprogramm muss gesetzt werden, wenn Dateisystem bei Bedarf eingehängt werden soll Schnittstelle zur Kodierung des Dateinamens nicht unterstützt Neues EncFS-Passwort:  Hinweis: Single-Thread-Modus wurde angefordert, aber es wurde ein
Leerlauftimeout angegeben. Das Dateisystem wird im
Single-Thread-Modus arbeiten, aber Threads werden weiterhin zur
Überprüfung auf Leerlauf verwendet Nun wird ein Kennwort für das Dateisystem benötigt.
Da es keinen Mechanismus zur Wiederhestellung gibt, müssen Sie
sich an das Kennwort erinnern! Das Kennwort kann mit encfsctl
nächträglich geändert werden.

 Paranoia-Konfiguration wurde gewählt. Die Passwörter stimmen nicht überein, bitte erneut versuchen
 Bitte wählen Sie eine der folgenden Optionen:
 »x« für den Expertenmodus,
 »p« für den vorkonfigurierten Paranoia-Modus,
 etwas anderes oder nur Drücken der Eingabetaste wählt den Standardmodus.
?>  Bitte wählen Sie eine Schlüssellänge in Bit. Die von Ihnen gewählte Verschlüsselung
unterstützt Längen von %i bis %i Bits in %i Bit-Schritten.
Zum Beispiel:  Erneutes Einhängen fehlgeschlagen Salt-Größe: %i Bit Wählen Sie eine Blockgröße (in Byte) aus. Der ausgewählte Algorithmus
unterstützt Größen von %i bis %i Byte in Schritten zu je %i Byte.
Oder drücken Sie die Eingabetaste, um die Vorgabe (%i Byte) zu übernehmen.
 Gewählter Algorithmus »%s« Gewählte Schlüssellänge:  Keine Verschlüsselungsmethode für die vorgegebene Konfiguration gefunden …
Es wird deswegen mit einer manuellen Einrichtung fortgefahren. Standardkonfiguration wurde gewählt. Die geladene Konfiguration ist mit --reverse nicht kompatibel
 Das Verzeichnis »%s« existiert nicht. Soll es angelegt werden? (y,N)  Die Option 'externe Vektorverkettung bei der Initialisierung' wurde aktiviert.
Diese Option verhindert die Nutzung von Hardlinks. Ohne Hardlinks
können manche Programme nicht arbeiten, wie zum Beispiel 'mutt'
oder 'procmail'. Mehr Informationen dazu finden Sie in der encfs-
Mailingliste. Wenn Sie eine andere Einstellung wählen wollen, drücken
Sie CTRL-C (STRG-C) und starten Sie von vorn. Die Schnittstelle zur Kodierung des Dateinamens ist nicht verfügbar Die folgenden Verschlüsselungsalgorithmen sind verfügbar: Die folgenden Verschlüsselungsalgorithmen für Dateinamen stehen zur Verfügung: Das Roh-Verzeichnis scheint kein Unterverzeichnis des verwendeten Mountpunktes zu sein Die angeforderte Schnittstelle zur Verschlüsselung ist nicht verfügbar
 Die angeforderderte Schnittstelle zur Datennamenverschlüsselung ist
nicht verfügbar.
 Diese Version von EncFS unterstützt keine Dateisysteme, die vor dem 13.08.2004 angelegt wurden Verzeichnis konnte nicht angelegt werden:  Kann Ziffer %s nicht finden, Version %i:%i:%i Kann nameio-Schnittstelle %s nicht finden, Version %i:%i:%i Konnte das angegebene Verschlüsselungsverfahren "%s" nicht finden
 Verschlüsseltes Dateisystem kann nicht initialisiert werden - prüfe Pfad.
 Kann keine Chiffre für %s erstellen. Schlüsselgrösse %i, Blockgrösse %i Konfigurationsdatei kann nicht geladen oder interpretiert werden
 Mountpunkt konnte nicht gefunden werden, Abbruch. Wurzelverzeichnis konnte nicht gefunden werden, Abbruch. Dateisystem %s wird aufgrund von Inaktivität ausgehängt Verwendung:
 Aufruf: %s [Optionen] Basisverz. Einhängepunkt [-- [FUSE-Mount-Optionen]] PBKDF2 wird mit %i Wiederholungen angewendet Eine Blockgröße von %i Byte wird für das Dateisystem verwendet Eine Schlüssellänge von %i Bit wird benutzt EncFS-Passwort bestätigen:  Version 3 Konfiguration; erstellt von %s
 Version 4 Konfiguration; erstellt von %s
 Version 5 Konfiguration; erstellt von %s (Revision %i)
 Konfiguration der Version 6; erstellt von %s (Revision %i)
 Der Schlüssel für den Datenträger wurde erfolgreich aktualisiert.
 Für den Daemon-Modus müssen absolute Pfade (beginnend mit '/') angegeben werden Ein leeres Passwort ist nicht erlaubt
 Verzeichnis %s existiert nicht.
 encfs [Optionen] Basisverzeichnis Einhängepunkt -- [FUSE-Mount-Optionen]
Mögliche FUSE-Mount-Optionen:
 EncFS-Version %s encfsctl-Version %s Dateisystem-Blockgröße:  fuse ist fehlgeschlagen. Häufige Ursachen:
 - das fuse Kernelmodul ist nicht geladen (modprobe fuse)
 - ungültige Optionen -- siehe Aufruf-Übersicht
 getopt Fehler: %i Ungültiger Befehl: "%s" die Option '--public' wurde ignoriert, sie sind nicht root Abschneiden gescheitert: %i Bytes gelesen, Teilblock von %i 