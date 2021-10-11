package org.atf.marvel_heroes.custromViewes

import android.content.Context
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.graphics.Path
import android.util.AttributeSet
import android.view.View

class TriangleView @JvmOverloads constructor(
    context: Context,
    attrs: AttributeSet? = null,
    defaultAttrs: Int = 0
) :
    View(context, attrs, defaultAttrs) {

    var colorPaint: Int = Color.RED

    private val painter = Paint().apply {
        color = colorPaint
        style = Paint.Style.FILL
        isAntiAlias = true
        strokeWidth = 30f
    }

    private val path = Path()

    override fun onDraw(canvas: Canvas?) {
        canvas?.apply {
            val bottom = height.toFloat()
            val centerY = (height / 2).toFloat()

            val right = width.toFloat()

            drawColor(Color.TRANSPARENT)

            val path = path.apply {
                moveTo(0f, bottom)
                lineTo(right, centerY * 1f)
                lineTo(right, bottom)
            }

            painter.color = colorPaint

            drawPath(path, painter)
        }
    }

}