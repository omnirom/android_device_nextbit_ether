/*
* Copyright (C) 2013 The OmniROM Project
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program. If not, see <http://www.gnu.org/licenses/>.
*
*/
package org.omnirom.device;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceManager;

public class FingerprintSwitch implements OnPreferenceChangeListener {

    public static boolean isSupported(Context context) {
        boolean fingerprintWake = context.getResources().getBoolean(
            org.omnirom.device.R.bool.config_fingerprintWakeAndUnlock);

        if (fingerprintWake)
            return true;
        else
            return false;
    }

    public static boolean isEnabled(Context context) {
        boolean enabled = context.getResources().getBoolean(
            org.omnirom.device.R.bool.config_fingerprintWakeAndUnlock);

        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);

        return sharedPrefs.getBoolean(DeviceSettings.KEY_FINGERPRINT_SWITCH, enabled);
    }

    /**
     * Restore setting from SharedPreferences.
     * @param context       The context to read the SharedPreferences from
     */
    public static void restore(Context context) {
        if (!isSupported()) {
            return;
        }

        boolean enabled = isEnabled(context);
        if(enabled)
            fingerprintWake = true;
        else
            fingerprintWake = false;
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        boolean fingerprintWake = context.getResources().getBoolean(
            org.omnirom.device.R.bool.config_fingerprintWakeAndUnlock);

        Boolean enabled = (Boolean) newValue;

        if(enabled)
            fingerprintWake = true;
        else
            fingerprintWake = false;
        return true;
    }

}
