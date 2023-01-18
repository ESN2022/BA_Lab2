#BA_Lab2

Rapport LAB2

Le but de cette séance de LAB2 est de concevoir un counter 0 à 999, d'afficher les valeurs du compteur sur l'afficheur 7-segment, cadencé par un Timer réglé à 1 second.

Pour ce faire, il faudrait concevoir l'architecture matérielle du système. Du point de vue de la conception du système, les éléments suivants seront compris dans le design :
  - CPU : ici le NIOS II (compatible pour la cible)
  - RAM : stockage des données (40 KB utilisées ici, car dimensionné assez large pour supporter le program exécuté et eviter les "Overflow")
  - JTAG (UART) : pour télécharger le programme sur la cible
  - 7-SEGMENT : afficher les valeurs du compteur
  - Timer : Pour cadencer le comptage à 1 seconde


![image](https://user-images.githubusercontent.com/102004780/213108883-96456997-d84b-47ff-a424-7dabe56ffcba.png)


Ainsi, l'architecture conçue à cet effet sur "Platform Designer" est présentée ci-dessous : 
Celui-ci est le suivant :


![image](https://user-images.githubusercontent.com/102004780/213110459-3a976a5a-a669-48d6-8cef-19267eb3282f.png)
![image](https://user-images.githubusercontent.com/102004780/213110587-f8314f66-8cd7-47fe-951d-4e75d1a94c5e.png)


Dans la configuration du Timer sous "Platform Designer", il faudra bien specifier les délais du Timer
Après avoir concu la partie matérielle du système, il faut à présent concevoir la partie logicielle.

Pour ce faire, dans un "fichier.c", il est implémenté deux fonctions : *
  - fonction_interruption_Timer : qui s'emploie à déclencher le comptage et à afficher les valeurs sur le 7-segments
  - fonction_adaptation_valeurs : qui s'emploie à faire un calcul d'organisation des valeurs à afficher sur le 7-segments. Le dit calcul consiste à éclater le nombre à     afficher sous le format : unité, centaine et dizaine. Ici, le nombre à afficher est la valeur du compteur qui s'incrémente chaque seconde. Ensuite, au moment de      l'appel de la macro permettant l'affichage des valeurs sur le 7-segment, on décale la valeur des centaines de 8-bits vers la gauche, celle des dizaines de 4-bits      vers la gauche celle de l'unité telle qu'elle. Pour finir, on fait un OR-logique. Ainsi, la valeur des centaines ira sur le 3ème digit, celle des dizaines sur le      2ème digit et celle des unités sur le 1er digit. Confère le fichier  main.c fourni sur le GiT.

Dès que le programme est téléchargé sur la cible, la fonction d'interruption du Timer est appelé et l'intérruption est déclenchée, ce qui a pour effet de démarrer le comptage et l'affichage des valeurs sur le 7-segment.

Les vidéos ci-dessous montrent une démonstration du fonctionnement du système.
La 1ère montre le compteur au démarrage du système et la seconde montre le comptage du Timer à des valeurs avancées.

https://user-images.githubusercontent.com/102004780/213086028-b02da932-a17f-4f53-b26b-77b844fdd001.mp4




https://user-images.githubusercontent.com/102004780/213086123-e09aebd1-f042-4b50-a88b-646fbab60603.mp4


