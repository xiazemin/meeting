https://pionion.github.io/docs/awesome-ion/awesome-ion

git submodule add https://github.com/pion/ion
git submodule add https://github.com/pion/ion-app-flutter
git submodule add https://github.com/pion/ion-app-web
 git submodule add https://github.com/pion/ion-sdk-js



cd ion
./scripts/deps_inst
./scripts/all start
./scripts/all status
cd examples/ion-pubsub
open index.html
open index.html


cd ion-app-web
npm i
npm start
