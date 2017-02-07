#!/bin/bash

cd /Users/kevin/newAdmin/public/css/landing/
lessc landing.less > landing.css

qshell account d_ZwT4XNzBpnxsSpn9erC9tWoPXyI_uK7kzWFET3 RUGMtaUGX4o7DO2_qa4B27Z1rSZdZmbKn0hdP4vS
qshell fput qeeniao-mobile qeeniao/landing/images/landing.css ./landing.css true
rm -r ./.qshell