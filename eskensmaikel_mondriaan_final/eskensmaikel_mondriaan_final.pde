// Naam: Maikel Eskens
// Email: maikeleskens@gmail.com
// Gemaakt in: Processing 1.5.1

int x_loc;    // geheugenruimte inruimen voor de zelfgemaakte variable x_loc (wordt gebruikt voor de x locatie van een vierkant)
int y_loc;    // geheugenruimte inruimen voor de variabele y_loc (wordt gebruikt voor de y locatie van een vierkant)
int x_speed;  //geheugenruimte voor x_speed (wordt gebruikt voor de x snelheid van een vierkant)
int y_speed;  // geheugenruimte voor y_speed (wordt gebruikt voor de y snelheid van een vierkant)
int grootte;  // geheugenruimte voor grootte
PImage img;   // Functie PImage om een afbeelding te laden met als variabele img
int timer;    // geheugenruimte voor timer

void setup() {  // setup van het programma, alles hierbinnen wordt eenmalig uitgevoerd
  size(600, 600);  // grootte van het venster wordt op 600x600 pixels gezet
  frameRate(120);  // frameRate van het programma staat op 120. 
  img = loadImage("victory_boogie_woogie.jpg"); // Laad de afbeelding van de Victory Boogie Woogie in als referentie materiaal om de juiste kleuren te krijgen
  background(255);  // achtergrond van het scherm is wit

  x_loc = 20;  // x_loc heeft als beginwaarde 20
  x_speed = int (random(8, 22)); // x_speed heeft als beginwaarde een willekeurig getal tussen 8 en 22
  y_loc = 20; // y_loc heeft als begin waarde 20
  y_speed = int (random(8, 22)); // y_speed heeft als beginwaarde een willekeurig getal tussen 8 en 22
  rectMode(CENTER); // rectMode (CENTER) zorgt ervoor dat alle waarde voor rechthoeken vanuit het middenpunt gebruikt worden
  timer=0; // timer heeft als beginwaarde 0
}

void draw() {  // void draw voert alles hierbinnen een bepaald aantal keer per seconde uit aan de hand van de frameRate
  if (timer<7000) {  // if statement, als de timer kleiner is dan 7000 wordt alles hierbinnen uitgevoerd
    timer++; // de variabele timer wordt elke frame per seconde 1 erbij opgeteld
    println(timer);  // geeft de timer weer (werkt alleen als de code wordt uitgevoerd in Processing)
    grootte=(int(random(5, 17))); // variabele grootte heeft een willekeurig getal tussen de 5 en 17, zonder decimalen)
    x_loc += x_speed; // x_loc = x_loc + x_speed. Dit zorgt ervoor dat de x_loc zich per frame verplaatst
    y_loc += y_speed; // y_loc = y_loc + y_speed. Dit zorgt ervoor dat de y_loc zich per frame verplaatst

    if (x_loc<20) {  // als de x_loc kleiner is dan 20, dan...
      x_speed = x_speed*-1; // de x_speed wordt omgedraait telkens als het vierkantje de linkerzijde raakt
    }


    if (x_loc>width-20) { // als de x_loc groter is dan de totale breedte van het scherm min 20, dan...
      x_speed = int (random(8, 18));  // willekeurig getal voor de x_speed tussen 8 en 18. De x_speed krijgt een nieuwe snelheid telkens als het vierkantje de rechterzijde raakt.
      x_speed = x_speed*-1;  // de x_speed wordt wederom omgedraait telkens als het vierkantje de rechterzijde raakt
    }

    if (y_loc<20) {  // als de y_loc kleiner is dan 20, dan...
      y_speed = y_speed*-1; // de y_speed wordt omgedraait telkens als het vierkantje de bovenzijde raakt
    }

    if (y_loc>height-20) { // als de y_loc groter is dan de totale hoogte van het scherm min 20, dan...
      y_speed = int (random(8, 18));  // willekeurig getal voor de y_speed tussen 8 en 18. De y_speed krijgt een nieuwe snelheid telkens als het vierkantje de onderzijde raakt.
      y_speed = y_speed*-1; // de y_speed wordt wederom omgedraait telkens als het vierkantje de onderzijde raakt
    }

    noStroke();  // alle objecten in het programma hebben standaard geen omlijning
    fill(255); // vulling van alle objecten die volgen zijn standaard wit
    triangle(0, 0, 300, 0, 0, 300);  // driehoek in de linkerhoek boven ter afkadering 
    triangle(0, 300, 300, 600, 0, 600); // driehoek in de linkerhoek onderaan ter afkadering
    triangle(300, 0, 600, 0, 600, 300); // driehoek in de rechterhoek boven ter afkadering
    triangle(600, 300, 600, 600, 300, 600); // driehoek in de rechterhoek onderaan ter afkadering
    color c = img.get(x_loc, y_loc);  // variabele 'c' wordt aangemaakt met als functie color. Gebruikt img (de afbeelding van Victory Boogie Woogie) zonder deze te laten zien als referentie materaal en pakt aan de hand van de x en y positie (x_loc en y_loc) een kleur.
    translate(x_loc, y_loc+grootte/2); // plaatsing van alle objecten die volgen staan standaard op de x_loc en y_loc+grootte/2. De locatie van de kleur die geselecteerd word en de locatie van alle objecten die volgen zijn nu synchroom aan elkaar. Het lijkt alsof er een lijn wordt getekend van vierkantjes
    fill(c); // vulling van alle objecten die volgen zijn aan de hand van de variabele 'c'. Dit veranderd per frame.
    rect(0, 0, grootte, grootte); // tekent elke frame per seconde een nieuwe vierkant op de plaats die aangegeven is in de translate functie. grootte, grootte zorgt voor de breedte en hoogte van het vierkant naar aanleiding van de variablee grootte
  }
}

