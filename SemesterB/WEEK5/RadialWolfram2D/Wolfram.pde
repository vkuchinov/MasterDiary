class Wolfram {

  int rule;
  int dim; //dimension/length
  int[] ruleSet = {
    0, 0, 0, 0, 0, 0, 0, 0
  };
  int[] row;

  Wolfram(int r_, int d_) {

    rule = r_;
    dim = d_;
    row = new int[dim];

    setCurrentRule(rule);
  }

  public int[] renderGen(int s, int p) {

    row = new int[p];

    int[] newRow = new int[p];

    for (int f = 0; f < p; f++) {
      row[f] = 0;
    }
    row[(int)p/2] = 1;

    for (int gen = 0; gen < s; gen++)
    {

      newRow = new int[p + (gen+1)*8];
      //copy row with gaps
      //right / left / right / left
      println(newRow.length);
      row = increaseRow(8, row);
      println(row.length);

      for (int i = 1; i < p + gen*8; i++) {

        int leftCell = row[i-1];
        int centerCell = row[i];
        int rightCell = row[i+1];

        //bbb//bbw//bwb//bww
        //wbb//wbw//wwb//www

        if (leftCell == 1 && centerCell == 1 && rightCell == 1) if (ruleSet[0] == 0) { 
          newRow[i] = 0;
        } else { 
          newRow[i] = 1;
        }
        if (leftCell == 1 && centerCell == 1 && rightCell == 0) if (ruleSet[1] == 0) { 
          newRow[i] = 0;
        } else { 
          newRow[i] = 1;
        }
        if (leftCell == 1 && centerCell == 0 && rightCell == 1) if (ruleSet[2] == 0) { 
          newRow[i] = 0;
        } else { 
          newRow[i] = 1;
        }
        if (leftCell == 1 && centerCell == 0 && rightCell == 0) if (ruleSet[3] == 0) { 
          newRow[i] = 0;
        } else { 
          newRow[i] = 1;
        }
        if (leftCell == 0 && centerCell == 1 && rightCell == 1) if (ruleSet[4] == 0) { 
          newRow[i] = 0;
        } else { 
          newRow[i] = 1;
        }
        if (leftCell == 0 && centerCell == 1 && rightCell == 0) if (ruleSet[5] == 0) { 
          newRow[i] = 0;
        } else { 
          newRow[i] = 1;
        }
        if (leftCell == 0 && centerCell == 0 && rightCell == 1) if (ruleSet[6] == 0) { 
          newRow[i] = 0;
        } else { 
          newRow[i] = 1;
        }
        if (leftCell == 0 && centerCell == 0 && rightCell == 0) if (ruleSet[7] == 0) { 
          newRow[i] = 0;
        } else { 
          newRow[i] = 1;
        }
      }


      row = newRow;
    }

    return row;
  }

  public int[] increaseRow(int inc, int[] in) {

    int[] out = new int[in.length + inc];

    // 1 2 3 4 5 6 7 8
    // 1 n 2 n 3 n 4 n 5 n 6 n 7 n 8 n
    // n 1 2 n 3 4 n 5 6 n 7 8 n 9 10 n 11 12 n 13 14 n 15 16
    // 1 2 3 n 4 5 6 n ...

    int segment = in.length/inc; //gives segment length

    //if in.length%16 == 0 left
    //else right

    for (int e = 0; e < out.length; e++) {
      out[e] = 0; // set white, blank
    }

    int counter = 0;
    for (int e = 0; e < out.length; e += segment + 1) {

      //right
      if (in.length%16 == 0) {
        int counter2 = 0;
        for (int i = counter*segment; i < counter*segment + segment; i++) {
          out[e + counter2 + 1] = in[i];
          counter2++;
        }
      } else
      {
        int counter2 = 0;
        for (int i = counter*segment; i < counter*segment + segment; i++) {
          out[e + counter2] = in[i];
          counter2++;
        }
      }
      counter++;
    }

    return out;
  }

  void setCurrentRule(int rule)
  {
    String binaryValue = binary(rule, 8);

    char[] binaries = new char[binaryValue.length()];
    for (int ch = 0; ch < binaryValue.length (); ch++)
    {
      binaries[ch] = binaryValue.charAt(ch);
    }

    int counter = 0;
    for (int element : ruleSet)
    {
      ruleSet[counter] = int(binaries[counter]) -48;
      counter++;
    }
  }
}

