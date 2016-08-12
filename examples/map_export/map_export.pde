import processing.pdf.*;

// No Ceilings (noceilings.org) example sketch that creates a PDF of a world map 
// that's colored based on data found in one of the "indicator" files.

// Built for Processing 3.0a5 http://processing.org/download
// Download Processing, open this sketch, and hit 'Run'. 
// A PDF will be placed on your desktop.

// Read about the data release and find more examples at noceilings.org/data
// Please modify, update, and make use of this code! Make new examples with other
// languages. Share what you find and tell us what you've made with the data.


// To modify this sketch, change the indicator and the year
// GERSFEIN is the "Gross enrollment ratio in secondary school, female" indicator
String indicator = "GERSFEIN";
String year = "2011";

 // Path to the file in the "CSV" folder that's two steps higher in this repo
 String csvPath;




void setup() {
  size(1280, 720);
 
  csvPath = sketchPath("../../csv/" + indicator + ".csv");
  
  // Load a file that links ISO3 codes (used in the data) to ISO2 (for the map)
  Table lookupTable = loadTable("iso3-to-iso2.csv", "header");
  // Use the two columns to create a lookup table
  StringDict isoLookup = lookupTable.getStringDict("iso3", "iso2");
  
  // Save the PDF image to the Desktop
  beginRecord(PDF, desktopPath(indicator + ".pdf"));
  background(255);
  
  PShape svg = loadShape("world.svg");
  svg.disableStyle();
  
  // Draw a thin outline for the ocean
  PShape outline = svg.getChild("ocean");
  strokeWeight(0.25);
  shape(outline, 0, 0);  
  noStroke();

  // Load the data file
  Table t = loadTable(csvPath, "header");
  
  // Calculate the min and max for this year to use for coloring.
  // You could also set to the minimum value to 0 or use fixed values
  // for both if you'd like to have maps that you can compare.
  FloatList column = t.getFloatList(year);
  float maxValue = column.max();
  float minValue = column.min();

  for (TableRow row : t.rows()) {
    String iso3 = row.getString("ISO");
    
    // Skip lines with comments
    if (iso3.startsWith("#")) continue;
    
    String iso2 = isoLookup.get(iso3);
    if (iso2 != null) {
      float value = row.getFloat(year);
      if (!Float.isNaN(value)) {
        // Map the data value to a gray color
        float gray = map(value, minValue, maxValue, 240, 20); 
        fill(gray);
        PShape country = svg.findChild(iso2.toLowerCase());
        if (country != null) {
          shape(country, 0, 0);
        }
      }
    } else {
      // Un-comment this if you'd like to know
      //println("No country shape found for " + iso3);
    }
  }
  // Finish writing the PDF file
  endRecord();
  // All done! Close the sketch.
  exit();
}
