package com.singaporetech.audiorecorder;

import java.util.Calendar;

public class bmStringEnc_Ref {
    public static String startTest(long timeMilliStart){

        System.out.println("--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
        System.out.println("--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
        System.out.println("-------------------------------   STARTING Test   -------------------------------");
        System.out.println("-------------   START TIME: " + timeMilliStart+"   -------------");
        // create strings for encryption (10)
        String str1 = "Hello, my name is CharlotteRobot.";
        String str2 = "I am typing this because I am bored and have nothing else to do.";
        String str3 = "Also, I wanted to make some text to practice. How was your day? I hope it went well. ";
        String str4 = "lso, I wanted to make some text to practice.";
        String str5 = "Also, I wanted to make some text to practice. How was your day? I hope it went well.";
        String str6 = "I hope it went well. If it did, that's great! If not, I am sorry.";
        String str7 = "I hope it goes better tomorrow. If you are as bored as I am right now, you must be pretty bored.";
        String str8 = "I bet no one will even complete this but me. Oh well.";
        String str9 = "I kind of just made it for myself, anyway. Just for casual typing";
        String str10 = "Meal Substitutions for Medical or Special Dietary Reasons USDA Regulation 7 CFR Part 15b requires substitutions or modifications";
        // loop through each string call print function to print the line - should trigger the decryption (1,000,000 iterations)
        for (int i = 0; i < 1000; i++){
            //printStr("-------------------------------   STARTING ITERATION   "+i+"   -------------------------------");
            printStr(str1);
            printStr(str2);
            printStr(str3);
            printStr(str4);
            printStr(str5);
            printStr(str6);
            printStr(str7);
            printStr(str8);
            printStr(str9);
            printStr(str10);
            System.out.println("");
        }
        // log end time
        Calendar calendar2 = Calendar.getInstance();
        long timeMilliEnd = calendar2.getTimeInMillis();
        long runtime = timeMilliEnd-timeMilliStart;
        System.out.println("-----------------------------------------------------------------------------------------------------------------");
        System.out.println("-------------   START TIME: " + timeMilliStart+"   -------------");
        System.out.println("-------------   END TIME: " + timeMilliEnd+"   -------------");
        System.out.println("-------------   RUN TIME: " + runtime+"miliseconds   -------------");
        String text ="-------------   RUN TIME: " + runtime+"miliseconds   -------------";
        text = "\t\t\t\t\tExecution Timer: \n Start Time: "+timeMilliStart+" MilliSeconds\n\tEnd Time: "+timeMilliEnd+" MilliSeconds \n\t Run Time: "+runtime+" MilliSeconds";

        return text;
    }

    public static void printStr(String xyz){
        System.out.print(xyz);
    }
//zw method got override cannot rename


}
