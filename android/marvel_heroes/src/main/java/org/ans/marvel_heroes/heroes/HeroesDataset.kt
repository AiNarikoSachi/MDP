package org.ans.marvel_heroes.heroes

import androidx.core.graphics.toColorInt
import org.ans.marvel_heroes.R
import org.ans.marvel_heroes.heroes.model.Hero

class HeroesDataset {

	fun getHeroes(): List<Hero> = listOf(
		Hero(1, "Beast", R.drawable.beast, "#000fff".toColorInt()),
		Hero(2, "Capitan America", R.drawable.captain_america, "#5c3a77".toColorInt()),
		Hero(3, "Electro", R.drawable.electro, "#edc93f".toColorInt()),
		Hero(4, "Galactus", R.drawable.galactus, "#a52a2a".toColorInt()),
		Hero(5, "Star lord", R.drawable.star_lord, "#a52a2a".toColorInt())
	)

}