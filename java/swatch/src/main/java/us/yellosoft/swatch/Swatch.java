package us.yellosoft.swatch;

//
// Andrew Pennebaker
// Copyright 2007 Andrew Pennebaker
//
// Credits: http://www.krugle.com/files/cvs/cvs.jabberstudio.org/neutron/plugins/time_plugin.py
//

import java.util.Calendar;

/** Swatch Internet time converter */
public final class Swatch {
  /** utility class */
  private Swatch() {}

  /**
     <p>Get timezone offset in hours</p>
     @param c a calendar
     @return offset
  */
  public static int getTimezone(final Calendar c) {
    return -(c.get(Calendar.ZONE_OFFSET) + c.get(Calendar.DST_OFFSET)) / (60 * 1000) / 60;
  }

  /**
     <p>Get current, raw Swatch beat</p>
     @return unformatted Swatch beat
  */
  public static double beat() {
    Calendar c = Calendar.getInstance();

    int hour = c.get(Calendar.HOUR_OF_DAY) + getTimezone(c);
    int min = c.get(Calendar.MINUTE);
    int sec = c.get(Calendar.SECOND);

    int utc = hour * 3600 + min * 60 + sec; // Greenwich, England

    int bmt = utc + 3600; // Biel, Switzerland

    double beat = bmt / 86.4;

    if (beat > 1000) {
      beat -= 1000;
    }

    return beat;
  }

  /**
     <p>Get current, formatted Swatch time</p>
     @return Swatch time
  */
  public static String swatch() {
    return String.format("@%06.2f", beat());
  }

  /**
     <p>CLI</p>
     @param args CLI args
  */
  public static void main(final String[] args) {
    System.out.println(swatch());
  }
}
