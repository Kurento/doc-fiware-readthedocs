#!/bin/bash
#
# Script to change links due to read-the-docs limitation in 2nd level sections

# arg1: search pattern
# arg2: replace string
# arg3: file in which replace
function changelink {
   grep "$1" $3 &> /dev/null
   if [ $? -eq 0 ]; then
     # echo "Replacing \"$1\" by \"$2\" in \"$3\""
     sed -i "s,$1,$2," $3
   fi
}

# ./build/html/mastering_kurento.html
changelink "#kurento-architecture" "mastering/kurento_architecture.html" "./build/html/mastering_kurento.html"
changelink "#kurento-api-reference" "mastering/kurento_API.html" "./build/html/mastering_kurento.html"
changelink "#kurento-protocol" "mastering/kurento_protocol.html" "./build/html/mastering_kurento.html"
changelink "#advanced-installation-guide" "mastering/advanced_installation_guide.html" "./build/html/mastering_kurento.html"
changelink "#working-with-nightly-builds" "mastering/kurento_development.html" "./build/html/mastering_kurento.html"
changelink "#kurento-modules" "mastering/kurento_modules.html" "./build/html/mastering_kurento.html"
changelink "#webrtc-statistics" "mastering/webrtc_statistics.html" "./build/html/mastering_kurento.html"
changelink "#kurento-java-client-javadoc" "langdoc/javadoc/index.html" "./build/html/mastering_kurento.html"
changelink "#kurento-javascript-client-jsdoc" "langdoc/jsdoc/kurento-client-js/index.html" "./build/html/mastering_kurento.html"
changelink "#kurento-javascript-utils-jsdoc" "langdoc/jsdoc/kurento-utils-js/index.html" "./build/html/mastering_kurento.html"

# ./build/html/index.html
changelink "mastering_kurento.html#kurento-architecture" "mastering/kurento_architecture.html" "./build/html/index.html"
changelink "mastering_kurento.html#kurento-api-reference" "mastering/kurento_API.html" "./build/html/index.html"
changelink "mastering_kurento.html#kurento-protocol" "mastering/kurento_protocol.html" "./build/html/index.html"
changelink "mastering_kurento.html#advanced-installation-guide" "mastering/advanced_installation_guide.html" "./build/html/index.html"
changelink "mastering_kurento.html#working-with-nightly-builds" "mastering/kurento_development.html" "./build/html/index.html"
changelink "mastering_kurento.html#kurento-modules" "mastering/kurento_modules.html" "./build/html/index.html"
changelink "mastering_kurento.html#webrtc-statistics" "mastering/webrtc_statistics.html" "./build/html/index.html"
changelink "mastering_kurento.html#kurento-java-client-javadoc" "langdoc/javadoc/index.html" "./build/html/index.html"
changelink "mastering_kurento.html#kurento-javascript-client-jsdoc" "langdoc/jsdoc/kurento-client-js/index.html" "./build/html/index.html"
changelink "mastering_kurento.html#kurento-javascript-utils-jsdoc" "langdoc/jsdoc/kurento-utils-js/index.html" "./build/html/index.html"

# ./build/html/mastering/*.html
files=(kurento_architecture kurento_API kurento_protocol advanced_installation_guide kurento_development kurento_modules develop_kurento_modules webrtc_statistics)
for i in ${files[@]}
do
   changelink "mastering_kurento.html#kurento-architecture" "mastering/kurento_architecture.html" "./build/html/mastering/${i}.html"
   changelink "mastering_kurento.html#kurento-api-reference" "mastering/kurento_API.html" "./build/html/mastering/${i}.html"
   changelink "mastering_kurento.html#kurento-protocol" "mastering/kurento_protocol.html" "./build/html/mastering/${i}.html"
   changelink "mastering_kurento.html#advanced-installation-guide" "mastering/advanced_installation_guide.html" "./build/html/mastering/${i}.html"
   changelink "mastering_kurento.html#working-with-nightly-builds" "mastering/kurento_development.html" "./build/html/mastering/${i}.html"
   changelink "mastering_kurento.html#kurento-modules" "mastering/kurento_modules.html" "./build/html/mastering/${i}.html"
   changelink "mastering_kurento.html#webrtc-statistics" "mastering/webrtc_statistics.html" "./build/html/mastering/${i}.html"
   changelink "mastering_kurento.html#kurento-java-client-javadoc" "langdoc/javadoc/index.html" "./build/html/mastering/${i}.html"
   changelink "mastering_kurento.html#kurento-javascript-client-jsdoc" "langdoc/jsdoc/kurento-client-js/index.html" "./build/html/mastering/${i}.html"
   changelink "mastering_kurento.html#kurento-javascript-utils-jsdoc" "langdoc/jsdoc/kurento-utils-js/index.html" "./build/html/mastering/${i}.html"
done
