package org.atf.marvel_heroes.heroes.adapter

import androidx.recyclerview.widget.RecyclerView
import android.view.View
import android.view.LayoutInflater
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import com.bumptech.glide.Glide

import org.atf.marvel_heroes.R
import org.atf.marvel_heroes.heroes.model.Hero


class HeroAdapter(private val heroes: List<Hero>) : RecyclerView.Adapter<HeroAdapter.HeroHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): HeroHolder {
        val inflater = LayoutInflater.from(parent.context)
        val view: View = inflater.inflate(R.layout.hero_card, parent, false)

        return HeroHolder(view)
    }

    override fun onBindViewHolder(holder: HeroHolder, position: Int) {
        val hero = heroes[position]

        Glide.with(holder.itemView.context)
            .load(hero.avatar)
            .centerCrop()
            .into(holder.avatar)

        holder.name.text = hero.name
    }

    override fun getItemCount() = heroes.size

    class HeroHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        val avatar: ImageView = itemView.findViewById(R.id.hero_avatar)
        var name: TextView = itemView.findViewById(R.id.hero_name)
    }
}