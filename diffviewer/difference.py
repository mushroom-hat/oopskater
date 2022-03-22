import difflib


class Code:
    SIMILAR = 0  # starts with '  '
    RIGHT_SIDE = 1  # starts with '+ '
    LEFT_SIDE = 2  # starts with '- '
    CHANGED = 3  # either three or four lines with the prefixes ('-', '+', '?'), ('-', '?', '+') or ('-', '?', '+', '?') respectively


class Difference:
    def __init__(self, original_text, new_text):
        self.original_text = original_text
        self.new_text = new_text
        self.difference = list(difflib.ndiff(original_text, new_text))
        self.current_line_number = 0

    def __iter__(self):
        return self

    def __next__(self):
        result = {}
        if self.current_line_number >= len(self.difference):
            raise StopIteration
        currentLine = self.difference[self.current_line_number]
        code = currentLine[:2]
        line = currentLine[2:]
        result['line'] = line
        if code == '  ':
            result['code'] = Code.SIMILAR
        elif code == '- ':
            incrementalChange = self.getIncrementalChanges(self.current_line_number)
            if not incrementalChange:
                result['code'] = Code.LEFT_SIDE
            else:
                result['code'] = Code.CHANGED
                result['leftchanges'] = incrementalChange['left'] if 'left' in incrementalChange else None
                result['rightchanges'] = incrementalChange['right'] if 'right' in incrementalChange else None
                result['newline'] = incrementalChange['newline']
                self.current_line_number += incrementalChange['skiplines']
        elif code == '+ ':
            result['code'] = Code.RIGHT_SIDE
        self.current_line_number += 1
        return result

    next = __next__  # for Python 2

    def getIncrementalChanges(self, lineno):
        line_number_1 = self.difference[lineno] if lineno < len(self.difference) else None
        line_number_2 = self.difference[lineno + 1] if lineno + 1 < len(self.difference) else None
        line_number_3 = self.difference[lineno + 2] if lineno + 2 < len(self.difference) else None
        line_number_4 = self.difference[lineno + 3] if lineno + 3 < len(self.difference) else None

        changes = {}
        # ('-', '?', '+', '?') case
        if line_number_1 and line_number_1[:2] == '- ' and \
                line_number_2 and line_number_2[:2] == '? ' and \
                line_number_3 and line_number_3[:2] == '+ ' and \
                line_number_4 and line_number_4[:2] == '? ':
            changes['left'] = [i for (i, c) in enumerate(line_number_2[2:]) if c in ['-', '^']]
            changes['right'] = [i for (i, c) in enumerate(line_number_4[2:]) if c in ['+', '^']]
            changes['newline'] = line_number_3[2:]
            changes['skiplines'] = 3
            return changes
        # ('-', '+', '?')
        elif line_number_1 and line_number_1[:2] == '- ' and \
                line_number_2 and line_number_2[:2] == '+ ' and \
                line_number_3 and line_number_3[:2] == '? ':
            changes['right'] = [i for (i, c) in enumerate(line_number_3[2:]) if c in ['+', '^']]
            changes['left'] = []
            changes['newline'] = line_number_2[2:]
            changes['skiplines'] = 2
            return changes
        # ('-', '?', '+')
        elif line_number_1 and line_number_1[:2] == '- ' and \
                line_number_2 and line_number_2[:2] == '? ' and \
                line_number_3 and line_number_3[:2] == '+ ':
            changes['right'] = []
            changes['left'] = [i for (i, c) in enumerate(line_number_2[2:]) if c in ['-', '^']]
            changes['newline'] = line_number_3[2:]
            changes['skiplines'] = 2
            return changes
        # no incremental change
        else:
            return None
