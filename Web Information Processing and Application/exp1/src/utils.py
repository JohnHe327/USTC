import sqlite3

from build_index_and_matrix import DB_INDEX_PATH

'''
returns a file path
params:
    file_id: the file id stored in database
'''
def searchFilePath(file_id):
    conn = sqlite3.connect(DB_INDEX_PATH)
    c = conn.cursor()
    c.execute('''SELECT text_path
                FROM texts
                WHERE textID = {} '''.format(file_id))
    result = c.fetchone()
    if result == None:
        return 'File Not Found'

    return result