/* Copyright (C) 2012  Pascal Garber
 * Copyright (C) 2012  Ole Lorenzen
 * Copyright (C) 2012  Patrick König
 *
 * This software is free software; you can redistribute it and/or
 * modify it under the terms of the Creative Commons licenses CC BY-SA 3.0.
 * License as published by the Creative Commons organisation; either
 * version 3.0 of the License, or (at your option) any later version.
 * More informations on: http://creativecommons.org/licenses/by-sa/3.0/ 
 *
 * Author:
 *	Pascal Garber <pascal.garber@gmail.com>
 */
using rpg;
using GL;
namespace rpg {
	public class OpenGLColorspace : rpg.Colorspace {
		public static GLenum parse (rpg.Colorspace colorspace) {
			switch (colorspace) {
				case rpg.Colorspace.RGB:
					return GL.GL_RGB;
				case  rpg.Colorspace.RGBA:
					return GL.GL_RGBA;
				default:
					error("Can't parse Colorspace!");
			}
		}
	}
}