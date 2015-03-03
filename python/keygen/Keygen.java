// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3)
// Source File Name:   Keygen.java

import java.util.Date;
import java.util.Random;

public class Keygen {
  public static void main(String args[]) {
    Random random=new Random((new Date()).getTime());

    System.out.println(
      "1"+
      random.nextInt(10)+
      "355"+
      random.nextInt(10)+
      "0"+
      random.nextInt(10)+
      "130"+
      random.nextInt(100)
    );
  }
}
