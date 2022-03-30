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

package com.singaporetech.notepad.data

import com.singaporetech.notepad.Database
import com.singaporetech.notepad.models.CrossRef
import com.singaporetech.notepad.models.Note
import com.singaporetech.notepad.models.NoteContents
import com.singaporetech.notepad.models.NoteMetadata
import com.squareup.sqldelight.runtime.coroutines.asFlow
import com.squareup.sqldelight.runtime.coroutines.mapToList
import java.util.Date

class NotepadRepository(
    private val database: Database
) {
    fun noteMetadataFlow() = database.noteMetadataQueries.getSortedByTitle().asFlow().mapToList()
    fun getNote(id: Long): Note = with(database) {
        transactionWithResult {
            val metadata = noteMetadataQueries.get(id).executeAsOne()
            val crossRef = crossRefQueries.get(metadata.metadataId).executeAsOne()
            val contents = noteContentsQueries.get(crossRef.contentsId).executeAsOne()

            Note(
                metadata = metadata,
                contents = contents
            )
        }
    }

    fun saveNote(id: Long, text: String, onSuccess: (Long) -> Unit) = try {
        val crossRef = database.crossRefQueries.get(id).executeAsOneOrNull()

        val metadata = NoteMetadata(
            metadataId = crossRef?.metadataId ?: -1,
            title = text.substringBefore("\n"),
            date = Date()
        )

        val contents = NoteContents(
            contentsId = crossRef?.contentsId ?: -1,
            text = text,
            isDraft = false
        )

        with(database) {
            crossRef?.let {
                noteMetadataQueries.update(metadata)
                noteContentsQueries.update(contents)
                onSuccess(id)
            } ?: run {
                noteMetadataQueries.insert(metadata)
                noteContentsQueries.insert(contents)

                val newCrossRef = CrossRef(
                    metadataId = noteMetadataQueries.getIndex().executeAsOne(),
                    contentsId = noteContentsQueries.getIndex().executeAsOne()
                )

                crossRefQueries.insert(newCrossRef)
                onSuccess(newCrossRef.metadataId)
            }
        }
    } catch (e: Exception) {
        e.printStackTrace()
    }

    fun deleteNote(id: Long, onSuccess: () -> Unit) = try {
        with(database) {
            crossRefQueries.get(id).executeAsOneOrNull()?.let {
                noteMetadataQueries.delete(it.metadataId)
                noteContentsQueries.delete(it.contentsId)
                crossRefQueries.delete(id)
            }
        }

        onSuccess()
    } catch (e: Exception) {
        e.printStackTrace()
    }
}