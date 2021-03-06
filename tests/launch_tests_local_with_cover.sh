#!/bin/sh

MOCKED_ENV=tests/mocked_Jeedom_env
PLUGIN=AlternativeMarketForJeedom

if [ -z "$PHP_FOR_TESTS" ]; then
    PHP_FOR_TESTS=php
fi

echo Version de PHP
php --version

mkdir -p $MOCKED_ENV/plugins
rm -fr $MOCKED_ENV/plugins/*
mkdir $MOCKED_ENV/plugins/$PLUGIN
mkdir $MOCKED_ENV/plugins/$PLUGIN/tests
cp -fr core $MOCKED_ENV/plugins/$PLUGIN
cp -fr desktop $MOCKED_ENV/plugins/$PLUGIN
cp -fr plugin_info $MOCKED_ENV/plugins/$PLUGIN
cp -fr tests/testsuite/* $MOCKED_ENV/plugins/$PLUGIN/tests
cp -fr tests/phpunit_local_with_cover.xml $MOCKED_ENV/plugins/$PLUGIN/phpunit.xml
cp -fr vendor $MOCKED_ENV/plugins/$PLUGIN
cp -fr .github-token $MOCKED_ENV/plugins/$PLUGIN

cd $MOCKED_ENV/plugins/$PLUGIN

$PHP_FOR_TESTS ./vendor/phpunit/phpunit/phpunit --configuration phpunit.xml
