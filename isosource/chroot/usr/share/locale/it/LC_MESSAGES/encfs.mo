��    �      <  �   \      (     )  ]   I  .   �  1   �  1     (   :  "   c  '   �     �  -   �  �   �  R   �      �    �            *   )  )   T     ~     �  B   �  >   �  S   /  P  �     �  )   �  2        F  �   ^  U   ,  S   �     �     �  6     &  C  `   j  �   �  &  n  �   �     s     �     �  /   �     �        .     #   D     h  j   �  <   �  (   ,  )   U  )     *   �  )   �  /   �  .   .     ]     p  .   �  3   �  +   �  &        D  #   b     �     �     �  #   �  (   �  #   
  (   .  4   W  #   �     �  �   �  �   w      G  *   h  �   �  �   [      �      �   �   !     �!     �!  l   �!      >"  :   _"  ?   �"  �  �"  :   j$  .   �$  9   �$  ?   %  0   N%  9   %  K   �%     &  *   "&  4   M&  %   �&  8   �&  ;   �&  $   '  '   B'  *   j'  *   �'     �'  @   �'      	(  '   *(     R(     l(  '   �(  '   �(  5   �(  5   
)  !   @)  M   b)  !   �)     �)  \   �)     M*     ^*     r*  {   �*     +     +  +   -+  4   Y+    �+  %   �-  r   �-  :   *.  G   e.  8   �.  0   �.  ,   /  .   D/     s/  6   �/  �   �/  e   y0     �0  :  �0     :2     M2  .   a2  ,   �2     �2     �2  L   �2  A   D3  j   �3  �  �3     �5  :   �5  B   �5     6  �   56  q   7  P   �7     �7     �7  Z   8  X  p8  y   �9  �   C:  �  %;  �   �<     �=  '   �=  %   �=  7   �=     1>     N>  F   i>  9   �>     �>  �   ?  P   �?  r   @  1   �@  /   �@  ]   �@  -   OA  L   }A  7   �A     B     B  .   3B  ?   bB  1   �B  /   �B  #   C  )   (C     RC     gC     }C  ,   �C  4   �C  &   �C  (    D  S   ID  4   �D     �D  �   �D  �   �E  (   �F  &   �F  �   �F  �   �G     uH     �H  �   �H     ZI     wI  |   �I  '   J  <   <J  8   yJ  �  �J  H   ]L  3   �L  @   �L  P   M  8   lM  M   �M  M   �M  !   AN  :   cN  E   �N  1   �N  L   O  U   cO  <   �O  5   �O  7   ,P  '   dP     �P  R   �P  *   �P  A   Q  /   RQ     �Q  (   �Q  (   �Q  7   �Q  7   )R  *   aR  ]   �R  ,   �R     S  p   4S     �S     �S  *   �S  �   �S     �T     �T  ;   �T  9   �T         N      9   '   e       ]   p   -       G   �   j             H   [          U   y   g                 !   <      �   M   P       X      ~   ;      +              >   x          a   %   h      A           z   *   V          s   `   S      k   Z           {   T   }   J   i   .   B       K      2   O       �   E   �         W   ^       ,   w   Y       8   m      R   6   4   o   I   c                        )   |                  u       v   7   L   /   @       b   #   $           
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
PO-Revision-Date: 2013-12-08 07:41+0000
Last-Translator: Gianfranco Frisani <gfrisani@libero.it>
Language-Team: Italian <it@li.org>
Language: it
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n != 1;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
X-Rosetta-Version: 0.1
   -- cambia la password per il volume   -- cambia la password per il volume, prendendo la password dallo standard input.
	Non viene emesso alcun prompt.   -- decodifica il nome e stampa la versione in puro testo   -- decodifica il file e mostra il suo contenuto sullo standard output   -- decifra un volume e scrive i risultati nel percorso   -- codifica un nome file e stampa il risultato   -- stampa il numero della versione ed esce   -- mostra informazioni (comando predefinito)   -- mostra la chiave   -- mostra nomi di file non decodificabili nel volume   --extpass=programma	utilizza un programma esterno per la richiesta della password

Esempio, per montare in ~/crypt con un'archiviazione raw in ~/.crypt :
    encfs ~/.crypt ~/crypt

   --public		funziona come un normale file system multiutente
			(encfs deve essere eseguito da root)
   --reverse		cifratura inversa
   -v, --verbose		stampa i messaggi di debug di encfs
  -i, --idle=MINUTI	smonta automaticamente dopo un periodo di inattività
  --anykey		non verifica se la chiave utilizzata è corretta
  --forcedecode		decodifica i dati anche in presenza di errori
			(per i file system che usano i blocchi di intestazione MAC)
  (NON supportato)
  (in uso %i:%i:%i)
  -- Supporta dimensioni blocco da %i a %i byte  -- Supporta lunghezze chiave da %i a %i bit  -- dimensione blocco %i byte  -- lunghezza chiave %i bit %s (directory radice)
  -- visualizza informazioni sul file system, oppure 
 -------------------------- ATTENZIONE --------------------------
 È stato trovato un file system EncFS molto vecchio. 
Non è più supportato in questa versione di EncFS.
 Aggiungere byte casuali a ciascuna intestazione del blocco?
In questo modo vengono compromesse le prestazioni, ma si
assicura che i blocchi abbiano diversi codici di autenticazione.
Notare che è possibile avere gli stessi benefici abilitando i
vettori di inizializzazione specifici per ciascun file con
una minore perdita di prestazioni. 
Scegliere un numero di byte, da 0 (nessun byte casuale) a 8:  Dimensione blocco: %i byte Dimensione blocco: %i byte + %i byte dell'intestazione MAC Dimensione blocco: %i byte, compresi %i byte dell'intestazione MAC Build: encfs versione %s Opzioni comuni:
  -H			mostra le opzioni di mount di FUSE
  -s			disabilita le operazioni multithread
  -f			esegue nello sfondo (non avvia il demone).
			I messaggi di errore saranno mandati sullo stderr
			invece che al syslog.
 Trovata una sotto-versione di configurazione %i, ma questa versione di encfs supporta solo fino alla versione %i. Configurazione terminata. Il file system da creare avrà
le seguenti proprietà: Creazione nuovo volume cifrato. Directory non creata. Ogni file contiene 8 byte di intestazione con dati del vettore di inizializzazione unici.
 Abilitare intestazioni di codice d'autenticazione del blocco
per ogni blocco in un file? In questo modo vengono aggiunti 12 byte per blocco
ai requisiti di archiviazione di un file e ne compromette significativamente le
prestazioni, ma quasi tutte le modifiche o gli errori all'interno di un blocco
sono rilevati e causano un errore di lettura. Lasciare inalterati i file frammentati?
Ciò evita di scrivere blocchi criptati quando i file frammentati vengono creati. Abilitare la concatenazione del vettore di inizializzazione dei nomi dei file?
In questo modo la codifica del nome del file dipende dal percorso completo 
piuttosto che dal codificare ogni elemento del percorso singolarmente. Abilitare la concatenazione del nome del file all'intestazione del vettore di inizializzazione?
In questo modo la codifica dei dati dipende dal percorso completo del file.
Se un file viene rinominato, non verrà decodificato a meno che non sia
stato rinominato da encfs con la chiave adatta.
Se questa opzione è abilitata, i collegamenti non saranno supportati
all'interno del file system. Abilitare i vettori di inizializzazione per file?
In questo modo vengono aggiunti 8 byte ai requisiti di archiviazione.
Non dovrebbe compromettere le prestazioni eccetto con applicazioni
che si basano su I/O "block-aligned" sui file . Password di EncFS:  Inserire la password attuale per EncFS
 Inserire la nuova password per EncFS
 Inserire il numero corrispondente alla propria scelta:  Errore nel creare la chiave
 Errore nel creare il salt
 Errore nella decodifica della chiave di volume, password non corretta
 Errore nel salvare il file di configurazione modificato.
 Esempio: 
%s info ~/.crypt
 Vettore d'inizializzazione concatenato esterno disabilitato, dal momento che le funzionalità di
concatenazione del vettore e il vettore di inizializzazione unico sono richieste per quest'opzione. Generazione della nuova chiave d'archivio non riuscita. Segnalare questo errore. Il vettore di inizializzazione dei dati nei file è concatenato al vettore di inizializzazione dei nomi dei file.
 File frammentati inalterati per il testo cifrato
 Codifica nome dei file: "%s", versione %i:%i:%i Nomi dei file cifrati usando la modalità di concatenazione del vettore di inizializzazione.
 Cifrario file system: "%s", versione %i:%i:%i Per ulteriori informazioni, consultare il manuale col comando "man encfs(1)" Trovato %i file non valido. Trovati %i file non validi. Nella directory %s: 
 Numero di argomenti errato Numero di argomenti errato per il comando "%s" Errore interno: catturata un'eccezione nel ciclo principale: %s Errore interno: catturata un'eccezione imprevista Errore interno: exec del programma non riuscito Errore interno: fork() non riuscito Errore interno: socketpair() non riuscito Password non valida
 Selezione non valida. Dimensione chiave: %i bit Comparazione MAC non riuscita nel blocco %li Comparazione MAC non riuscita, lettura non possibile Selezionata la configurazione manuale. Mancano uno o più argomenti, terminato. Deve essere impostato il programma per le password quando si usa il mount-on-demand L'interfaccia di codifica dei nomi non è supportata Nuova password di Encfs:  Nota: richiesta una modalità a singolo thread ma è stato
specificato un timeout idle. Il file system opererà in
modalità singolo thread, ma i thread saranno usati per
implementare il controllo idle. Ora è necessario creare una password per il proprio file system.
È necessario ricordare questa password, dato che non esiste alcun modo
per recuperarla automaticamente. In ogni caso, la password potrà essere
cambiata utilizzando encfsctl.

 Selezionata la configurazione paranoica. Le password non coincidono, riprovare
 Scegliere tra una delle seguenti opzioni:
 digitare "x" per la modalità di configurazione per esperti,
 digitare "p" per la modalità paranoica preconfigurata.
 qualsiasi altra cosa o una riga vuota selezionerà la modalità standard.
?>  Selezionare una dimensione di chiave in bit. Il cifrario scelto 
supporta dimensioni da %i a %i bit a incrementi di %i bit.
Per esempio:  Rimontaggio non riuscito Dimensione salt: %i bit Selezionare una dimensione del blocco in byte. Il cifrario scelto
supporta dimensioni da %i a %i byte a incrementi di %i.
Oppure premere Invio per il valore predefinito (%i byte)
 Selezionato l'algoritmo "%s" Dimensione chiave selezionata:  Impossibile localizzare il cifrario per la configurazione predefinita...
Passaggio alla modalità di configurazione manuale. Selezionata la configurazione standard. La configurazione caricata non è compatibile con --reverse
 La directory "%s" non esiste. Deve essere creata? (y,N)  L'opzione di concatenazione esterna del vettore di Inizializzazione è stata
abilitata. Questa opzione disabilita l'uso dei collegamenti nel file system.
Senza i collegamenti, qualche programma potrebbe non funzionare.
I programmi "mutt" e "procmail" non funzioneranno. Per ulteriori
informazioni, consultare la mailing list di encfs.
Per scegliere un'altra configurazione,
premere Ctrl-C per annullare e ricominciare da capo. L'interfaccia richiesta per la codifica dei nomi file non è disponibile Sono disponibili i seguenti algoritmi di cifratura: Sono disponibili i seguenti algoritmi di codifica dei nomi file: La directory da decifrare non può essere una sottodirectory del punto di mount. L'interfaccia di cifratura richiesta non è disponibile
 L'interfaccia richiesta per la codifica del nome del file non è disponibile
 Questa versione di EncFS non supporta file system creati prima del 13/08/2004 Impossibile creare la directory:  Non è possibile trovare il cifrario %s, versione %i:%i:%i Non è possibile trovare l'interfaccia "nameio" %s, versione %i:%i:%i Impossibile trovare il cifrario "%s" specificato
 Impossibile inizializzare il file system cifrato - controllare il percorso.
 Impossibile attivare il cifrario %s, chiave di dimensione %i, blocco di dimensione %i Impossibile caricare o analizzare il file di configurazione
 Impossibile localizzare il punto di mount, terminato. Impossibile localizzare la directory radice, terminato. Smontaggio del disco %s per inattività Uso:
 Uso: %s [opzioni] DirectoryPrincipale PuntoDiMount [-- [opzioni di mount di FUSE]] Viene utilizzato PBKDF2, con %i iterazioni È in uso una dimensione del blocco di %i byte per il file system È in uso una dimensione della chiave di %i bit Conferma password di Encfs:  Configurazione versione 3; creata da %s
 Configurazione versione 4; creata da %s
 Configurazione versione 5; creata da %s (revisione %i)
 Configurazione versione 6; creata da %s (revisione %i)
 Chiave di volume aggiornata con successo.
 Specificando la modalità demone è necessario usare i percorsi assoluti (cominciano con "/") Non sono ammesse password di zero caratteri
 la directory %s non esiste.
 encfs [opzioni] DirectoryRadice PuntoDiMount -- [Opzioni di mount FUSE]
Opzioni di mount FUSE valide a seguire:
 encfs versione %s encfsctl versione %s dimensione del blocco per il file system:  Errore in fuse. Problemi comuni:
 - il modulo fuse del kernel non è installato (modprobe fuse)
 - opzioni non valide -- controllare l'utilizzo del comando
 Errore getopt: %i comando non valido: "%s" l'opzione "--public" viene ignorata per gli utenti non root troncamento fallito: letti %i byte, blocco parziale di %i 