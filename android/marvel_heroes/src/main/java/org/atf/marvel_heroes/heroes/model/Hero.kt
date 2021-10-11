package org.atf.marvel_heroes.heroes.model

import androidx.annotation.ColorInt
import androidx.annotation.DrawableRes

class Hero(val id: Int, val name: String, @DrawableRes val avatar: Int, @ColorInt val color: Int)