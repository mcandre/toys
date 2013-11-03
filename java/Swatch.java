// Andrew Pennebaker
// Copyright 2007 Andrew Pennebaker
//
// Credits: http://www.krugle.com/files/cvs/cvs.jabberstudio.org/neutron/plugins/time_plugin.py

import java.util.Calendar;

public final class Swatch {
  private Swatch() {}

  public static int getTimezone(final Calendar c) {
    return -(c.get(Calendar.ZONE_OFFSET) + c.get(Calendar.DST_OFFSET)) / (60 * 1000) / 60;
  }

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

  public static String swatch() {
    return String.format("@%06.2f", beat());
  }

  public static void main(final String[] args) {
    System.out.println(swatch());
  }
}
