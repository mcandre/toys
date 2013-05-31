#!/usr/bin/env python

"""Thread demo"""

import threading

class Dog(threading.Thread):
  """Dog"""

  id = 0

  def __init__(self, bowl, n, m, lock):
    threading.Thread.__init__(self)
    self.bowl = bowl
    self.n = n
    self.m = m
    self.myid = self.id
    Dog.id += 1
    self.bowl_lock = lock

  def run(self):
    """Tick"""

    while True:
      self.bowl_lock.acquire()
      self.bowl -= self.n
      self.bowl_lock.release()

      print "Dog %d Ate %d" % (self.myid, self.n)

      if self.bowl < self.m:
        break

class Man(threading.Thread):
  """Man"""

  id = 0

  def __init__(self, bowl, n, m, lock):
    threading.Thread.__init__(self)
    self.bowl = bowl
    self.n = n
    self.m = m
    self.myid = self.id
    Man.id += 1
    self.bowl_lock = lock

  def run(self):
    """Tick"""

    while True:
      self.bowl_lock.acquire()
      self.bowl -= self.n
      self.bowl_lock.release()

      print "Man %d Gave %d" % (self.myid, self.n)

      if self.bowl > self.m:
        break

    print("Man %d Quit" % (self.myid))

class Monitor(threading.Thread):
  """Monitor"""

  id = 0

  def __init__(self, bowl, n, m, lock):
    threading.Thread.__init__(self)
    self.bowl = bowl
    self.n = n
    self.m = m
    self.myid = self.id
    Monitor.id += 1
    self.bowl_lock = lock

  def run(self):
    """Tick"""

    while True:
      self.bowl_lock.acquire()
      self.bowl_lock.release()

      print "Monitor %d Contains %d" % (self.myid, self.bowl)

      if self.bowl < n or self.bowl > m:
        break

    print "Monitor %d Quit" % (self.myid)

def main():
  """CLI"""

  bowl_start = 15
  dog_speed = 2
  dog_min = 5
  man_speed = 4
  man_max = 25

  bowl_lock = threading.Lock()

  t1 = Dog(bowl_start, dog_speed, dog_min, bowl_lock)
  t2 = Man(bowl_start, man_speed, man_max, bowl_lock)
  t3 = Monitor(bowl_start, dog_min, man_max, bowl_lock)

  threads = [t1, t2, t3]

  for t in threads:
    t.start()

  # wait for all threads to finish
  for t in threads:
    t.join()

if __name__ == "__main__":
  main()
