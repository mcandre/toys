#!/bin/sh
#|
exec clisp -q -q $0 $0 ${1+"$@"}
exit
|#

;;;; Trollface wallpaper generator
;;;;
;;;; Example:
;;;;
;;;; ./problem.lisp --code "unsafePerformIO" --jeer "PROBLEM, PURISTS?" ~/Desktop/problem-haskell.png
;;;;
;;;; Andrew Pennebaker
;;;; andrew.pennebaker@gmail.com
;;;;
;;;; Requirements:
;;;;  - Inkscape in PATH
;;;;  - Quicklisp
;;;;  - cl-heredoc
;;;;  - html-encode
;;;;  - split-sequence
;;;;  - getopt

;;; Hide stupid warnings
(let* ((*standard-output* (make-broadcast-stream)) (*error-output* *standard-output*))
  ;;; Load Quicklisp.
  (let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname))))
    (when (probe-file quicklisp-init)
      (load quicklisp-init))))

;;; Hide stupid warnings
(let* ((*standard-output* (make-broadcast-stream)) (*error-output* *standard-output*))
  ;;; Load dependencies.
  (ql:quickload 'cl-heredoc)
  (ql:quickload 'html-encode)
  (ql:quickload 'split-sequence)
  (ql:quickload 'getopt))

(defparameter *inkscape-binary* "inkscape")

(set-dispatch-macro-character #\# #\> #'cl-heredoc:read-heredoc)

(defparameter *trollface-start* #>eof><?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->
<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
   width="1600"
   height="1200"
   id="svg2"
   sodipodi:version="0.32"
   inkscape:version="0.47pre4 r22446"
   version="1.0"
   sodipodi:docname="problem.svg"
   inkscape:output_extension="org.inkscape.output.svg.inkscape"
   inkscape:export-filename="/Users/andrew/Desktop/problem.png"
   inkscape:export-xdpi="180"
   inkscape:export-ydpi="180">
  <defs
     id="defs4">
    <inkscape:perspective
       sodipodi:type="inkscape:persp3d"
       inkscape:vp_x="0 : 526.18109 : 1"
       inkscape:vp_y="0 : 1000 : 0"
       inkscape:vp_z="744.09448 : 526.18109 : 1"
       inkscape:persp3d-origin="372.04724 : 350.78739 : 1"
       id="perspective10" />
    <inkscape:perspective
       id="perspective2447"
       inkscape:persp3d-origin="372.04724 : 350.78739 : 1"
       inkscape:vp_z="744.09448 : 526.18109 : 1"
       inkscape:vp_y="0 : 1000 : 0"
       inkscape:vp_x="0 : 526.18109 : 1"
       sodipodi:type="inkscape:persp3d" />
    <inkscape:perspective
       id="perspective2949"
       inkscape:persp3d-origin="262.5 : 141.66667 : 1"
       inkscape:vp_z="525 : 212.5 : 1"
       inkscape:vp_y="0 : 1000 : 0"
       inkscape:vp_x="0 : 212.5 : 1"
       sodipodi:type="inkscape:persp3d" />
  </defs>
  <sodipodi:namedview
     id="base"
     pagecolor="#ffffff"
     bordercolor="#666666"
     borderopacity="1.0"
     inkscape:pageopacity="1"
     inkscape:pageshadow="2"
     inkscape:zoom="0.1767767"
     inkscape:cx="1179.9054"
     inkscape:cy="215.81885"
     inkscape:document-units="px"
     inkscape:current-layer="layer2"
     showgrid="false"
     inkscape:window-width="1280"
     inkscape:window-height="671"
     inkscape:window-x="0"
     inkscape:window-y="0"
     inkscape:window-maximized="1" />
  <metadata
     id="metadata7">
    <rdf:RDF>
      <cc:Work
         rdf:about="">
        <dc:format>image/svg+xml</dc:format>
        <dc:type
           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
        <dc:title />
      </cc:Work>
    </rdf:RDF>
  </metadata>
  <g
     inkscape:label="Capa 1"
     inkscape:groupmode="layer"
     id="layer1"
     style="display:inline"
     transform="translate(-50.842427,779.7393)" />
  <g
     inkscape:groupmode="layer"
     id="layer2"
     inkscape:label="Troll editable"
     style="display:inline"
     transform="translate(-50.842427,779.7393)">
eof)

(defparameter *trollface-end* #>eof><g id="g3925">
      <path
         style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:6.92751741;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
         d="m 746.77296,-347.03589 c 0.054,0.23382 -30.3243,16.12 -40.675,40.675 -10.2954,24.42375 -16.3686,30.00797 -24.4925,35.42661 -8.1239,5.41864 -25.0469,20.3375 -26.5777,34.55189 -1.5335,14.2393 -2.0697,28.64744 13.8941,44.61129 0,0 20.0521,18.07296 27.9383,34.95816 0,0 5.3015,14.68283 20.828,29.11589 0,0 15.9799,15.27062 44.838,31.45314 0,0 73.4757,37.74427 89.8706,42.24297 0,0 11.4976,2.97174 16.5493,3.63498 18.4327,2.42006 41.7272,15.9004 62.8325,16.04647 0,0 49.4224,3.061553 66.4796,-5.24839 0,0 30.17824,-20.55618 29.74094,-38.48817 0,0 2.3568,-15.87651 -3.0616,-36.30134 0,0 -3.7118,-17.32866 -3.0175,-38.48582 0.6011,-18.31439 2.535,-38.07465 17.4506,-59.48408 0,0 18.588,-31.27164 -0.8748,-48.54758 0,0 -21.3137,-14.1443 -23.1803,-25.80457 -1.0695,-7.87257 4.3486,-13.12097 -6.5605,-24.71116 0,0 -24.66134,-27.17048 -70.85324,-31.27164 -46.7982,-4.15497 -50.4907,-6.59624 -73.9148,-7.87258 -23.4242,-1.27633 -98.0198,-6.54137 -117.214,3.49893 z"
         id="path3014"
         sodipodi:nodetypes="czzzcccccsccccscccsszc" />
      <g
         transform="matrix(0.8659397,0,0,0.8659397,606.81595,-394.22512)"
         id="g2953">
        <path
           style="fill:none;stroke:#000000;stroke-width:8;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 286.75705,216.6243 c -1.88218,-6.21883 15.68802,-6.75525 18.46567,-2.826 1.53751,2.17495 4.57415,1.0589 7.86143,1.05824"
           id="path3191"
           sodipodi:nodetypes="csc" />
        <path
           style="fill:none;stroke:#000000;stroke-width:8;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 161.62441,54.49482 c 0.0627,0.270025 -35.0189,18.615621 -46.9721,46.97209 -11.88931,28.20491 -18.902648,34.65365 -28.284267,40.91118 -9.381619,6.25753 -28.92459,23.48605 -30.692357,39.90103 -1.770866,16.44376 -2.390139,33.08249 16.045145,51.51778 0,0 23.156458,20.87092 32.263599,40.3702 0,0 6.1222,16.95595 24.0524,33.62347 0,0 18.4539,17.63473 51.77963,36.32255 0,0 84.85079,43.58764 103.78387,48.7828 0,0 13.27761,3.43182 19.11135,4.19774 21.28637,2.79472 48.18723,18.36201 72.55999,18.5307 0,0 57.07362,3.53552 76.77159,-6.06092 0,0 34.85027,-23.73858 34.34519,-44.44671 0,0 2.72175,-18.33443 -3.53553,-41.92133 0,0 -4.28644,-20.01139 -3.48462,-44.44399 0.69409,-21.14973 2.9274,-43.96917 20.15214,-68.6931 0,0 21.46573,-36.11295 -1.01016,-56.06346 0,0 -24.6134,-16.33405 -26.76904,-29.7995 -1.23503,-9.09137 5.02185,-15.1523 -7.57615,-28.536813 0,0 -28.47921,-31.376881 -81.82235,-36.112954 C 328.29958,54.747358 324.0354,51.928142 296.98485,50.45421 269.9343,48.980278 183.7902,42.900135 161.62441,54.49482 z"
           id="path2454"
           sodipodi:nodetypes="czzzcccccsccccscccsszc" />
        <path
           style="fill:none;stroke:#000000;stroke-width:8;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 101.01526,218.64461 c 0,0 -16.911918,-22.75372 2.0203,-47.72971 13.04434,-17.20852 38.48672,-13.09607 50.50762,-5.3033 12.26098,7.94841 26.24589,12.36044 40.15358,12.6269 7.84938,0.15039 21.71827,-3.03045 35.35533,-18.18274"
           id="path3246"
           sodipodi:nodetypes="cssss" />
        <path
           style="fill:none;stroke:#000000;stroke-width:8;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 399.01026,180.25881 c 0,0 11.14805,9.43502 24.54419,4.73631 0,0 -2.60039,-10.18952 14.85176,-12.56499 19.39241,-2.63956 20.4118,0.883 26.01142,5.55584"
           id="path3248"
           sodipodi:nodetypes="ccsc" />
        <path
           style="fill:none;stroke:#000000;stroke-width:3;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 178.92857,121.92857 c 0,0 22.30996,-28.140613 49.10714,-29.642856 20.50414,-1.141848 -1.55627,-4.278294 33.57143,-2.857143 5.90461,0.240102 18.03571,-0.714286 25.71429,3.035714"
           id="path3250"
           sodipodi:nodetypes="cssc" />
        <path
           style="fill:none;stroke:#000000;stroke-width:3;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 307.85714,346.92857 74.64286,0"
           id="path2386" />
        <path
           style="fill:none;stroke:#000000;stroke-width:3;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 176.07143,310.5 c 0,0 4.74062,0.16744 12.41322,4.79648 22.82301,13.76958 77.71536,37.55125 111.63397,43.1894 8.34041,1.37157 37.40579,-1.02707 47.19815,1.89161 2.81495,1.6599 41.51348,2.25865 50.77917,0.28475 28.8812,-6.15268 34.11654,-15.40453 39.7612,-23.37652"
           id="path3158"
           sodipodi:nodetypes="csccsc" />
        <path
           style="fill:none;stroke:#000000;stroke-width:3;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 152.78557,310.56849 c 0,0 54.85428,33.65017 93.94419,43.81537 24.24585,6.30506 46.92509,11.83882 62.65484,13.83729 13.48059,1.71271 13.54552,3.13221 24.15039,4.03535 13.73346,1.16959 19.01047,0.62977 28.44145,2.16313 10.24185,1.66521 62.56036,2.7302 66.32824,0.79862 3.697,-1.89524 2.24121,-2.40679 6.12084,-4.21828 3.67832,-1.71749 3.25272,-0.76498 5.4129,-3.43086 1.17601,-1.4513 3.91226,-2.30893 6.59165,-3.48147 4.78489,-2.09394 3.27631,-3.2589 7.60682,-5.32744 4.6788,-2.2349 6.05585,-1.03718 5.45625,-16.43504"
           id="path3160"
           sodipodi:nodetypes="csssszssssc" />
        <path
           style="fill:none;stroke:#000000;stroke-width:3;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 126.52161,141.49421 c -7.14595,2.44368 -25.56331,-2.21426 -33.950555,3.15225 -2.042694,1.307 -6.946985,2.03274 -10.369892,4.04509"
           id="path3162"
           sodipodi:nodetypes="csc" />
        <path
           style="fill:none;stroke:#000000;stroke-width:3;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 135.53571,146.75 c 0,0 -32.68657,-1.96365 -36.195271,1.66688 -1.636453,1.69328 -4.824382,0.60259 -6.699646,1.87275 -3.563002,2.4133 -3.674739,2.12632 -4.999944,5.21438 -0.523449,1.21977 -4.299367,3.35809 -4.884786,6.75605 -0.679178,3.94217 -3.708495,3.84361 -5.139405,6.20975 -1.977201,3.26948 -2.939907,36.60395 -0.403122,40.45208 2.488668,3.77513 0.830646,7.54652 2.272842,9.09137 1.473389,1.57826 1.836031,4.91368 4.617101,7.50669 1.751468,1.63304 2.747429,2.60191 5.142142,3.10337 2.705687,0.56658 4.193123,2.62448 7.729023,3.59522 3.477156,0.95461 5.050756,-0.18941 6.565996,2.71478"
           id="path3164"
           sodipodi:nodetypes="cssssszzsszz" />
        <path
           style="fill:none;stroke:#000000;stroke-width:3;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 276.65553,94.648385 c 0,0 6.04305,1.918512 8.73077,9.331115 1.83671,5.06554 3.68841,1.15313 3.01225,16.68031"
           id="path3166"
           sodipodi:nodetypes="csc" />
        <path
           style="fill:none;stroke:#000000;stroke-width:3;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 350.14412,134.54941 c 0,0 -1.5608,-15.33232 1.71385,-18.85023 2.05866,-2.21158 0.70306,-5.80634 5.10468,-6.78239"
           id="path3168"
           sodipodi:nodetypes="csc" />
        <path
           style="fill:none;stroke:#000000;stroke-width:3;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 174.01786,141.92857 c 0,-0.11871 -6.29328,-0.0431 -7.44076,1.59105 -1.75605,2.50088 -3.78779,0.60673 -11.93424,2.24824"
           id="path3170"
           sodipodi:nodetypes="csc" />
        <path
           style="fill:none;stroke:#000000;stroke-width:3;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 169.46429,148.98214 c 0,0 -1.75822,-0.0542 -5.00015,0.229 -2.70763,0.23656 -4.71964,0.61865 -6.16057,-3.88971"
           id="path3172"
           sodipodi:nodetypes="csc" />
        <path
           style="fill:none;stroke:#000000;stroke-width:3;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 169.28571,155.94643 c 0.87132,-1.98947 2.00861,-1.36758 4.10715,-1.875"
           id="path3174"
           sodipodi:nodetypes="cc" />
        <path
           style="fill:none;stroke:#000000;stroke-width:3;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 96.21703,244.27723 c -4.197929,-5.46063 -5.932767,0.38068 -17.046324,-6.18719"
           id="path3176"
           sodipodi:nodetypes="cc" />
        <path
           style="fill:none;stroke:#000000;stroke-width:3;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 345.71429,101.57143 c -0.16913,-2.985919 6.06538,-0.87703 9.0326,-3.173215 4.25819,-3.295204 16.76788,0.119325 22.08537,-3.091238 2.87596,-1.736432 9.80499,-0.955921 13.88891,-0.678095 9.49809,0.646148 24.87937,8.212118 30.11235,16.091268 0.80266,1.20854 0.36314,3.20585 1.36765,4.47065 1.65554,2.08453 1.92244,4.911 1.54883,7.63063"
           id="path3178"
           sodipodi:nodetypes="csssssc" />
        <path
           style="fill:none;stroke:#000000;stroke-width:3;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 165.15994,118.38697 c 14.39137,-15.9036 17.77709,-18.602164 32.12941,-25.677901 4.11824,-2.030299 6.03697,-4.582112 11.00352,-5.139077 3.0889,-0.346399 4.44987,-2.531891 6.19119,-2.576435 3.71742,-0.0951 2.01991,-2.255678 8.00281,-2.312542 2.52762,-0.02367 4.16512,-1.977602 8.24366,-2.314557 4.99418,-0.412602 4.23829,-2.06224 13.58063,-2.564161 9.25332,-0.497139 8.02661,-1.695337 11.74854,-2.023513 9.38814,-0.827785 33.11995,-0.872566 34.79448,1.18051 1.57113,1.926301 7.02077,0.92165 9.65877,1.363397 2.5511,0.427197 1.49471,2.06719 5.3945,2.297535 3.90402,0.230596 8.53354,-0.589997 11.08567,1.762161 1.30983,1.207202 22.31476,0.699847 28.89649,0.809564 13.61332,0.226932 18.80665,0.587745 26.43078,-0.307737 2.99154,-0.351368 0.60135,-2.254057 6.38221,-2.436612 0,0 8.09457,-0.18777 19.13899,-0.149776 2.3119,0.008 2.05541,-2.062717 4.71403,-2.431266 2.64712,-0.366955 6.84976,-0.729607 9.5266,1.034332 1.77074,1.166855 1.06251,1.919954 2.65532,3.37393 0.37431,0.341687 2.2167,0.438775 3.01175,1.018705 0.77277,0.563686 0.22408,0.988135 1.30077,1.761037"
           id="path3180"
           sodipodi:nodetypes="cssssszsszzssscsssssc" />
        <path
           style="fill:none;stroke:#000000;stroke-width:3;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 152.40676,107.90664 c 4.30853,-6.74526 8.99109,-6.84891 14.83355,-10.839887 18.05057,-12.3303 47.23928,-33.523884 88.086,-35.346836 4.5474,-0.202947 13.84494,-1.184791 32.91222,-0.166428 3.43979,0.183716 0.7632,2.012541 5.34064,2.079148 3.93173,0.05721 8.92263,0.138943 13.1411,0.182078 2.80651,0.0287 1.34026,2.330635 4.30794,2.233761 6.58503,-0.214957 11.49706,-0.02955 18.28322,-0.121206 1.89552,-0.0273 2.144,2.529229 4.04198,2.57434 11.6267,0.273343 30.5702,0.427216 46.0827,-0.172135 3.40382,-0.131512 1.7855,-2.86368 4.28859,-3.108474 9.42778,-0.922008 17.38216,0.142171 17.5584,0.13296"
           id="path3182"
           sodipodi:nodetypes="cssssssssssc" />
        <path
           style="fill:none;stroke:#000000;stroke-width:3;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 429.69364,146.67125 c 2.86752,-3.09407 7.28318,-1.61848 11.19517,0.85703 1.95873,1.23948 1.33283,1.5333 2.67904,2.23723 1.35205,0.70698 1.35316,-1.97294 2.46943,-2.64927 1.89331,-1.14714 20.00113,-0.83443 22.39852,0.17308 4.99801,2.10043 4.67033,8.91233 13.74162,11.75663 2.28154,0.71537 0.3974,1.48746 5.09357,2.69614 1.4927,0.38418 3.18194,3.88054 3.47528,7.30199 0.15404,1.79669 1.72656,4.28315 3.43728,5.41952 1.70373,1.13171 1.41938,10.23126 0.6212,14.64056 -0.26905,1.4863 -1.6224,1.05012 -1.9369,1.93144 -1.2208,3.42101 0.73147,8.39158 -1.16267,10.644 -1.8399,2.1879 -0.99868,5.60536 -2.41978,6.7283 -1.74414,1.37821 -2.49983,3.35175 -4.45072,4.41014 -2.98982,1.62203 -5.96142,1.85877 -8.95203,3.09153 -2.81619,1.16086 -5.67783,3.3408 -7.6892,4.12583 -2.82906,1.10417 -3.46349,0.5775 -3.90209,2.39728"
           id="path2410"
           sodipodi:nodetypes="csssssssssssssssc" />
        <path
           style="fill:none;stroke:#000000;stroke-width:3;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 462.14286,159.16071 c 0.13989,1.04546 -0.34125,1.71039 0.71558,1.93311 4.49952,0.94825 4.71057,-0.66252 6.57767,1.93828 0.83205,1.15902 2.06615,0.336 3.42497,1.1471 2.33638,1.39463 4.76976,4.02583 5.60022,5.88137 1.448,3.23536 -0.90072,9.84429 0.0282,13.79992 0.53487,2.27776 2.37809,1.52159 2.48511,3.10783 0.37727,5.59212 0.51883,8.79925 -1.61916,10.44973 -4.79359,3.70053 -7.4874,9.47379 -11.94469,8.88552"
           id="path3183"
           sodipodi:nodetypes="csssssssc" />
        <path
           style="fill:none;stroke:#000000;stroke-width:3;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 410.50322,220.58294 c -2.26152,-2.68343 -3.61923,-1.84831 -5.82784,-3.35837 -1.37264,-0.93849 -1.78604,-2.20366 -3.24552,-3.05181 -2.12611,-1.23555 -5.30693,0.4234 -7.67048,-0.64373 -0.98808,-0.4461 -0.91853,-1.4305 -1.83923,-2.06931 -1.08636,-0.75374 -2.25752,-0.23029 -3.57956,-1.04226 -1.22697,-0.75359 -0.86541,-1.08006 -2.13457,-2.0615 -2.05691,-1.5906 -1.49701,-1.2229 -3.73108,-1.53725"
           id="path3185"
           sodipodi:nodetypes="cssssssc" />
        <path
           style="fill:none;stroke:#000000;stroke-width:3;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 218.92857,204.07143 c 0.13495,-3.41747 3.1154,-2.9188 9.81648,-2.69498 4.32088,0.14432 16.89147,0.22534 20.74576,0.39448 4.53585,0.20296 1.38593,-1.89955 4.34055,-2.46339 4.49944,-0.85865 4.54999,-7.07478 1.25793,-7.11111"
           id="path3187"
           sodipodi:nodetypes="csssc" />
        <path
           style="fill:none;stroke:#000000;stroke-width:8;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 272.67806,220.79118 c -7.59456,-1.52866 -7.52571,-7.65285 -7.42152,-11.42306 0.12944,-4.68388 -0.4124,-10.19053 3.03041,-11.04909 1.63638,-0.40807 1.66385,0.81341 3.9651,-0.525 4.00642,-3.473 6.08884,-1.58354 14.505,-1.94098"
           id="path3189"
           sodipodi:nodetypes="csscc" />
        <path
           style="fill:none;stroke:#000000;stroke-width:8;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 379.89133,212.9102 c -0.39876,-2.07165 0.60637,-5.10762 0.66468,-6.26888 0.20461,-4.11942 -3.47068,-5.06179 -8.15526,-4.67057"
           id="path3193"
           sodipodi:nodetypes="csc" />
        <path
           style="fill:none;stroke:#000000;stroke-width:8;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 334.47698,227.47326 c 5.18232,6.19625 10.29568,5.72398 17.04928,2.15281 6.43811,-3.40435 12.36197,-9.70979 13.50379,-15.82615 0.9764,-5.23025 6.12879,-7.96807 6.10056,-10.1569 -0.0513,-3.97404 -1.64635,-6.18806 -4.93745,-9.04235 -2.98441,-2.5883 -6.5046,-1.3428 -9.92688,-4.44957 -3.17911,-2.88602 -3.82458,-3.38332 -6.5493,-7.41993 -2.92806,-4.33786 1.46583,-16.44099 -2.27009,-21.75415 -3.77417,-5.36755 -7.7477,-3.29105 -13.23514,-7.73717"
           id="path3195"
           sodipodi:nodetypes="csssssssc" />
        <path
           style="fill:none;stroke:#000000;stroke-width:8;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 291.80782,149.82797 c 0,0 -2.045,-2.02157 -5.42545,-5.57266 -1.45726,-1.53082 -2.64867,-4.16831 -4.88123,-5.69089 -1.37644,-0.93871 -3.67498,-1.28901 -5.39401,-2.29716 -0.9697,-0.56869 -2.35268,-2.46496 -4.82129,-3.73104 -2.55391,-1.30982 -4.93606,-1.3582 -6.15894,-1.90087 -1.60785,-0.71351 -1.9351,-2.13478 -3.76507,-2.73099 -2.12832,-0.69342 -4.51196,-0.92704 -6.90153,-1.43303 -3.51344,-0.74397 -2.99355,-3.0154 -7.35173,-3.28614 -6.78936,-0.42176 -19.7858,-2.48163 -22.22789,-0.1184 -3.54881,3.4342 -9.08663,1.63682 -13.16297,2.31989 -3.19751,0.5358 -3.13165,3.02591 -5.9953,3.10938 -2.3147,0.0675 -3.44969,2.21117 -5.16008,3.04936 -2.61527,1.28163 -4.3115,0.24932 -6.3014,1.82049 -5.99636,4.73458 -10.28689,13.17906 -10.28689,13.17906 2.36847,0.0996 3.23061,1.85907 4.4159,2.74547 1.48961,1.11398 3.05063,1.50741 3.79159,2.93664 3.12178,-0.79345 3.00276,-2.51555 6.78897,-3.75987 2.68548,-0.88258 4.12723,-0.0485 7.14328,-0.87963 10.63463,-2.93059 30.04684,-4.14697 47.20645,0.60411 3.67212,1.01671 6.42575,4.554 10.19581,6.94966 2.36961,1.50575 4.79486,1.72374 7.54709,3.09127 2.36365,1.17447 4.0246,1.8204 6.35002,3.46464 7.76816,-7.42687 7.35323,-4.74992 10.01812,-6.69221 3.08276,-2.24685 4.37655,-5.17708 4.37655,-5.17708 z"
           id="path3197"
           sodipodi:nodetypes="cssssssssssssscscssssscsc" />
        <path
           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
           d="m 204.42962,129.01907 c 0,0 -1.44861,19.35612 22.20725,18.28319 23.78187,-1.07864 19.27825,-23.10087 19.27825,-23.10087 -13.66662,-0.49856 -27.46264,0.68508 -41.4855,4.81768 z"
           id="path3201"
           sodipodi:nodetypes="czcc" />
        <path
           style="fill:none;stroke:#000000;stroke-width:8;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 418.96077,143.89332 c -4.71181,-2.75396 -9.3071,-7.36181 -11.61177,-7.64139 -6.26899,-0.76049 -13.02697,-2.45509 -26.39522,-1.70252 -3.4777,0.19578 -3.84305,0.88061 -7.09638,2.1475 -1.89943,0.73965 -5.41352,0.32879 -7.15001,1.65234 -2.69976,2.05774 -7.91013,2.47843 -9.78799,4.69994 -5.69876,6.74161 -7.7773,10.4778 -11.06842,15.99642 5.22562,0.85349 3.09314,1.02102 9.66829,0.45836 4.86804,-0.41658 3.65105,-2.91119 11.40052,-3.54307 2.24714,-0.18323 3.05657,-2.43865 6.69818,-3.0271 3.95682,-0.63939 12.43658,0.42026 13.36605,-1.47313 0.83932,-1.70973 19.27799,-0.41788 22.40053,-1.56766 6.70939,-2.47055 6.84578,-1.98073 9.57622,-5.99969 z"
           id="path3211"
           sodipodi:nodetypes="cssssscsssssc" />
        <path
           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
           d="m 383.35289,133.66553 c -13.01458,3.01296 -28.37209,8.05592 -35.1028,20.32932 1.29969,6.2487 7.67721,5.4209 20.07678,3.28299 12.52218,-2.15904 19.24687,-13.42185 15.02602,-23.61231 z"
           id="path3221"
           sodipodi:nodetypes="cczc" />
        <path
           style="fill:none;stroke:#000000;stroke-width:8;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 136.96428,176.75 c -0.0141,7.31931 -1.61039,5.43874 -2.05277,8.48416 -0.27489,1.89244 -0.54623,5.6923 -1.32876,7.03265 -1.64296,2.81412 -4.4888,2.60472 -6.34975,4.37947 -2.6231,2.50161 -5.23298,2.12418 -7.41168,4.71464 -1.95826,2.32836 -5.12309,2.26943 -9.10703,1.28193"
           id="path3231"
           sodipodi:nodetypes="cssssc" />
        <path
           style="fill:none;stroke:#000000;stroke-width:8;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 133.84521,186.8248 c 10.74284,-1.49665 174.52942,100.25739 290.50605,44.0965 5.25996,-2.5471 4.18453,-7.0699 9.56855,-10.22629 4.22201,-2.47516 8.27365,-19.39433 8.81915,-30.33096 2.20978,8.26485 1.65633,12.27249 3.32121,19.8617 1.6621,7.57651 4.15783,5.17863 5.31384,12.06978 7.00997,41.78757 2.01135,85.56404 -17.51349,96.35418 -60.24601,19.34152 -130.89237,16.59841 -173.122,5.57659 -78.67061,-20.53281 -111.04058,-81.62222 -130.19566,-122.50732 -2.51935,-5.37738 0.68368,-9.61961 3.30235,-14.89418 z"
           id="path3233"
           sodipodi:nodetypes="csscsscssc" />
        <path
           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:8;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"
           d="m 133.06965,221.61379 c 0.96384,0.0876 10.24162,0.84135 25.73657,7.94874 14.95651,6.86041 37.70303,21.15636 56.26091,21.35413 10.81711,0.11528 47.58422,15.6478 58.17281,17.66941 34.41234,6.57011 160.73583,12.2465 181.32871,-23.17242 0.47218,4.17894 2.43853,30.28057 -13.43312,40.8499 -24.99514,9.19423 -42.72285,9.46491 -102.9155,6.91557 -24.90217,-1.05468 -49.1556,-6.54341 -73.89041,-16.59601 -12.93151,-5.25556 -31.1442,-7.43872 -40.62621,-12.24732 -29.52526,-14.9731 -53.9128,-24.29397 -90.63376,-42.722 z"
           id="path3235"
           sodipodi:nodetypes="csssccsssc" />
        <path
           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:round;stroke-linejoin:miter;stroke-opacity:1"
           d="m 185.58855,206.28799 c -2.77886,8.98251 -4.54741,20.15498 0,33.76578 l 21.72729,6.68491 c -8.31806,-8.21062 -21.3597,-16.14678 -14.21819,-33.93838 l -7.5091,-6.51231 z"
           id="path3186"
           sodipodi:nodetypes="ccccc" />
        <path
           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
           d="m 176.96226,270.6155 c 6.03864,-0.49081 10.87029,-4.79747 5.55921,-17.62676 -0.68386,-1.65191 0.41843,-3.92116 -0.13697,-6.03393 l 11.09095,4.9293 c 0.42288,6.81535 1.47285,14.81448 -0.0993,18.88213 -1.59358,4.12323 -5.82714,4.28819 -8.0341,7.24323 l -8.37983,-7.39397 z"
           id="path3188"
           sodipodi:nodetypes="csccscc" />
        <path
           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
           d="m 245.47969,256.99828 c 1.28425,-1.29201 0.71772,-2.96287 2.0767,-3.17638 2.21372,-0.34781 1.79441,-6.3723 1.68688,-11.23714 -0.0627,-2.83656 2.99449,2.70149 2.82937,-8.50778 l 9.1422,3.96849 c -1.01042,2.42452 -0.25853,5.20413 -1.03142,6.73621 -0.40182,0.7965 -2.49193,-0.0132 -2.65026,1.44016 -0.69639,6.3926 2.93309,10.98384 -4.43473,13.49383 l -7.61874,-2.71739 z"
           id="path3190"
           sodipodi:nodetypes="cssccsscc" />
        <path
           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
           d="m 305.55566,248.24875 c 0,0 2.09042,1.80808 2.71112,3.26567 0.62071,1.45758 0.40132,17.90874 0.0616,18.36168 l 10.84449,0.7394 c 0,0 -1.26769,1.56154 -1.60203,-1.78688 -0.33367,-3.34177 -0.12323,-20.3334 -0.12323,-20.3334 l -11.89196,-0.24647 z"
           id="path3192"
           sodipodi:nodetypes="czcczcc" />
        <path
           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
           d="m 348.31743,251.0831 c 0.86831,2.04865 0.15761,7.35801 2.09295,8.64568 2.15043,1.43078 1.20116,8.76536 0.24847,11.44127 l 9.85862,-0.43132 c -0.39792,-4.15651 1.24825,-14.27573 -0.63017,-14.51057 -1.98629,-0.24833 -2.06748,-2.05036 -1.03347,-5.57637 l -10.5364,0.43131 z"
           id="path3194"
           sodipodi:nodetypes="csccscc" />
        <path
           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
           d="m 394.09841,244.49015 c -1.0101,12.69527 0.53482,12.48922 2.71278,13.55288 1.14503,0.55921 0.40599,3.07594 0.56588,5.81911 0.10309,1.76875 2.14176,-0.48627 1.65065,3.79577 l 6.90103,-1.35556 c 3.08361,-6.17393 1.61347,-7.75231 -0.32526,-9.31823 -0.61635,-0.49783 -0.10295,-1.77046 -0.47205,-2.90052 -0.42339,-1.2963 -2.37583,-0.82466 -2.33368,-2.43211 0.0835,-3.18376 0.40762,-6.54113 -0.31953,-9.00983 l -8.37982,1.84849 z"
           id="path3196"
           sodipodi:nodetypes="cssccssscc" />
        <path
           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
           d="m 420.22375,235.24769 c -0.0665,2.05689 -0.51511,7.52889 1.16898,7.31984 2.3817,-0.29565 2.67329,15.40632 0.0735,15.66403 -1.52618,0.15129 -0.82063,3.9491 -1.11929,5.11321 l 10.35156,-3.45053 c 1.49789,-2.88503 2.49228,-18.57011 -0.39759,-21.59809 -1.39701,-1.46379 -0.14947,-5.94806 -0.83474,-7.60807 l -9.24246,4.55961 z"
           id="path3198"
           sodipodi:nodetypes="cssccscc" />
        <path
           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
           d="m 441.29655,254.22554 c -9.3e-4,-1.15815 0.5939,-3.70782 0.39862,-4.9541 -0.2818,-1.79848 -1.40862,-2.21664 -1.62238,-3.02714 -0.52083,-1.97471 0.10625,-2.27807 -0.41438,-5.21836 -0.13088,-0.73914 -1.91041,-0.25313 -1.85367,-1.92028 0.1502,-4.41253 -1.63726,-4.87681 -1.98612,-6.7048 -0.73383,-3.84522 -2.77836,-3.70415 -3.76452,-5.28653 l 8.13336,-8.87276 c -0.24882,4.36778 0.4539,4.87694 2.79656,7.15599 1.01125,0.98379 2.13641,4.65828 2.17373,7.03779 0.081,5.16376 4.03478,5.86593 6.24389,9.59015 -0.0761,7.53389 -7.08016,8.79451 -10.10509,12.20004 z"
           id="path3200"
           sodipodi:nodetypes="csssssccsscc" />
        <path
           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
           d="m 231.9633,311.13815 c 2.79846,-7.8789 0.41099,-16.30639 10.28237,-23.35318 0.58519,-3.65129 0.86275,-8.96351 -0.87139,-17.25347 l 9.06243,2.61416 c 1.34851,9.84069 0.49409,16.74603 -0.47927,20.08548 -5.90965,3.94335 -5.43932,9.21933 -6.20332,12.13642 -0.56704,2.16505 -2.26074,1.91711 -2.55608,4.42021 -0.34739,2.94417 3.093,4.7509 3.66179,5.88159 l -12.89653,-4.53121 z"
           id="path3202"
           sodipodi:nodetypes="cccccsscc" />
        <path
           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
           d="m 298.62442,289.96344 c 0.33322,14.17025 1.25139,20.29041 0.0812,25.96864 -0.3454,1.67599 -2.34902,1.32687 -2.35072,3.05121 -0.002,1.67608 1.97672,1.83156 2.69977,3.39876 0.88745,1.92352 -1.71974,4.09068 -3.91579,6.00957 l 16.99206,1.5685 c -0.65697,-8.00778 -5.68858,-3.49444 -6.54753,-6.87671 -0.22934,-0.90306 1.95116,-1.16127 2.21471,-3.12522 0.60402,-4.50104 -0.0518,-13.51549 0.67299,-28.0777 l -9.84668,-1.91705 z"
           id="path3204"
           sodipodi:nodetypes="csssccsscc" />
        <path
           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
           d="m 345.5922,296.23743 c 0.83705,3.47753 1.27065,5.52347 1.26826,8.19154 -10e-4,1.15128 -2.72491,0.9404 -2.45476,2.78248 0.49425,3.37025 0.65919,7.87096 -0.0339,10.83749 -0.29579,1.26596 -1.77238,1.43253 -2.26867,2.49116 -0.60576,1.29214 0.51902,4.4731 0.0501,5.8901 -0.68631,2.07371 -0.97866,0.62884 -3.09636,3.09423 l 24.92167,0.34856 c 1.2261,-2.31113 0.26063,-3.03295 -3.13425,-3.10312 -7.26328,-0.15409 -5.38833,0.62436 -7.86019,0.88831 -2.63572,0.28146 -2.94071,-1.88454 -3.0781,-2.33707 -0.31511,-1.03791 3.41936,-1.45628 3.47008,-2.87985 0.15038,-4.30863 -0.10642,-8.48802 -0.24387,-11.73298 -0.0705,-1.66498 2.01769,-0.86591 2.14992,-2.45205 0.10743,-1.28864 -0.53882,-2.6255 -0.1493,-3.81891 1.0371,-3.17742 2.367,-3.62914 7.10293,-6.97995 l -16.64349,-1.21994 z"
           id="path3206"
           sodipodi:nodetypes="csssssccssssssscc" />
        <path
           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
           d="m 382.7133,298.15448 c 0.30017,2.22451 0.25232,5.29285 -1.61414,5.48365 -1.7477,0.17866 0.28382,5.85934 -1.39296,6.38596 -3.82508,1.20132 -1.42735,4.8052 -2.94859,5.25128 -2.01933,0.59213 -0.22872,3.18755 -2.55673,4.76129 -0.7016,0.47428 -0.20079,3.37445 -1.45752,3.94636 -3.36737,1.53241 -3.63642,-1.21009 -7.37067,5.36712 l 25.96734,-4.26979 c -3.2171,-0.33698 -7.79353,0.29699 -8.01676,-2.17847 0.41362,-3.36414 1.90899,-2.68535 2.67276,-4.48138 0.59775,-1.40565 0.1283,-3.29754 1.5547,-4.11299 1.55729,-0.89028 1.02754,-4.13495 1.54717,-5.72529 0.38642,-1.18264 1.50102,-1.16041 1.94214,-1.95926 0.76234,-1.38058 0.12969,-5.64132 1.14653,-6.07947 2.37251,-1.0223 8.90184,0.65339 9.34869,-3.08612 l -18.82196,0.69711 z"
           id="path3208"
           sodipodi:nodetypes="cssssscccssssscc" />
        <path
           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
           d="m 410.72961,296.04163 c -5.57819,5.97761 -4.64804,10.14298 -6.28976,13.17417 -1.16152,2.14457 -3.41185,2.25382 -5.035,8.16333 -0.15552,1.05135 0.0913,1.57803 1.86302,1.93278 0.31122,0.0623 0.25393,0.86012 0.41574,1.86516 -0.40883,1.58126 -5.8909,0.71019 -8.04859,1.30771 -2.06683,0.57237 -1.95553,1.31686 -3.13806,2.76644 l 35.70061,-6.76724 c -8.0996,-1.59353 -9.87607,-1.21343 -11.59023,0.9703 -0.50186,0.63933 -3.78255,0.0972 -3.87773,-0.34882 -0.51052,-1.99078 -0.99092,-4.03843 1.05604,-4.8143 1.24095,-0.47037 0.17725,-2.87155 1.17294,-4.80985 0.31229,-0.60793 1.1457,-0.55766 1.5226,-1.22061 0.80398,-1.41415 -0.2607,-2.94441 2.33308,-3.61204 1.2164,-0.3131 0.0363,-2.93308 0.85683,-4.09305 1.17011,-1.65407 1.96408,0.71341 2.31167,-5.61884 l -9.25316,1.10486 z"
           id="path3210"
           sodipodi:nodetypes="cscscsccscssssscc" />
        <path
           style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
           d="m 428.75254,292.72706 c -0.79989,6.69426 -3.1707,5.48921 -3.14641,7.66338 0.0186,1.66663 0.29478,3.34782 -0.10105,4.72289 -0.45007,1.56346 -2.8636,-1.50793 -2.00059,3.49602 1.88402,2.28646 2.61367,2.02173 4.57031,2.9467 1.45759,-1.22748 1.4895,-2.05313 2.54325,-2.09683 0.83111,-0.0345 2.41311,0.54036 2.2777,1.98132 -0.5606,0.87521 -2.35124,1.1475 -2.59126,1.82793 -1.18379,3.35601 -3.62665,1.21148 -4.57654,2.19885 -0.89822,0.93366 -0.58027,1.9275 -1.11861,3.50003 6.10939,-1.63447 11.76126,-4.71194 15.67512,-8.90788 -4.4575,0.90681 -5.64331,0.58869 -6.62912,-1.79539 -0.67763,-1.60594 -0.18123,-4.61605 2.13011,-6.30417 0.9334,-0.68171 0.41184,-2.16914 0.89892,-3.33885 0.3745,-0.89937 1.35182,-0.73405 1.70116,-1.61917 0.5261,-1.33298 -0.0657,-2.86401 0.93582,-3.36964 2.41909,-1.22135 1.74237,-3.9501 1.99891,-4.63406 l -12.56772,3.72887 z"
           id="path3212"
           sodipodi:nodetypes="cssccscsscccsssscc" />
      </g>
    </g>
  </g>
</svg>
eof)

; From Pascal Costanza
; http://coding.derkeiler.com/Archive/Lisp/comp.lang.lisp/2007-11/msg00971.html
(defun string-join (list &optional (delim ""))
  (with-output-to-string (s)
   (when list
    (format s "~a" (first list))
    (dolist (element (rest list))
    (format s "~a~a" delim element)))))

(defun %problem-code-start (fontsize)
  (format nil "~a~apx;~a" #>eof><flowRoot xml:space="preserve" style="font-size:eof fontsize #>eof>font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-family:Courier New;-inkscape-font-specification:Courier New" transform="matrix(2,0,0,2,1409.2018,-915.3793)"><flowRegion><rect width="700.0" height="400.0" x="-634.375" y="106.40305" /></flowRegion>eof))

(defun %problem-code (code &optional (fontsize 40))
  (format nil "~a~a~a"
   (%problem-code-start fontsize)
   (string-join
    (mapcar #'(lambda (x) (format nil "<flowPara>~a</flowPara>" x))
            (split-sequence:split-sequence #\Newline (html-encode:encode-for-argument code))))
   "</flowRoot>"))

(defun %problem-jeer-start (fontsize)
  (format nil "~a~apx;~a" #>eof><flowRoot xml:space="preserve" style="font-size:eof fontsize #>eof>font-style:normal;font-weight:normal;text-align:end;text-anchor:end;fill:#ff0000;fill-opacity:1;stroke:none;font-family:Bitstream Vera Sans" transform="matrix(2,0,0,2,-594.73595,192.38014)"><flowRegion><rect ry="0" width="706.66187" height="100" x="371.37524" y="-33.925381" style="fill:#ff0000" /></flowRegion>eof))

(defun %problem-jeer (&optional (jeer "PROBLEM?") (fontsize 40))
  (format nil "~a~a~a"
   (%problem-jeer-start fontsize)
   (string-join
    (mapcar #'(lambda (x) (format nil "<flowPara>~a</flowPara>" x))
            (split-sequence:split-sequence #\Newline (html-encode:encode-for-argument jeer))))
   "</flowRoot>"))

(defun problem-svg (code &optional (jeer "PROBLEM?") (code-size 40) (jeer-size 40))
  (format nil "~a~a~a~a"
   *trollface-start*
   (%problem-code code code-size)
   (%problem-jeer jeer jeer-size)
   *trollface-end*))

#+cmu (defun shell (command-string)
        (let ((proc (run-program "/bin/sh"
                                 (list "-c" command-string)
                                 :wait t
                                 :input t
                                 :output t
                                 :error t)))
          (prog1 (process-exit-code proc) (process-close proc))))

(defun problem (&key (svg-filename "problem.svg") (bitmap-filename "problem.png") (code "'()") (jeer "PROBLEM?") (code-size 40) (jeer-size 40))
  (with-open-file (svg-stream svg-filename :direction :output :if-exists :rename-and-delete)
   (write-line (problem-svg code jeer code-size jeer-size) svg-stream))
  (shell (format nil "~a -e ~a ~a"
                     *inkscape-binary*
                     bitmap-filename
                     svg-filename)))

(defun problem-usage (program)
  (format t "~&Usage: ~a [options] <bitmap-file>~%" program)
  (format t "--code -c <code>~%")
  (format t "--jeer -j <jeer>~%")
  (format t "--size-code <size>~%")
  (format t "--size-jeer <size>~%")
  (format t "--help -h ~%")

  (quit))

(defun string-assoc-get (key lst default)
  (let* ((entry (assoc key lst :test #'equal))
         (value (cdr entry)))
    (if entry
        (if value value t)
        default)))

(defun problem-main (args)
  (multiple-value-bind (free argp) (getopt:getopt args '(("code" :required)
                                                         ("jeer" :required)
                                                         ("size-code" :required)
                                                         ("size-jeer" :required)
                                                         ("help" :none)))

    (if (or (member '("help") argp :test #'equal)
            (< (length free) 2))
        (problem-usage (car args)))

    (let* ((bitmap (second free))
           (bitmap-path (pathname bitmap))
           (svg (concatenate 'string (directory-namestring bitmap-path) (pathname-name bitmap-path) ".svg"))
           (code (string-assoc-get "code" argp "'()"))
           (jeer (string-assoc-get "jeer" argp "PROBLEM?"))
           (code-size (string-assoc-get "size-code" argp 40))
           (jeer-size (string-assoc-get "size-jeer" argp 40)))

      (problem :bitmap-filename bitmap :svg-filename svg :code code :jeer jeer :code-size code-size :jeer-size jeer-size)

      (quit))))

;;; With help from Francois-Rene Rideau
;;; http://tinyurl.com/cli-args
(let ((args
       #+clisp ext:*args*
       #+sbcl sb-ext:*posix-argv*
       #+clozure (ccl::command-line-arguments)
       #+gcl si:*command-args*
       #+ecl (loop for i from 0 below (si:argc) collect (si:argv i))
       #+cmu extensions:*command-line-strings*
       #+allegro (sys:command-line-arguments)
       #+lispworks sys:*line-arguments-list*
     ))

  (if (member (pathname-name *load-truename*)
              args
              :test #'(lambda (x y) (search x y :test #'equalp)))
    (problem-main args)))