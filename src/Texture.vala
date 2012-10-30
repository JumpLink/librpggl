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
	public class OpenGLTexture : GLib.Object {
		/**
		 * Laedt das Tileset in den Texturspeicher.
		 */
		public static GLuint load_opengl_texture (GdkTexture tex)
		{
			/** Textur-ID des Tilesets */
			GLuint texID = 0;
			glGenTextures (1, &texID);
			glBindTexture (GL_TEXTURE_2D, texID);

			/* 1 Byte in der Textur meint eine Komponente */
			glPixelStorei (GL_UNPACK_ALIGNMENT, 1);

			/* Keine Texturwiederholung ausserhalb der Texelkoordinaten [0,1] */
			glTexParameteri (GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
			glTexParameteri (GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);

			/* Nearest Neighbor interpolation um nicht zu entpixeln. */
			glTexParameteri (GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
			glTexParameteri (GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);

			glTexImage2D (GL_TEXTURE_2D, 0, tex.colorspace.to_channel(), (GL.GLsizei) tex.width, (GL.GLsizei) tex.height, 0, rpg.OpenGLColorspace.parse(tex.colorspace), GL_UNSIGNED_BYTE, tex.pixels);
			return texID;
		}

		/**
		 * Bindet an dieses Tileset als Textur
		 */
		public static void bind_texture (GLuint texID){
			glBindTexture (GL_TEXTURE_2D, texID);
		}
	}
}