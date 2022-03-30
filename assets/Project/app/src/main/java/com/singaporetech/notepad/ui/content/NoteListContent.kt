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

package com.singaporetech.notepad.ui.content

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.MutableState
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.colorResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.singaporetech.notepad.R
import com.singaporetech.notepad.models.NoteMetadata
import com.singaporetech.notepad.ui.previews.NoteListPreview

@Composable
fun NoteListContent(
    notes: List<NoteMetadata>,
    onNoteClick: (Long) -> Unit
) {
    when(notes.size) {
        0 -> Column(
            modifier = Modifier
                .fillMaxWidth()
                .fillMaxHeight(),
            verticalArrangement = Arrangement.Center,
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Text(
                text = stringResource(id = R.string.no_notes_found),
                color = colorResource(id = R.color.primary),
                fontWeight = FontWeight.Thin,
                fontSize = 30.sp
            )
        }

        else -> LazyColumn {
            items(notes.size) {
                Column(modifier = Modifier
                    .clickable {
                        onNoteClick(notes[it].metadataId)
                    }
                ) {
                    Text(
                        text = notes[it].title,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis,
                        modifier = Modifier
                            .padding(
                                horizontal = 16.dp,
                                vertical = 12.dp
                            )
                    )

                    Divider()
                }
            }
        }
    }
}

@Preview
@Composable
fun NoteListContentPreview() = NoteListPreview()