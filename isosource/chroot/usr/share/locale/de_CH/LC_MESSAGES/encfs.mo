��    w      �  �   �      
     
  ]   9
  .   �
  1   �
  1   �
  (   *  "   S  '   v  -   �  �   �  R   c      �    �     �     �  *     )   6     `     x  B   �  >   �  S     P  e     �  )   �  2   �     (  �   @  U     S   d     �     �  6   �     %     6     T  /   n  .   �  #   �     �  j     <   x  (   �  )   �  *     )   3  /   ]  .   �     �  .   �  3   �  +   2  &   ^     �  #   �     �     �     �  #   �  (   "  #   K  (   o  4   �  #   �     �  �     �   �      �  *   �  �   �  �   �     $  �   3     �     �  l   �      l  :   �  ?   �  �    :   �  .   �  9     ?   <  0   |  9   �  K   �     3   *   P   4   {   %   �   8   �   ;   !  $   K!  '   p!  *   �!  *   �!     �!  @   �!  '   7"     _"     y"  '   �"  '   �"  5   �"  !   #  M   9#  !   �#     �#  \   �#     $$     5$     I$  {   a$     �$     �$  +   %  4   0%    e%  !   t'  J   �'  8   �'  L   (  S   g(  >   �(     �(     )  4   -)  �   b)  l   �)  )   b*  !  �*     �+     �+  2   �+  5   ,     D,     ^,  D   {,  >   �,  h   �,  �  h-     �.  -    /  0   ./     _/  �   w/  m   j0  V   �0  2   /1     b1  @   ~1     �1  &   �1  "   �1  '   2  F   B2  ;   �2     �2  v   �2  V   V3  /   �3  ,   �3  9   
4  +   D4  3   p4  =   �4     �4  .   �4  4   &5  ,   [5  9   �5  &   �5  ,   �5     6     ,6     @6  !   Z6  &   |6  )   �6  +   �6  Z   �6  >   T7     �7  �   �7  �   �8  #   [9  <   9  �   �9  �   z:  "    ;  �   C;     <     1<  q   N<  #   �<  >   �<  E   #=  �  i=  D   �>  <   8?  K   u?  V   �?  E   @  W   ^@  _   �@  .   A  -   EA  ;   sA  C   �A  V   �A  K   JB  3   �B  )   �B  -   �B  ,   "C     OC  M   XC  .   �C  %   �C     �C  )   D  )   BD  7   lD  0   �D  Q   �D     'E      CE  ^   dE     �E     �E     �E  �   F     �F     �F  :   �F  ;   G            *           R      9      ,      o   g   O   i   8              3   +   n   I   G   [      ;      u   t   !               e       :   Z          T       k      5                B   _   ]   "              s   N       2      d          %              )   h   J      v       S   
   7   @   >   .   V   c       C       ^   	   (   $          m              F       #   A   w          b   <   M       P   6   U   H   `           Y      Q      W   0   ?   -              E           q           f   L          p   1   l   X   D   \               &   4       /                 r       K      =   j              '   a      -- change password for volume   -- change password for volume, taking password from standard input.
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
For example:  Remount failed Select a block size in bytes.  The cipher you have chosen
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
PO-Revision-Date: 2008-03-22 07:10+0000
Last-Translator: Oliver Laub <oliver.laub@web.de>
Language-Team: German (Switzerland) <de_CH@li.org>
Language: de_CH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n != 1;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
X-Rosetta-Version: 0.1
   -- wechsle Passwort für Volume   -- wechsle Passwort für Volume, übernehme Passwort von Standardeingabe   -- entschlüsselt Dateiname und zeigt Klartext Version   -- entschlüsselt die Datei und gibt den Inhalt in der Standardausgabe aus   -- entschlüsselt einen Datenträger und speichert das Ergebnis unter dem Pfad ab   -- einen Dateinamen verschlüsseln und das Ergebnis ausgeben   -- zeigt Versionsnummer   -- zeige Informationen   -- zeige nicht entschlüsselbare Dateien in Volume   --extpass=PROGRAMM	Benutzer PROGRAMM für die Paßworteingabe

Beispiel, binde den Roh-Speicher ~/.cryp in ~/crypt ein:
encfs ~/.crypt ~/crypt

   --public		verhält sich wie ein typisches Multi-User Dateisystem
			(encfs muss als Benutzer root laufen)
   --reverse		umgekehrte Verschlüsselung
   -v, --verbose		verbose: Gib encfs debug Nachrichten aus
  -i, --idle=MINUTEN	Nach MINUTEN automatisch ausbinden (umount)
  --anykey		Pürfe nicht die gültigkeit eines Schlüssels
  --forcedecode		Decodiere Daten trotz eines Fehlers
			(für Dateisysteme die MAC block headers benutzen)
  (NICHT unterstützt)
  (verwende %i:%i:%i)
  -- Unterstützt Blockgrössen von %i bis %i bytes  -- Unterstützt Schlüssellängen von %i bis %i bits  -- Blockgrösse %i bytes  -- Schlüssellänge %i Bits %s (root dir)

  -- zeigt Information über das Dateisystem oder 
 
 -------------------------- WARNUNG --------------------------
 in wirklich altes EncFS Dateisystem wurde gefunden.
Es wird in dieser EncFS Version nicht unterstützt.
 Sollen jedem Block-Vorspann Zufallsbytes hinzugefügt werden?
Das wird die Leistung veringern, aber sicherstellen, dass die
Blöcke unterschiedliche Sicherheitscodes verwenden. Sie können das selbe
Resultat mit geringeren Leistungseinbußen erzielen, indem Sie die dateispezifischen Initialisierungsvektoren aktivieren.
Auswahl der Anzahl der Bytes, von 0 (Keine Zufallsbytes) bis 8:  Blockgröße: %i Byte Blockgröße: %i Bytes + %i Byte MAC-Vorspann Blockgröße: %i Byte, enthält %i Byte MAC-Kopf Build: encfs version %s Gemeinsame Optionen:
  -H			Anzeige optionaler FUSE Montageoptionen
  -s			Abschalten der multithreaded Operationen
  -f			Im Fordergrund laufen (Kein Dämon abspalten).
			Fehler an die Standardausgabe statt an das
			Systemprotokoll senden
 Konfigurationsdatei mit Unterversion %i gefunden. Diese Version von Encfs unterstützt nur bis zu Version %i. Konfiguration beendet. Das zu erstellende Dateisystem hat 
die folgende Eigenschaften: Neuer verschlüsselter Datenträger wird erstellt. Verzeichnis nicht erstellt. Jede Datei enthält acht Byte Vorspann mit einmaligen IV Daten.
 EncFS Passwort:  Eingabe des aktuellen Encfs Passwords
 Eingabe des neuen Encfs Passworts
 Geben Sie die Nummer Ihrer Auswahl an:  Fehler beim Entschlüsseln des Datenträgers! Das Paßwort ist falsch
 Fehler beim Speichern der geänderten Konfigurationsdatei.
 Beispiel: 

%s ~/.crypt

 Externe IV Verkettung abgeschaltet, da 'IV Verkettung'
und 'einmalige IV' Merkmale für diese Option benötigt werden. Fehler beim Erzeugen des neuen Dateisystemschlüssels! Bitte melden Sie diesen Fehler. Dateidaten IV sind mit Dateiname IV verkettet.
 Dateinamenskodierung: "%s", Version %i:%i:%i Dateinamensverschlüsselung benutzt IV Verkettungsmodus.
 Dateisystem Chiffre: "%s", Version %i:%i:%i Für weitere Informationen, siehe man-Page encfs(1) %i ungültige Datei gefunden. %i ungültige Dateien gefunden. Im Verzeichnis %s: 
 Falsche Anzahl von Parametern für Befehl "%s" Interner Fehler: Ausnahmefehler im Hauptprogramm: %s Interner Fehler: Unerwarteter Ausnahmefehler Interner Fehler: Ausführung des Programms fehlgeschlagen Interner Fehler: fork() fehlgeschlagen Interner Fehler: socketpair() fehlgeschlagen Ungültiges Passwort
 Ungültige Auswahl. Schlüssellänge: %i Bits MAC Vergleichsfehler im Block %li MAC Vergleichsfehler, verweigere Lesen Manuelle Konfigurationsmodus ausgewählt. Ein oder mehrere Argumente fehlen, Abbruch. Paßwort Programm muss gesetzt werden, wenn Dateisystem bei Bedarf eingehängt werden soll Schnittstelle zur Kodierung des Dateinamens nicht unterstützt Neues Encfs Passwort:  Hinweis: Single-Thread-Modus wurde angefordert, aber es wurde ein
Leerlauftimeout angegeben. Das Dateisystem wird im
Single-Thread-Modus arbeiten, aber Threads werden weiterhin zur
Überprüfung auf Leerlauf verwendet Nun wird ein Kennwort für das Dateisystem benötigt.
Da es keinen Mechanismus zur Wiederhestellung gibt, müssen Sie
sich an das Kennwort erinnern! Das Kennwort kann mit encfsctl
nächträglich geändert werden.

 Paranoia Konfiguration ausgewählt. Passwörter stimmen nicht überein, Neueingabe erforderlich
 Bitte wählen Sie eine der folgenden Optionen:
 "x" für den Expertenmodus,
 "p" für den vorkonfigurierten Paranoia-Modus,
 etwas anderes oder eine Leerzeile wählt den Standard-Modus.
?>  Bitte eine Schlüssellänge in Bits wählen. Der Algorithmus, den
Sie gewählt haben, unterstützt Grössen von %i bis %i Bits
(in Schritten von %i Bits).
Beispiel:  Erneutes Einhängen fehlgeschlagen Wählen Sie eine Blockgröße (in Byte) aus. Der ausgewählte Algorithmus
unterstützt Größen von %i bis %i Byte in Schritten von je %i Byte.
Oder drücken Sie Enter, um die Vorgabe (%i Byte) zu übernehmen
 Gewählter Algorithmus "%s" Gewählte Schlüssellänge:  Keine Verschlüsselungsmethode für die gewählte Voreinstellung vorhanden...
Wechsel zu manuellen Einstellungen. Standard Konfiguration ausgewählt. Die geladene Konfiguration ist mit --reverse nicht kompatibel
 Das Verzeichnis "%s" existiert nicht. Soll es erstellt werden? (y,N)  Die Option 'externe Vektorverkettung bei der Initialisierung' wurde aktiviert.
Diese Option verhindert die Nutzung von Hardlinks. Ohne Hardlinks
können manche Programme nicht arbeiten, wie zum Beispiel 'mutt'
oder 'procmail'. Mehr Informationen dazu finden Sie in der encfs-
Mailingliste. Wenn Sie eine andere Einstellung wählen wollen, drücken
Sie CTRL-C (STRG-C) und starten Sie von vorn. Die Schnittstelle zur Kodierung des Dateinamens ist nicht verfügbar Die folgenden Verschlüssellungsalgorithmen sind verfügbar: Die folgenden Verschlüsselungsalgorithmen für Dateinamen sind verfügbar: Das Roh-Verzeichnis scheint kein Unterverzeichnis des verwendeten Mountpunktes zu sein Die angeforderte Verschlüsselungsschnittstelle ist nicht verfügbar
 Die angeforderderte Schnittstelle zur Datennamenverschlüsselung ist
nicht verfügbar.
 Diese Version von EncFS unterstützt keine Dateisysteme, die vor dem 13.08.2004 angelegt wurden Erstellung des Verzeichnisses fehlgeschlagen:  Kann Ziffer %s nicht finden, Version %i:%i:%i Kann nameio-Schnittstelle %s nicht finden, Version %i:%i:%i Konnte angegebenen Verschlüsselungsalgorithmus "%s" nicht finden.
 Initialisierung des verschlüsselten Dateisystems fehlgeschlagen - Pfad überprüfen.
 Kann keine Chiffre für %s erstellen. Schlüsselgrösse %i, Blockgrösse %i Kann Konfigurationsdateu nicht laden oder erkennen
 Anhängpunkt nicht auffindbar, breche ab. root Verzeichnis nicht auffindbar, breche ab. Dateisystem %s wegen Inaktivität abgehängt Aufruf:
 Aufruf: %s [Optionen] Wurzelverzeichnis Mountpunkt [-- [FUSE Mount Optionen]] Verwende Dateisystem-Blockgröße von %i Bytes Benutze Schlüsselgrösse von %i bits Encfs Passwort bestätigen:  Version 3 Konfiguration; erstellt von %s
 Version 4 Konfiguration; erstellt von %s
 Version 5 Konfiguration; erstellt von %s (Revision %i)
 Dateisystemschlüssel erfolgreich aktualisiert.
 Für den Daemon-Modus müssen absolute Pfade (beginnend mit '/') angegeben werden Nullpasswort nicht erlaubt
 Verzeichnis %s existiert nicht.
 encfs [Optionen] Quellverzeichnis Zielverzeichnis -- [FUSE-Optionen]
Mögliche FUSE-Optionen:
 encfs Version %s encfsctl version %s Dateisystem-Blockgröße:  fuse ist fehlgeschlagen. Häufige Ursachen:
 - das fuse Kernelmodul ist nicht geladen (modprobe fuse)
 - ungültige Optionen -- siehe Aufruf-Übersicht
 getopt Fehler: %i ungültiger Befehl: "%s" die Option '--public' wurde ignoriert, Sie sind nicht root Abschneiden gescheitert: Gelesen %i Bytes, Teilblock von %i 