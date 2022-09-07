// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import LogoAnimationController from "./logo_animation_controller"
application.register("logo-animation", LogoAnimationController)

import MapController from "./map_controller"
application.register("map", MapController)
