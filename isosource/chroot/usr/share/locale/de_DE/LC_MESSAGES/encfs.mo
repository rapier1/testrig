��    w      �  �   �      
     
  ]   9
  .   �
  1   �
  1   �
  (   *  "   S  '   v  -   �  �   �  R   c      �    �     �     �  *     )   6     `     x  B   �  >   �  S     P  e     �  )   �  2   �     (  �   @  U     S   d     �     �  6   �     %     6     T  /   n  .   �  #   �     �  j     <   x  (   �  )   �  *     )   3  /   ]  .   �     �  .   �  3   �  +   2  &   ^     �  #   �     �     �     �  #   �  (   "  #   K  (   o  4   �  #   �     �  �     �   �      �  *   �  �   �  �   �     $  �   3     �     �  l   �      l  :   �  ?   �  �    :   �  .   �  9     ?   <  0   |  9   �  K   �     3   *   P   4   {   %   �   8   �   ;   !  $   K!  '   p!  *   �!  *   �!     �!  @   �!  '   7"     _"     y"  '   �"  '   �"  5   �"  !   #  M   9#  !   �#     �#  \   �#     $$     5$     I$  {   a$     �$     �$  +   %  4   0%    e%  '   h'  x   �'  =   	(  L   G(  S   �(  >   �(  (   ')  ,   P)  ;   })  �   �)  o   Y*  )   �*  #  �*     ,     .,  2   D,  5   w,     �,     �,  M   �,  >   2-  i   q-  �  �-     ^/  -   u/  2   �/     �/  �   �/  m   �0  W   K1  2   �1     �1  >   �1     12  "   B2     e2  '   �2  O   �2  ;   �2     83  z   U3  V   �3  /   '4  +   W4  1   �4  4   �4  ?   �4  =   *5     h5  .   }5  4   �5  ,   �5  :   6  &   I6  ,   p6     �6     �6     �6  !   �6  &   7  '   *7  +   R7  Z   ~7  0   �7     
8  �   !8  �   �8  !   �9  0   �9  �   &:  �   �:  "   �;  �   �;     �<     �<  �   �<      A=  >   b=  E   �=  m  �=  D   U?  <   �?  K   �?  S   #@  D   w@  P   �@  _   A  *   mA  7   �A  ;   �A  C   B  I   PB  i   �B  3   C  5   8C  8   nC  =   �C     �C  M   �C  .   <D  %   kD     �D  )   �D  )   �D  6   E  0   9E  Q   jE     �E      �E  ^   �E     VF     gF     {F  �   �F     /G     AG  :   ZG  ;   �G            *           R      9      ,      o   g   O   i   8              3   +   n   I   G   [      ;      u   t   !               e       :   Z          T       k      5                B   _   ]   "              s   N       2      d          %              )   h   J      v       S   
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
PO-Revision-Date: 2009-02-22 00:23+0000
Last-Translator: Moritz Baumann <Unknown>
Language-Team: German (Germany) <de_DE@li.org>
Language: de_DE
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n != 1;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
X-Rosetta-Version: 0.1
   -- Kennwort für Datenträger ändern   -- Kennwort für Datenträger ändern, nehme Passwort von der Standardeingabe
	Es erscheint keine Eingabeaufforderung.   -- einen Dateinamen entschlüsseln und Textversion ausgeben   -- entschlüsselt die Datei und gibt den Inhalt in der Standardausgabe aus   -- entschlüsselt einen Datenträger und speichert das Ergebnis unter dem Pfad ab   -- einen Dateinamen verschlüsseln und das Ergebnis ausgeben   -- Versionsnummer ausgeben und beenden   -- Informationen anzeigen (Standardbefehl)   -- Nicht-dekodierbare Dateinamen im Datenträger anzeigen   --extpass=PROGRAMM	Benutze PROGRAMM für die Passworteingabe

Beispiel, binde den verschlüsselten Speicher ~/.crypt in ~/crypt ein:
encfs ~/.crypt ~/crypt

   --public		verhält sich wie ein normales Mehrbenutzer-Dateisystem
			(encfs muss als root aufgerufen werden)
   --reverse		umgekehrte Verschlüsselung
   -v, --verbose		verbose: Gib encfs Debug-Nachrichten aus
-i, --idle=MINUTEN	Nach MINUTEN automatisch ausbinden (umount)
--anykey		Nicht die Gültigkeit eines Schlüssels prüfen
--forcedecode		Daten trotz eines Fehlers entschlüsseln
			(für Dateisysteme, die MAC-Block-Anfänge benutzen)
  (NICHT unterstützt)
  (verwende %i:%i:%i)
  -- unterstützt Blockgrößen von %i bis %i Bytes  -- unterstützt Schlüssellängen von %i bis %i Bits  -- Blockgröße %i Bytes  -- Schlüssellänge %i Bits %s (Wurzelverzeichnis)
  -- zeige Informationen über das Dateisystem, oder 
 -------------------------- WARNUNG
--------------------------
 Ein wirklich altes EncFS Dateisystem wurde gefunden.
Es wird in dieser EncFS Version nicht unterstützt.
 Sollen jedem Block-Vorspann Zufallsbytes hinzugefügt werden?
Das wird die Leistung verringern, aber sicherstellen, dass die
Blöcke unterschiedliche Authentifizierungscodes verwenden. Das gleiche
Resultat mit geringerer Leistungseinbuße entsteht, wenn die dateiabhängigen Initialisierungsvektoren eingeschaltet werden.
Auswahl der Anzahl der Bytes, von 0 (Keine Zufallsbytes) bis 8:  Blockgröße: %i Bytes Blockgrösse: %i Bytes + %i Byte MAC-Vorspann Blockgröße: %i Bytes, enthält %i Bytes MAC-Kopf Build: encfs Version %s Allgemeine Optionen:
  -H			Zeige optionale FUSE-Mountoptionen
  -s			Deaktiviere Multi-Thread-Operationen
  -f			Im Vordergrund laufen (Keinen Dämon abspalten).
			Fehler an die Standardfehlerausgabe (stderr) statt an das Syslog senden
 Konfigurationsdatei mit Unterversion %i gefunden. Diese Version von Encfs unterstützt nur bis zu Version %i. Konfiguration abgeschlossen. Das angelegte Dateisystem hat die
folgenden Eigenschaften: Neues verschlüsselter Datenträger wird angelegt. Verzeichnis nicht angelegt. Jede Datei enthält 8 Bytes Vorspann mit einmaligen IV-Daten.
 EncFS-Passwort:  Aktuelles Encfs-Passwort eingeben
 Neues Encfs-Passwort eingeben
 Geben Sie die Nummer Ihrer Auswahl an:  Fehler beim Entschlüsseln des Dateisystemschlüssels, das Passwort ist falsch
 Fehler beim Speichern der geänderten Konfigurationsdatei.
 Beispiel: 
%s info ~/.crypt
 Externe IV-Verkettung abgeschaltet, da sowohl 'IV-Verkettung'
als auch 'Einmaliger IV' für diese Option benötigt werden. Fehler beim Erzeugen des neuen Dateisystemschlüssels! Bitte melden Sie diesen Fehler. Dateidaten-IV ist mit Dateinamen-IV verkettet.
 Dateinamenkodierung: "%s", Version %i:%i:%i Dateinamenkodierung benutzt IV-Verkettungsmodus.
 Dateisystem-Verschlüsselung: "%s", Version %i:%i:%i Weitere Informationen finden sich in der Handbuchseite encfs(1) %i ungültige Datei gefunden. %i ungültige Dateien gefunden. Im Verzeichnis %s: 
 Falsche Anzahl von Parametern für Befehl "%s" Interner Fehler: Ausnahmefehler im Hauptprogramm: %s Interner Fehler: Unerwarteter Ausnahmefehler Interner Fehler: Ausführung des Programmes fehlgeschlagen Interner Fehler: fork() fehlgeschlagen Interner Fehler: socketpair() fehlgeschlagen Ungültiges Paßwort
 Ungültige Auswahl. Schlüssellänge: %i Bits MAC Vergleichsfehler im Block %li MAC Vergleichsfehler, verweigere Lesen Manueller Konfiguration-Modus gewählt. Ein oder mehrere Parameter fehlen, Abbruch. Passwort Programm muss gesetzt werden, wenn Dateisystem bei Bedarf eingehängt werden soll Namenskodierungsschnittstelle nicht unterstützt Neues EncFS-Passwort:  Hinweis: Single-Thread-Modus wurde angefordert, aber es wurde ein
Leerlauftimeout angegeben. Das Dateisystem wird im
Single-Thread-Modus arbeiten, aber Threads werden weiterhin zur
Überprüfung auf Leerlauf verwendet. Nun wird ein Passwort für das Dateisystem benötigt.
Da es keinen Mechanismus zur Wiederhestellung gibt, müssen Sie
sich an das Kennwort erinnern! Das Kennwort kann mit encfsctl
nächträglich geändert werden.

 Paranoide Einstellungen gewählt. Passwörter verschieden, bitte erneut versuchen
 Bitte wählen Sie eine der folgenden Optionen:
 "x" für den Experten-Modus,
 "p" für den vorkonfigurierten Paranoia-Modus,
 etwas anderes oder eine Leerzeile wählt den Standard-Modus.
?>  Bitte eine Schlüssellänge in Bits wählen. Der Algorithmus, den
Sie gewählt haben, unterstützt Grössen von %i bis %i Bits
(in Schritten von %i Bits).
Beispiel:  Erneutes einhängen fehlgeschlagen Wählen Sie eine Blockgröße (in Bytes) aus. Der ausgewählte Algorithmus
unterstützt Größen von %i bis %i Bytes in Schritten von %i Bytes.
Oder drücken Sie Enter, um die Vorgabe (%i Bytes) zu übernehmen
 Gewählter Algorithmus "%s" Gewählte Schlüssellänge:  Kann den Verschlüsselungalgorithmus für die vordefinierte Konfiguration leider nicht finden...
Wechsele deshalb zum manuellen Modus. Standard-Konfiguration gewählt. Die geladene Konfiguration ist mit --reverse nicht kompatibel
 Das Verzeichnis "%s" existiert nicht. Soll es angelegt werden? (y,N)  Die externe Initialisierungsvektor-Verkettung wurde ausgewählt.
Mit dieser Option können keine Hard-Links verwendet werden.
Bei manchen Programmen (z.B. 'mutt' und 'procmail') kann dies zu Fehlern führen. 
Weitere Informationen befinden sich auf der Encfs-Mailingliste.
Wenn Sie diese Option ändern wollen, drücken sie STRG-C zum Abbrechen und beginnen erneut. Die Schnittstelle zur Kodierung des Dateinamens ist nicht verfügbar Die folgenden Verschlüssellungsalgorithmen sind verfügbar: Die folgenden Verschlüsselungsalgorithmen für Dateinamen sind verfügbar: Das verschlüsselte Verzeichnis darf kein Unterverzeichnis vom Einhängepunkt sein. Die angeforderte Verschlüsselungsschnitstelle ist nicht verfügbar
 Die angeforderderte Schnittstelle zur Dateinamenkodierung ist
nicht verfügbar.
 Diese Version von EncFS unterstützt keine Dateisysteme, die vor dem 13.08.2004 angelegt wurden Verzeichnis konnte nicht angelegt werden:  Kann Verschlüsselung %s nicht finden, Version %i:%i:%i Kann nameio-Schnittstelle %s nicht finden, Version %i:%i:%i Konnte angegebenen Verschlüsselungsalgorithmus "%s" nicht finden.
 Kann das verschlüsselte Dateisystem nicht anlegen - Bitte Pfad prüfen.
 Kann keine Instanz des Verschlüsselungsalgorithmuses %s, Schlüsselgrösse %i, Blockgrösse %i erstellen Kann Konfigurationsdatei nicht laden oder einlesen
 Einhängepunkt konnte nicht gefunden werden, Abbruch. Wurzelverzeichnis konnte nicht gefunden werden, Abbruch. Das Dateisystem %s wird aufgrund von Inaktivität ausgehängt Aufruf:
 Aufruf: %s [Optionen] Wurzelverzeichnis Mountpunkt [-- [FUSE Mount-Optionen]] Verwende Dateisystem-Blockgröße von %i Bytes Verwende Schlüssellänge von %i Bits EncFS-Passwort bestätigen:  Version 3 Konfiguration; angelegt von %s
 Version 4 Konfiguration; angelegt von %s
 Verion 5 Konfiguration; angelegt von %s (Revision %i)
 Dateisystemschlüssel erfolgreich aktualisiert.
 Für den Dämon-Modus müssen absolute Pfade (beginnend mit '/') angegeben werden Leeres Kennwort verboten
 Verzeichnis %s existiert nicht.
 encfs [Optionen] Quellverzeichnis Zielverzeichnis -- [FUSE-Optionen]
Mögliche FUSE-Optionen:
 encfs Version %s encfsctl-Version %s Dateisystem-Blockgröße:  fuse ist fehlgeschlagen. Häufige Ursachen:
 - das fuse Kernelmodul ist nicht geladen (modprobe fuse)
 - ungültige Optionen -- siehe Aufruf-Übersicht
 getopt Fehler: %i Ungültiger Befehl: "%s" Option '--public' ignoriert für alle Benutzer außer root Abschneiden gescheitert: Gelesen %i Bytes, Teilblock von %i 