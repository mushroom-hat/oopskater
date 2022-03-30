/* Copyright 2021 Singaporetech SIT
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.singaporetech.notepad.android

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.lifecycle.lifecycleScope
import com.singaporetech.notepad.data.DataMigrator
import com.singaporetech.notepad.ui.routes.NotepadComposeApp
import kotlinx.coroutines.launch
import org.koin.android.ext.android.get

class NotepadActivity: ComponentActivity() {
    private val migrator: DataMigrator = get()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        lifecycleScope.launch {
            migrator.migrate()
            setContent {
                NotepadComposeApp()
            }
        }
    }
}