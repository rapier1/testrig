��    R      �  m   <      �     �  ]     .   o  1   �  (   �  "   �  '     -   D     r     �  *   �  )   �     �     	  B   	  >   ^	  S   �	     �	  S   
     Z
     y
     �
     �
     �
  /   �
  .   	  #   8     \  <   x  /   �  .   �       .   '  3   V  +   �  &   �     �  #   �          1     D  #   V  (   z     �  �   �      �  *   �  �   �  �   �  �   $     �     �  l   �      ]  ?   ~  .   �  9   �     '  %   D  8   j  $   �  '   �  *   �  *        F  '   N     v     �  '   �  '   �  5   �  !   .  M   P  !   �     �     �     �               ,  +   B  �  n  =   <  �   z  p     w   r  c   �  f   N  S   �  o   	  %   y     �  T   �  _        l  ,   �  (   �  H   �  �   (     �  �   �  J   �  4   �  )     E   E  >   �  c   �  x   .  w   �  (      �   H   y   �   e   V!     �!  S   �!  q   *"  \   �"  ]   �"  ;   W#  A   �#  9   �#     $  .   )$  L   X$  Y   �$  @   �$  �  @%  /   �&  u   !'  �  �'    �)    �*  0   �+  6   �+    ,  ?   -  X   K-  e   �-  w   
.  8   �.  K   �.  �   /  L   �/  a   �/  S   U0  ]   �0     1  K   1  ?   _1  @   �1  V   �1  V   72  d   �2  F   �2  �   :3  Y   �3  ,   :4     g4     }4  :   �4     �4     �4  L   5     <       4      ?   /              
       E   ,   $   )   %       "   Q   A   M         -   &      8                           :   @           =         5             *           N          L          '         3      7   K             1   6   >          J   P      I          ;   D   O   R          #   !   0   H       .   +              B         2   9      C      	       F            (       G          -- change password for volume   -- change password for volume, taking password from standard input.
	No prompts are issued.   -- decodes name and prints plaintext version   -- decrypts a volume and writes results to path   -- encodes a filename and print result   -- print version number and exit   -- show information (Default command)   -- show undecodable filenames in the volume  (NOT supported)
  (using %i:%i:%i)
  -- Supports block sizes of %i to %i bytes  -- Supports key lengths of %i to %i bits  -- block size %i bytes  -- key length %i bits %s (root dir)
  -- displays information about the filesystem, or 
 -------------------------- WARNING --------------------------
 A really old EncFS filesystem was found. 
It is not supported in this EncFS build.
 Block Size: %i bytes Configuration finished.  The filesystem to be created has
the following properties: Creating new encrypted volume. Directory not created. EncFS Password:  Enter current Encfs password
 Enter new Encfs password
 Enter the number corresponding to your choice:  Error decoding volume key, password incorrect
 Error saving modified config file.
 Example: 
%s info ~/.crypt
 Failure generating new volume key! Please report this error. For more information, see the man page encfs(1) Found %i invalid file. Found %i invalid files. In directory %s: 
 Incorrect number of arguments for command "%s" Internal error: Caught exception from main loop: %s Internal error: Caught unexpected exception Internal error: failed to exec program Internal error: fork() failed Internal error: socketpair() failed Invalid password
 Invalid selection. Key Size: %i bits Manual configuration mode selected. Missing one or more arguments, aborting. New Encfs Password:  Now you will need to enter a password for your filesystem.
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
Falling through to Manual configuration mode. Standard configuration selected. The directory "%s" does not exist. Should it be created? (y,N)  The following cipher algorithms are available: The following filename encoding algorithms are available: Unable to create directory:  Unable to find specified cipher "%s"
 Unable to initialize encrypted filesystem - check path.
 Unable to load or parse config file
 Unable to locate mount point, aborting. Unable to locate root directory, aborting. Unmounting filesystem %s due to inactivity Usage:
 Using filesystem block size of %i bytes Using key size of %i bits Verify Encfs Password:  Version 3 configuration; created by %s
 Version 4 configuration; created by %s
 Version 5 configuration; created by %s (revision %i)
 Volume Key successfully updated.
 When specifying daemon mode, you must use absolute paths (beginning with '/') Zero length password not allowed
 directory %s does not exist.
 encfs version %s encfsctl version %s filesystem block size:  getopt error: %i invalid command: "%s" option '--public' ignored for non-root user Project-Id-Version: encfs
Report-Msgid-Bugs-To: https://translations.launchpad.net/encfs/main/+pots/encfs
PO-Revision-Date: 2010-01-25 16:46+0000
Last-Translator: George Kontis <giormatsis@gmail.com>
Language-Team: Greek <el@li.org>
Language: el
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n != 1;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
   --αλλαγή κωδικού πρόσβασης τόμου   -- αλλαγή κωδικού για τον τόμο, παίρνοντας τον κωδικό από συνήθη εισαγωγή   αποκωδικοποιεί το όνομα και τυπώνει την έδοση απλύ κειμένου   -- αποκωδικοποιεί τον τόμο και γράφει το αποτέλεσμα στο μονοπάτι   -- κωδικοποιεί ένα αρχείο και τυπώνει τα αποτελέσματα   -- εκτυπώνει τον αριθμό της έκδοσης και μετά τερματίζει   --προβολή πληροφοριών (Προεπιλεγμένη εντολή)   -- εμφάνισε μη αποκωδικοποιούμενα ονόματα αρχείων στον τόμο  (Δεν υποστηρίζεται)
  (χρήση %i:%i:%i)
  --Υποστηρίζει μήκη block των %i ψηφίων ως %i ψηφίων  --Υποστηρίζει μήκη κλειδιού των %i ψηφίων ως %i ψηφίων  --μήκος block %i bytes  --μήκος κλειδιού %i ψηφία %s (ριζικός κατάλογος) 
 ------------------------ΠΡΟΕΙΔΟΠΟΙΗΣΗ---------------------
 Ενα πολύ παλιό EncFS σύστημα αρχείων βρέθηκε. 
Το οποίο δεν υποστηρίζεται σε αυτή την έκδοση του EncFS.
 Μέγεθος block: %i bytes Τέλος ρύθμισης. Το σύστημα αρχείων που θα δημιουργηθεί
θα έχει τις ακόλουθες ιδιότητες: Δημιουργία νέου κρυπτογραφημένου τόμου. Ο φάκελος δεν δημιουργήθηκε. EncFS κωδικός πρόσβασης:  Δώστε τον τρέχον EncFS κωδικό πρόσβασης
 Εισάγετε νέο Encfs κωδικό πρόσβασης
 Εισάγετε τον αριθμό που αντιστοιχεί στην επιλογή σας:  Λάθος κατά την αποκωδικοποίηση του κλειδιού τόμου, λάθος κωδικός
 Λάθος κατά την αποθήκευση του τροποποιημένου αρχείου ρυθμίσεων.
 Παράδειγμα: 
%s info ~/.crypt
 Λάθος κατά την δημιουργία νέου κλειδιού τόμου! Παρακαλώ αναφέρετε αυτό το λάθος. Για περισσότερες πληροφορίες, δείτε στην κεντρική σελίδα του encfs(1) Βρέθηκε %i χαλασμένο αρχείο Βρέθηκαν %i χαλασμένα αρχεία Στο φάκελο %s: 
 Λάθος πλήθος παραμέτρων γι αυτή την εντολή "%s" Εσωτερικό σφάλμα: Βρέθηκε εξαίρεση στην κεντρική επανάληψη: %s Εσωτερικό σφάλμα: Βρέθηκε μη αναμενόμενη εξαίρεση Εσωτερικό σφάλμα: Αποτυχία εκτέλεσης προγράμματος Εσωτερικό σφάλμα: το fork() απέτυχε Εσωτερικό σφάλμα: το socketpair() απέτυχε Λανθασμένος κωδικός πρόσβασης
 Λάθος επιλογή Μέγεθος κλειδιού: %i ψηφία Επιλογή χειροκίνητης κατάσταση ρύθμισης. Λείπουν μία ή περισσότερες παραμέτροι, ματαίωση. Καινούργιος Encfs κωδικός πρόσβασης:  Τώρα θα χρειαστεί να εισάγετε εναν κωδικό για το σύστημα αρχείων σας.
Θα πρέπει να θυμόσαστε αυτόν τον κωδικό, εφόσον δεν υπάρχει απολύτως
κανένας μηχανισμός επαναφοράς. Πάντως, ο κωδικός μπορεί να αλλάξει
μετά χρησιμοποιώντας το encfsctl.

 Επιλογή κατάστασης " paranoia" Οι κωδικοί πρόσβασης δεν συμπίπτουν, παρακαλώ προσπαθήστε ξανά
 Παρακαλώ χρησιμοποιήστε μια απο τις ακόλουθες επιλογές:
 εισάγετε "x" για ρύθμιση κατάστασης απο έμπειρους χρήστες,
 εισάγετε "p" για προρυθμισμένη κατάσταση " paranoia",
 εισαγωγή άλλου συμβόλου ή αν επιλογή παραμείνει κενή θα εισέλθει αυτόματα σε εργαστηριακή κατάσταση.
?>  Παρακαλώ επιλέξτε μέγεθος κλειδιού σε bits. Η κωδικοποίηση που επιλέξατε
υποστηρίζει μεγέθη απο %i μέχρι %i bits σε διαστήματα των %i bits.
Για παράδειγμα:  Επιλέξτε ένα μέγεθος block σε bytes. Το cipher που επιλέξατε
υποστηρίζει μεγέθη από %i σε %i bytes σε βήματα των %i.
Ή απλώς πατήστε Enter για το προεπιλεγμένο (%i bytes)
 Επιλεγμένος αλγόριθμος "%s" Επιλεγμένο μέγεθος κλειδιού:  Δυστυχώς δεν είναι δυνατός ο εντοπισμός του κρυπτογραφήματος για την προκαθορισμένη κατάσταση...
Επιστροφή σε χειροκίνητη κατάσταση ρύθμισης. Επιλογή εργαστηριακής κατάστασης. Ο φάκελος "%s" δεν υπάρχει. Να τον δημιουργήσω? (y,N)  Οι παρακάτω αλγόριθμοι κρυπτογράφησης υποστηρίζονται: Οι ακόλουθοι αλγόριθμοι κωδικοποίησης αρχείων είναι διαθέσιμοι: Αδυναμία δημιουργίας φακέλου:  Αδυναμία εύρεσης διευκρινισμένου cipher "%s"
 Αδυναμία αρχικοποίησης του κωδικοποιημένου συστήματος αρχείων - ελέγξτε το μονοπάτι.
 Αδυναμία φόρτωσης του αρχείου ρυθμίσεων.
 Αδύνατος ο εντοπισμός σημείου προσάρτησης, ματαίωση. Αδύνατος ο εντοπισμός κατάλογου root, ματαίωση. Αποπροσάρτηση συστήματος αρχείων %s λόγω αδράνειας Xρήση:
 Χρήση block συστήματος αρχείων των %i ψηφίων Χρήση μήκους κλειδιού των %i ψηφίων Επιβεβαιώστε Encfs κωδικό πρόσβασης:  Έκδοση 3 παραμετροποίησης; δημιουργήθηκε απο %s
 Έκδοση 4 παραμετροποίησης; δημιουργήθηκε απο %s
 Έκδοση 5 παραμετροποίησης; δημιουργήθηκε απο %s (revision %i)
 Το κλειδί τόμου ενημερώθηκε επιτυχώς.
 Όταν ορίζετε περιβάλλον daemon, πρέπει να χρησιμοποείτε απόλυτες διαδρομές (ξεκινόντας με '/') Δεν επιτρέπεται η μη εισαγωγή κωδικού πρόσβασης
 ο φάκελος %s δεν υπάρχει.
 encfs έκδοση %s encfsctl εκδοχή %s Μέγεθος block συστήματος αρχείων:  σφάλμα getopt: %i λάθος εντολή: "%s" αγνόηση παραμέτρου '--public' για μη-root χρήστη 