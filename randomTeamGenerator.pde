import controlP5.*;
import java.util.Collections;
ControlP5 cp5;


String textValue = "";
int groupNumber = 4;
int x=0;
int group;
ArrayList<String> names = new ArrayList<String>();
ArrayList<String> shuffledNames = new ArrayList<String>();

void setup() {

  size(600, 500);
  PFont font = createFont("arial", 20);
  cp5 = new ControlP5(this);


  cp5.addTextfield("numberOfGroups")
    .setPosition(20, 20)
    .setSize(200, 40)
    .setFont(font)
    .setFocus(true)
    .setColor(color(255, 255, 255))
    .setCaptionLabel("Define number of groups");
  ;


  cp5.addTextfield("name")
    .setPosition(20, 100)
    .setSize(200, 40)
    .setFont(font)
    .setFocus(true)
    .setColor(color(255, 255, 255))
    .setCaptionLabel("Insert a name");
  ;


  cp5.addButton("add")
    .setPosition(20, 170)
    .setSize(80, 40)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
    ; 

  cp5.addButton("shuffle")
    .setPosition(150, 170)
    .setSize(80, 40)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
    ; 

  textFont(font);
}
void draw() {

  background(0);
  fill(255);
  textSize(18);

  group = 0;
  for (int j=0; j<names.size(); j=j+groupNumber) {
    group ++;
    for (int i=0; i<groupNumber; i++) {
      if (!((j+i)>names.size()-1)) {
        text("Group " + group, 10, 270+j*10);
        text(names.get(j+i), 140+i*80, 270+j*10);
        //print(names.get(j+i) + " ");
      }
    }
    // println();
  }
}

public void add() {


  String s = cp5.get(Textfield.class, "name").getText();
  if (s!=null) {
    names.add(s);
    cp5.get(Textfield.class, "name").clear();
  }
}

public void shuffle() {
  Collections.shuffle(names);

  if (groupNumber<1) {
    if (Integer.parseInt(cp5.get(Textfield.class, "numberOfGroups").getText()) != groupNumber) {
      println("new group number");
      groupNumber = Integer.parseInt(cp5.get(Textfield.class, "numberOfGroups").getText());
    }
  } else {
    groupNumber = 4;
  }
}
