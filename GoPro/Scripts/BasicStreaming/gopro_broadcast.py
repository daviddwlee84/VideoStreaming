from goprocam import GoProCamera, constants
import sys
import os

gopro = GoProCamera.GoPro()


def main(argv):
    if len(argv) < 2:
        broadcast_url = "udp://127.0.0.1:10000"
    else:
        broadcast_url = argv[1]
    gopro.stream(broadcast_url)


if __name__ == '__main__':
    try:
        main(sys.argv)
    except KeyboardInterrupt:
        print('Interrupted')
        gopro.power_off()
        try:
            sys.exit(0)
        except SystemExit:
            os._exit(0)
