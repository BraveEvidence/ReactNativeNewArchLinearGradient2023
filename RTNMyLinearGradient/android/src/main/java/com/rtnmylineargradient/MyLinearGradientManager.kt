package com.rtnmylineargradient

import android.graphics.Color
import android.graphics.drawable.GradientDrawable
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReadableArray
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.ViewManagerDelegate
import com.facebook.react.uimanager.annotations.ReactProp
import com.facebook.react.viewmanagers.RTNMyLinearGradientManagerDelegate
import com.facebook.react.viewmanagers.RTNMyLinearGradientManagerInterface


class MyLinearGradientManager(private val context: ReactApplicationContext) :
    SimpleViewManager<MyLinearGradient>(),
    RTNMyLinearGradientManagerInterface<MyLinearGradient> {

    private val mDelegate: ViewManagerDelegate<MyLinearGradient>

    init {
        mDelegate = RTNMyLinearGradientManagerDelegate(this)
    }

    override fun getDelegate(): ViewManagerDelegate<MyLinearGradient> {
        return mDelegate
    }

    override fun getName(): String {
        return NAME
    }

    companion object {
        const val NAME = "RTNMyLinearGradient"
    }

    override fun createViewInstance(p0: ThemedReactContext): MyLinearGradient {
        return MyLinearGradient(context)
    }

    @ReactProp(name = "color")
    override fun setColor(view: MyLinearGradient?, value: ReadableArray?) {
        val colorsCollection: ArrayList<Int> = ArrayList()
        for (i in 0 until value?.size()!!) {
            colorsCollection.add(Color.parseColor(value.getString(i)))
        }
        val colors = colorsCollection.stream().mapToInt { i -> i }.toArray()
        val gradientDrawable = GradientDrawable(
            GradientDrawable.Orientation.TOP_BOTTOM,
            colors
        )
        view!!.background = gradientDrawable
    }

}





























