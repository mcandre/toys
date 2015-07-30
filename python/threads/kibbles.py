"""Thread demo"""

import thread

BOWL = None
BOWL_LOCK = None


def eat(n, m):
    """Consume"""

    global BOWL

    while True:
        BOWL_LOCK.acquire()
        BOWL -= n

        print("Ate %d" % (n))

        if BOWL < m:
            break

    BOWL_LOCK.release()


def pour(n, m):
    """Produce"""

    global BOWL

    while True:
        BOWL_LOCK.acquire()
        BOWL += n

        print("Poured %d" % (n))

        if BOWL > m:
            break

    BOWL_LOCK.release()


def monitor(n, m):
    """Debug"""

    while True:
        BOWL_LOCK.acquire()

        print("Contains %d" % (BOWL))

        if BOWL < n or BOWL > m:
            break

    BOWL_LOCK.release()


def main():
    """CLI"""

    global BOWL, BOWL_LOCK

    BOWL = 15
    BOWL_LOCK = thread.allocate_lock()

    thread.start_new_thread(eat, (2, 5))
    thread.start_new_thread(pour, (8, 25))
    thread.start_new_thread(monitor, (2, 25))

if __name__ == "__main__":
    main()
